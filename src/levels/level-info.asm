; Include palettes, target count, CHR bank, restriction count, restriciton type

; Targets number, Index by current area
TargetsCountTable:
  .db $03, $04, $03, $03

  .db $05, $01

  .db $01

  .db $05

; Restriction table, Index by current area
RestrictionCountTable:
  .db $0F, $02, $00, $02

  .db $01, $10

  .db $00

  .db $0F

RestrictionTypeTable:
  .db TimeRestriction
  .db ThrowRestriction
  .db NoRestriction
  .db TimeRestriction

  .db JumpRestriction
  .db TimeRestriction

  .db NoRestriction
  .db JumpRestriction

ScreenCountArea:
  .db $01 ; 0
  .db $02 ; 1
  .db $05 ; 2
  .db $03 ; 3

  .db $00 ; Multiroom peach
  .db $00 ; Multiroom peach

  .db $03 ; gimmick

  .db $02

;
; #### Palette pointers
;
PalettePTRLo:
	.db <Area0Palette
  .db <Area1Palette
  .db <Area2Palette
  .db <Area3Palette

  .db <Area4Palette
  .db <Area5Palette

  .db <Area6Palette

  .db <Area7Palette

PalettePTRHi:
	.db >Area0Palette
  .db >Area1Palette
  .db >Area2Palette
  .db >Area3Palette

  .db >Area4Palette
  .db >Area5Palette

  .db >Area6Palette

  .db >Area7Palette


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
	.db $36, $0F, $36, $27 ; $04
	.db $36, $0F, $2A, $1A ; $08
	.db $36, $0F, $30, $3C ; $00
	.db $0F, $00, $0F, $30 ; $0C

	.db $36, $01, $2A, $36 ; Luigi
	.db $36, $30, $16, $0F ; $00
	.db $36, $0F, $36, $27 ; $08
	.db $36, $0F, $30, $2A ; $04

; Background chr banks
  .db CHRBank_Mario3_TileSet
  .db CHRBank_Animated1
; Sprite chr banks
  .db CHRBank_Luigi
  .db CHRBank_Mario3_SpriteTopSet
  .db CHRBank_Mario3_SpriteBottomSet
  .db CHRBank_Global_Sprites

Area3Palette:
; Day
	.db $37, $0F, $36, $27 ; $04
	.db $37, $0F, $2A, $1B ; $08
	.db $37, $0F, $30, $3C ; $00
	.db $37, $00, $0F, $30 ; $0C

	.db $37, $01, $30, $27 ; Toad
	.db $37, $30, $16, $0F ; $00
	.db $37, $0F, $30, $2A ; $08
	.db $37, $0F, $30, $2A ; $04

; Background chr banks
  .db CHRBank_Mario3_TileSet_Pipe
  .db CHRBank_Animated1
; Sprite chr banks
  .db CHRBank_Toad
  .db CHRBank_Mario3_SpriteTopSet
  .db CHRBank_Mario3_SpriteBottomSet
  .db CHRBank_Global_Sprites



Area4Palette:
; Day
	.db $0F, $07, $27, $37 ; $04
	.db $0F, $30, $16, $07 ; $08
	.db $0F, $3C, $10, $0C ; $00
	.db $0F, $00, $0F, $30 ; $0C

	.db $0F, $06, $25, $36 ; Peach
	.db $0F, $30, $16, $06 ; $08
	.db $0F, $06, $26, $30 ; $00
	.db $0F, $02, $21, $30 ; $04

; Background chr banks
  .db CHRBank_Zelda2_TileSet
  .db CHRBank_Animated1
; Sprite chr banks
  .db CHRBank_Princess
  .db CHRBank_Zelda2_SpriteTop
  .db CHRBank_Zelda2_SpriteBottom
  .db CHRBank_Global_Sprites

Area5Palette:
; Day
	.db $0F, $07, $27, $37 ; $04
	.db $0F, $30, $16, $07 ; $08
	.db $0F, $3C, $10, $0C ; $00
	.db $0F, $00, $0F, $30 ; $0C

	.db $0F, $0F, $0F, $0F ; Peach
	.db $0F, $30, $16, $06 ; $08
	.db $0F, $06, $26, $30 ; $00
	.db $0F, $02, $21, $30 ; $04

; Background chr banks
  .db CHRBank_Zelda2_TileSet
  .db CHRBank_Animated1
; Sprite chr banks
  .db CHRBank_MarioSleepingBackground12
  .db CHRBank_MarioSleepingBackground12
  .db CHRBank_MarioSleepingBackground12
  .db CHRBank_Global_Sprites

Area6Palette:
; Day
	.db $0F, $2C, $37, $30 ; $04
	.db $0F, $00, $10, $30 ; $08
	.db $0F, $31, $21, $30 ; $00
	.db $0F, $00, $0F, $30 ; $0C

	.db $0F, $05, $27, $36 ; Warrio
	.db $0F, $30, $16, $06 ; $08
	.db $0F, $06, $26, $30 ; $00
	.db $0F, $02, $21, $30 ; $04

; Background chr banks
  .db CHRBank_Gimmick_TileSet
  .db CHRBank_Animated1
; Sprite chr banks
  .db CHRBank_Wario
  .db CHRBank_Gimmick_SpriteTop
  .db CHRBank_Gimmick_SpriteBottom
  .db CHRBank_Global_Sprites

Area7Palette:
; Day
	.db $0F, $31, $13, $15 ; $04
	.db $0F, $31, $13, $15 ; $04
	.db $0F, $31, $13, $15 ; $04
	.db $0F, $00, $0F, $30 ; $0C

	.db $0F, $08, $2C, $36 ; Rosalina
	.db $0F, $30, $16, $06 ; $08
	.db $0F, $06, $26, $30 ; $00
	.db $0F, $02, $21, $30 ; $04

; Background chr banks
  .db CHRBank_Metroid_TileSet
  .db CHRBank_Animated1
; Sprite chr banks
  .db CHRBank_Rosalina
  .db CHRBank_Metroid_Sprites_Top
  .db CHRBank_Metroid_Sprites_Bottom
  .db CHRBank_Global_Sprites
