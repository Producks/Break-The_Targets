; Include palettes, target count, CHR bank, restriction count, restriciton type

; Targets number, Index by current area
TargetsCountTable:
  .db $03, $00, $0F, $0F

; Restriction table, Index by current area
RestrictionCountTable:
  .db $02, $03, $0F, $0F

RestrictionTypeTable:
  .db TimeRestriction, JumpRestriction, JumpRestriction

ScreenCountArea:
  .db $01, $01, $09

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
; Day
	.db $01, $30, $12, $0F ; $00
	.db $01, $30, $16, $0F ; $04
	.db $01, $27, $17, $0F ; $08
	.db $01, $29, $1A, $0F ; $0C
	.db $01, $01, $16, $27 ; Mario
	.db $01, $30, $16, $0F ; $00
	.db $01, $38, $10, $0F ; $04
	.db $01, $30, $25, $1B ; $08

; Background chr banks
  .db CHRBank_BackgroundGrass
  .db CHRBank_Animated1
; Sprite chr banks
  .db CHRBank_Mario
  .db CHRBank_CommonEnemies1
  .db CHRBank_CommonEnemies2
  .db CHRBank_EnemiesGrass

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
  .db CHRBank_Luigi
  .db CHRBank_CommonEnemies1
  .db CHRBank_CommonEnemies2
  .db CHRBank_EnemiesDesert
