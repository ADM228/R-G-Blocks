;===============================================
;  __     __     __        ___   ___       ___
; |__| _ | _  _ |__/ |    |   | |    |__/ |__
; |  \   |__|   |__\ |___ |___| |___ |  \ ___|
;
;===============================================
;			PACKED SPRITE DATA FILE

; Sprite data for the R-G-Blocks, packed very compactly into
; just 24 bytes. In order:
; Red		(001)
; Green		(010)
; Yellow	(011)
; Blue		(100)
; Magenta	(101)
; Cyan		(110)

.export SpriteXOffsets, SpriteProperties, SpriteTilesA, SpriteTilesB

SpriteXOffsets:		; Only the X offset of the first sprite, the second one is always 8
.byte $00, $04, $00, $08, $00, $00
SpriteProperties:	; Only the first properties, the second is always the same | $40
.byte $00, $00, $01, $41, $02, $02
SpriteTilesA:
.byte $03, $09, $07, $03, $03, $05
SpriteTilesB:		; Also used as sprite amount with a BEQ
.byte $00, $00, $05, $00, $03, $07

