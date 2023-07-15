
; main.asm
;
; The entrypoint to your game! 
; Everything you will write should go into files included in this file, 
; or of course this file itself.
; 
; Note: Much of this was lifted and adapted from the nerdy nights tutorials
; https://nerdy-nights.nes.science

; System defines for various registers on the console
.include "./system-defines.asm"

;
; iNES header
; 
; This declares basic information about your game. You probably don't want
; to change it.
;
.segment "HEADER"


    NES2_0_IDENTIFIER = %00001000
    MAPPER = 0 ; 0 = NROM
    SUBMAPPER = 0 ; Standard
    MIRRORING = 0 ; 0 = horizontal mirroring, 1 = vertical mirroring 
    PRG_BANK_COUNT = 2 ; 16k PRG chunk count
    CHR_BANK_COUNT = 0 ; 8k CHR chunk count
    SRAM   = 0 ; 1 = battery backed SRAM at $6000-7FFF
    TRAINER = 0 ; unneeded
    CONSOLE_TYPE = 0 ; Standard NES/Famicom
    PRG_RAM_COUNT = 0 ;
    PRG_NVRAM_COUNT = 0 ;
    CHR_RAM_COUNT =  12 ; 64 << 7 = 8KB
    CHR_NVRAM_COUNT = 0 ; 
    CPU_PPU_TIMING = 0 ; NTSC NES/Famicom
    HARDWARE_TYPE = 0; Unused
    MISC_ROMS = 0 ; No misc ROMs
    DEF_EXP_DEVICE = 0 ; Unspecified

    .byte 'N', 'E', 'S', $1A ; ID
    .byte (PRG_BANK_COUNT & $FF)
    .byte (CHR_BANK_COUNT & $FF)
    .byte MIRRORING | (SRAM << 1) | (TRAINER << 2) | ((MAPPER & $00F) << 4)
    .byte (MAPPER & $0F0) | CONSOLE_TYPE | NES2_0_IDENTIFIER
    .byte ((MAPPER & $F00) >> 8) | SUBMAPPER << 4
    .byte ((PRG_BANK_COUNT & $F00) >> 8) | ((CHR_BANK_COUNT & $F00) >> 4)
    .byte PRG_RAM_COUNT | (PRG_NVRAM_COUNT << 4)
    .byte CHR_RAM_COUNT | (CHR_NVRAM_COUNT << 4)
    .byte CPU_PPU_TIMING, HARDWARE_TYPE, MISC_ROMS, DEF_EXP_DEVICE

;
; Graphics
; 
; Includes chr files for the graphics -see the included file for more details.
;

.include "../graphics/graphicsconfig.asm"

;
; Vectors
; 
; These definitions have to be kept here so the NES knows how to reset the game, and what to call when
; it's time to redraw the screen. 
;

.segment "VECTORS"
    .word nmi
    .word reset
    .word irq

;
; ZeroPage variables 
; 
; This is a section of "special" variables that can be accessed faster than the rest, because they are in the first "page" of
; memory. It can have up to 256 bytes worth of variables in it. They otherwise work the same as all other variables.
;

.segment "ZEROPAGE"
    TEMP: .res 8
    nmiFrameCount: .res 1          ; 256 byte counter, will increment every time nmi is called. Used to wait for vblank
    vblankPreviousFrame: .res 1    ; Used to track when we started waiting for vblank

;
; OAM Memory
; 
; This is the sprite memory for your game. IT is used for "hardware" sprites (you might create more information for your)
; sprites elsewhere. Don't add anything here.
;

.segment "OAM"
    oam: .res 256        ; sprite OAM data to be uploaded by DMA

;
; BSS variables
; 
; This is the "rest" of the memory for your game. There are about 1500 bytes available in total.

.segment "BSS"
; yourvariable: .res 8


; 
; Main Code area
; 
; You know this one! This is the primary code bank for your game. There may be more banks available, but this 
; one will always be loaded. 
;

