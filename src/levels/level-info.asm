; Include palettes, target count, CHR bank, restriction count, restriciton type

; Targets number, Index by current area
TargetsCountTable:
  .db $03, $04, $0F, $0F

; Restriction table, Index by current area
RestrictionCountTable:
  .db $0F, $02, $0F, $0F

RestrictionTypeTable:
  .db TimeRestriction, ThrowRestriction, JumpRestriction

ScreenCountArea:
  .db $01 ; 0
  .db $02 ; 1
  .db $09 ; 2

;
; #### Palette pointers
;
PalettePTRLo:
	.db <Area0Palette
  .db <Area1Palette
  .db <Area2Palette

PalettePTRHi:
	.db >Area0Palette
  .db >Area1Palette
  .db >Area2Palette

Area0Palette:
; Background
	.db $22, $36, $17, $0F ; $00
	.db $22, $29, $1A, $0F ; $04
	.db $22, $30, $21, $0F ; $08
	.db $22, $00, $0F, $30 ; $0C

; Sprites
	.db $22, $01, $16, $27 ; Mario
	.db $22, $30, $16, $27 ; Keep eye in mind for first slot, has to be white
	.db $22, $0F, $36, $17 ; $ Goombassss
	.db $22, $1A, $30, $27 ; $08

; Background chr banks
  .db CHRBANK_Mario1_TileSet
  .db CHRBank_Animated1
; Sprite chr banks
  .db CHRBank_Mario
  .db CHRBANK_Mario1_SpriteSet_Top
  .db CHRBANK_Mario1_SpriteSet_Bottom
  .db CHRBank_Global_Sprites

Area1Palette:
; Background
	.db $0F, $3C, $1C, $0F ; $00
	.db $0F, $29, $1A, $09 ; $04
	.db $0F, $30, $21, $1C ; $08
	.db $0F, $00, $0F, $30 ; $0C

; Sprites
	.db $0F, $01, $16, $27 ; Mario
	.db $0F, $30, $16, $27 ; Keep eye in mind for first slot, has to be white
	.db $0F, $0C, $3C, $1C ; $08
	.db $0F, $1C, $30, $27 ; $ Goombassss

; Background chr banks
  .db CHRBANK_Mario1_TileSet
  .db CHRBank_Animated1
; Sprite chr banks
  .db CHRBank_Mario
  .db CHRBANK_Mario1_SpriteSet_Top
  .db CHRBANK_Mario1_SpriteSet_Bottom
  .db CHRBank_Global_Sprites

Area2Palette:
; Day
	.db $11, $30, $12, $0F ; $00
	.db $11, $30, $16, $0F ; $04
	.db $11, $27, $17, $0F ; $08
	.db $11, $29, $1A, $0F ; $0C
	.db $11, $01, $2A, $36 ; Luigi
	.db $11, $30, $16, $0F ; $00
	.db $11, $38, $10, $0F ; $04
	.db $11, $30, $25, $1B ; $08

; Background chr banks
  .db CHRBank_BackgroundGrass
  .db CHRBank_Animated1
; Sprite chr banks
  .db CHRBank_Mario
  .db CHRBank_CommonEnemies1
  .db CHRBank_CommonEnemies2
  .db CHRBank_EnemiesGrass
