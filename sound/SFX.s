; This file is for the FamiStudio Sound Engine and was generated by FamiStudio


.if FAMISTUDIO_CFG_C_BINDINGS
.export _sounds=sounds
.endif

sounds:
	.word @ntsc
	.word @ntsc
@ntsc:
	.word @sfx_ntsc_enter_game
	.word @sfx_ntsc_block_fallin
	.word @sfx_ntsc_block_fell
	.word @sfx_ntsc_block_merged
	.word @sfx_ntsc_new_line_from_below
	.word @sfx_ntsc_line_clear
	.word @sfx_ntsc_game_over

@sfx_ntsc_enter_game:
	.byte $82,$01,$81,$93,$80,$3f,$85,$01,$84,$95,$83,$7f,$89,$f0,$02,$81
	.byte $67,$84,$69,$02,$81,$2d,$84,$2f,$02,$81,$0c,$84,$0e,$02,$82,$00
	.byte $81,$ef,$85,$00,$84,$f1,$02,$81,$c9,$84,$cb,$02,$81,$b3,$84,$b5
	.byte $02,$81,$96,$84,$98,$02,$82,$01,$81,$93,$80,$37,$85,$01,$84,$95
	.byte $83,$77,$02,$81,$67,$84,$69,$02,$81,$2d,$84,$2f,$02,$81,$0c,$84
	.byte $0e,$02,$82,$00,$81,$ef,$85,$00,$84,$f1,$02,$81,$c9,$84,$cb,$02
	.byte $81,$b3,$84,$b5,$02,$81,$96,$84,$98,$02,$82,$01,$81,$93,$80,$34
	.byte $85,$01,$84,$95,$83,$74,$02,$81,$67,$84,$69,$02,$81,$2d,$84,$2f
	.byte $02,$81,$0c,$84,$0e,$02,$82,$00,$81,$ef,$85,$00,$84,$f1,$02,$81
	.byte $c9,$84,$cb,$02,$81,$b3,$84,$b5,$02,$81,$96,$84,$98,$02,$82,$01
	.byte $81,$93,$80,$32,$85,$01,$84,$95,$83,$72,$02,$81,$67,$84,$69,$02
	.byte $81,$2d,$84,$2f,$02,$81,$0c,$84,$0e,$02,$82,$00,$81,$ef,$85,$00
	.byte $84,$f1,$02,$81,$c9,$84,$cb,$02,$81,$b3,$84,$b5,$02,$81,$96,$84
	.byte $98,$01,$00
@sfx_ntsc_block_fallin:
	.byte $87,$6a,$88,$00,$86,$8f,$89,$f0,$01,$87,$70,$00
@sfx_ntsc_block_fell:
	.byte $82,$01,$81,$ab,$80,$bf,$89,$f0,$01,$82,$03,$81,$56,$80,$be,$01
	.byte $82,$04,$81,$b8,$80,$bd,$01,$82,$05,$81,$9d,$80,$bc,$01,$81,$f3
	.byte $80,$bb,$01,$82,$06,$81,$4d,$80,$ba,$01,$81,$ad,$80,$b9,$01,$80
	.byte $b8,$01,$80,$b7,$01,$00
@sfx_ntsc_block_merged:
	.byte $82,$00,$81,$9f,$80,$bf,$85,$00,$84,$77,$83,$bf,$89,$f0,$01,$80
	.byte $bd,$83,$bd,$01,$80,$bb,$83,$bb,$01,$80,$b9,$83,$b9,$01,$81,$8e
	.byte $80,$bf,$84,$6a,$83,$bf,$01,$80,$bd,$83,$bd,$01,$80,$bb,$83,$bb
	.byte $01,$80,$b9,$83,$b9,$01,$81,$7e,$80,$bf,$84,$5e,$83,$bf,$01,$80
	.byte $bd,$83,$bd,$01,$80,$bb,$83,$bb,$01,$80,$b9,$83,$b9,$01,$81,$9f
	.byte $80,$b8,$84,$77,$83,$b8,$01,$80,$b7,$83,$b7,$01,$80,$b6,$83,$b6
	.byte $01,$80,$b5,$83,$b5,$01,$81,$8e,$80,$b8,$84,$6a,$83,$b8,$01,$80
	.byte $b7,$83,$b7,$01,$80,$b6,$83,$b6,$01,$80,$b5,$83,$b5,$01,$81,$7e
	.byte $80,$b8,$84,$5e,$83,$b8,$01,$80,$b7,$83,$b7,$01,$80,$b6,$83,$b6
	.byte $01,$80,$b5,$83,$b5,$01,$81,$9f,$80,$b4,$84,$77,$83,$b4,$01,$80
	.byte $b3,$83,$b3,$02,$80,$b2,$83,$b2,$01,$81,$8e,$80,$b4,$84,$6a,$83
	.byte $b4,$01,$80,$b3,$83,$b3,$02,$80,$b2,$83,$b2,$01,$81,$7e,$80,$b4
	.byte $84,$5e,$83,$b4,$01,$80,$b3,$83,$b3,$02,$80,$b2,$83,$b2,$01,$81
	.byte $9f,$84,$77,$02,$80,$b1,$83,$b1,$02,$81,$8e,$80,$b2,$84,$6a,$83
	.byte $b2,$02,$80,$b1,$83,$b1,$02,$81,$7e,$80,$b2,$84,$5e,$83,$b2,$02
	.byte $80,$b1,$83,$b1,$02,$81,$9f,$84,$77,$04,$81,$8e,$84,$6a,$04,$81
	.byte $7e,$84,$5e,$03,$00
