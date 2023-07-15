.segment "CODE"

CHR:
.incbin "CHR.chr"
SpriteData:
.include "spriteData.asm"

.export CHR, SpriteData
