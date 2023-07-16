;===============================================
;  __     __     __        ___   ___       ___
; |__| _ | _  _ |__/ |    |   | |    |__/ |__
; |  \   |__|   |__\ |___ |___| |___ |  \ ___|
;
;===============================================
;			MAIN SOURCE CODE FILE

;Original by MegaSparky/MoonShine, on PICO-8
;NES Port by alexmush/MoonShine

.segment "CODE"
main:
	LDA #$00	; Enter game SFX
	STA TEMP+0
	INC TEMP+0
	LDX #FAMISTUDIO_SFX_CH0
	JSR famistudio_sfx_play

	JSR vblankwait

forever:
	JMP forever

controller_read:
	; Completely stolen from nesdev
	@start:
		LDA joypad
		STA joypadOld
		LDA #$01
		STA CTRL_PORT_1
		STA joypad
		LSR A
		STA CTRL_PORT_1
	@loop:
		LDA CTRL_PORT_1
		LSR A
		ROL joypad
		BCC @loop
	@release:
		LDA joypad
		EOR #$FF
		AND joypadOld
		STA joypadRelease
	@press:
		LDA joypadOld
		EOR #$FF
		AND joypad
		STA joypadPress
	RTS

nmi_stuff:
	@controllers:
		LDA joypadPress
		AND #$80
		BEQ @end
		LDA TEMP+0
		INC TEMP+0
		LDX #FAMISTUDIO_SFX_CH0
		JSR famistudio_sfx_play
		LDA TEMP+0
		CMP #sfx_max
		BMI @end
		LDA #$00
		STA TEMP+0

	@end:
		RTS