.segment "CODE"


    ;
    ; reset routine
    ;
    ; This is used to reset the NES (and sometimes memory on your cartridge) to a known state, so the game
    ; can play consistently. Don't change this unless you know what you're doing!
    ; Note: It should be the first thing written to the CODE segment, so it's always the first thing the console runs!
    ;
.segment "CODE"

    reset:
        sei       ; mask interrupts
        lda #0
        sta PPU_CTRL    ; disable NMI
        sta PPU_MASK    ; disable rendering
        sta APU_STATUS  ; disable APU sound
        sta APU_DMC_IRQ ; disable DMC IRQ
        lda #$40
        sta APU_FRAME_COUNTER ; disable APU IRQ
        cld                   ; disable decimal mode
        ldx #$FF
        txs       ; initialize stack
        ; wait for first vblank
        bit PPU_STATUS
        :
            bit PPU_STATUS
            bpl :-
        ; clear all RAM to 0
        lda #0
        ldx #0
        :
            sta $0000, X
            sta $0100, X
            sta $0200, X
            sta $0300, X
            sta $0400, X
            sta $0500, X
            sta $0600, X
            sta $0700, X
            inx
            bne :-
        ; place all sprites offscreen at Y=255
        lda #255
        ldx #0
        :
            sta oam, X
            inx
            inx
            inx
            inx
            bne :-
        ; wait for second vblank
        :
            bit PPU_STATUS
            bpl :-

		; Initialize FS

		JSR apu_init

		LDX #<sounds
		LDY #>sounds
		JSR famistudio_sfx_init

        ; NES is initialized, ready to begin!
        ; enable the NMI for graphical updates, and jump to our main program
        lda #%10001000
        sta PPU_CTRL
        jmp main

    ;
    ; NMI Handler
    ; 
    ; This will run once every frame, and give you a chance to update graphics. Keep it short!
    ;

    nmi:
        ; Store all registers - since this can run at any time, and any changes we make to the registers
        ; will impact whatever code was running before otherwise. 
        pha
        txa
        pha
        tya
        pha

        ; Tell the ppu to draw sprites from $0200 to the screen
        lda #$02
        sta OAM_DMA

        ; Keep track of how many frames have run (note: this loops over to 0 after 255.)
        inc nmiFrameCount

		; Update SFX
		jsr famistudio_update

        ; Restore all registers from the stack
        pla
        tay
        pla
        tax
        pla

        rti ; Return from interrupt 


    ; 
    ; Helper function: Wait for a vblank to happen
    ; 
    ; Waits until the frame count is incremented by the nmi method
    ; 

    vblankwait:
        lda nmiFrameCount
        sta vblankPreviousFrame

        @vblank_wait:
            cmp nmiFrameCount
            beq @vblank_wait
        rts

	;
	; From famistudio_init: APU Initialization routine
	;
	; Since there is no music for famistudio to init anyway it's better to have just this
	;

	apu_init:

		lda #$0f ; Enable channels, stop DMC
		sta FAMISTUDIO_APU_SND_CHN
		lda #$80 ; Disable triangle length counter
		sta FAMISTUDIO_APU_TRI_LINEAR
		lda #$00 ; Load noise length
		sta FAMISTUDIO_APU_NOISE_HI

		lda #$30 ; Volumes to 0
		sta FAMISTUDIO_APU_PL1_VOL
		sta FAMISTUDIO_APU_PL2_VOL
		sta FAMISTUDIO_APU_NOISE_VOL
		lda #$08 ; No sweep
		sta FAMISTUDIO_APU_PL1_SWEEP
		sta FAMISTUDIO_APU_PL2_SWEEP
		rts

    ;
    ; IRQ Handler
    ;
    ; Empty - we don't need to use them, but a handler must be present.
    irq:
        rti

.include "main.s"
.include "famistudio_ca65.s"

    ;
    ; Data
    ; 
    ; Game data is in this section. It's in the same code bank as above, and is only separated to make it easier to understand.
    ;
.include "../sound/music.s"
.include "../sound/SFX.s"