@sfx_ntsc_new_line_from_below:
	.byte $85,$03,$84,$35,$83,$7f,$89,$f0,$01,$84,$45,$01,$84,$54,$01,$84
	.byte $64,$01,$84,$73,$01,$84,$83,$01,$84,$92,$01,$84,$a2,$01,$84,$b1
	.byte $01,$84,$bf,$83,$70,$01,$84,$35,$83,$78,$01,$84,$45,$01,$84,$54
	.byte $01,$84,$64,$01,$84,$73,$01,$84,$83,$01,$84,$92,$01,$84,$a2,$01
	.byte $84,$b1,$01,$84,$bf,$00
@sfx_ntsc_line_clear:
	.byte $82,$00,$81,$bd,$80,$bf,$89,$f0,$01,$80,$bd,$01,$81,$d5,$80,$bb
	.byte $01,$81,$ed,$80,$b9,$01,$82,$01,$81,$05,$01,$81,$1d,$01,$81,$35
	.byte $01,$81,$4d,$01,$81,$65,$01,$81,$7c,$01,$81,$16,$80,$b8,$01,$81
	.byte $30,$80,$b7,$01,$81,$49,$80,$b6,$01,$81,$63,$80,$b5,$01,$81,$7c
	.byte $01,$81,$16,$80,$b4,$01,$81,$30,$80,$b3,$01,$81,$49,$01,$81,$63
	.byte $80,$b2,$01,$81,$7c,$01,$81,$16,$01,$81,$30,$01,$81,$49,$80,$b1
	.byte $01,$81,$63,$01,$81,$7c,$01,$81,$16,$01,$81,$30,$01,$81,$49,$01
	.byte $81,$63,$01,$81,$7c,$00
@sfx_ntsc_game_over:
	.byte $82,$00,$81,$b6,$80,$3f,$85,$00,$84,$5c,$83,$3f,$89,$f0,$01,$81
	.byte $f6,$80,$7f,$84,$9c,$83,$7f,$01,$82,$01,$81,$35,$80,$bf,$84,$db
	.byte $83,$bf,$01,$81,$75,$80,$ff,$85,$01,$84,$1b,$83,$ff,$01,$81,$b4
	.byte $80,$3f,$84,$5a,$83,$3f,$01,$81,$f4,$80,$7f,$84,$9a,$83,$7f,$01
	.byte $82,$02,$81,$33,$80,$bf,$84,$d9,$83,$bf,$01,$81,$73,$80,$ff,$85
	.byte $02,$84,$19,$83,$ff,$01,$81,$b2,$80,$3f,$84,$58,$83,$3f,$01,$81
	.byte $f2,$80,$7f,$84,$98,$83,$7f,$01,$82,$03,$81,$31,$80,$bf,$84,$d7
	.byte $83,$bf,$01,$81,$71,$80,$ff,$85,$03,$84,$17,$83,$ff,$01,$81,$b0
	.byte $80,$3f,$84,$56,$83,$3f,$01,$81,$f0,$80,$7f,$84,$96,$83,$7f,$01
	.byte $82,$04,$81,$2f,$80,$bf,$84,$d5,$83,$bf,$01,$81,$6f,$80,$ff,$85
	.byte $04,$84,$15,$83,$ff,$01,$81,$ae,$80,$3f,$84,$54,$83,$3f,$01,$81
	.byte $ee,$80,$7f,$84,$94,$83,$7f,$01,$82,$05,$81,$2d,$80,$bf,$84,$d3
	.byte $83,$bf,$01,$81,$6d,$80,$ff,$85,$05,$84,$13,$83,$ff,$01,$81,$ac
	.byte $80,$3f,$84,$52,$83,$3f,$01,$81,$ec,$80,$7f,$84,$92,$83,$7f,$01
	.byte $82,$06,$81,$2b,$80,$bf,$84,$d1,$83,$bf,$01,$81,$6b,$80,$ff,$85
	.byte $06,$84,$11,$83,$ff,$01,$81,$aa,$80,$3f,$84,$50,$83,$3f,$01,$81
	.byte $ea,$80,$7f,$84,$90,$83,$7f,$01,$82,$07,$81,$29,$80,$bf,$84,$cf
	.byte $83,$bf,$01,$81,$69,$80,$ff,$85,$07,$84,$0f,$83,$ff,$01,$81,$a8
	.byte $80,$3f,$84,$4e,$83,$3f,$01,$81,$e8,$80,$7f,$84,$8e,$83,$7f,$00

.export sounds
