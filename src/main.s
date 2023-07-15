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
	LDX #FAMISTUDIO_SFX_CH1
	JSR famistudio_sfx_play

	JSR vblankwait

forever:
	JMP forever
