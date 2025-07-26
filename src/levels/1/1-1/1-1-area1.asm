; Level 1-1, Area 1

LevelData_1_1_Area1:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 3, LevelDirection_Horizontal, 0, 0, LevelMusic_Overworld, 0, 0, $00, $0

  .db $B0, $02
  .db $01, $02
  .db $02, $02
  .db $03, $02
  .db $04, $02
  .db $05, $02
  .db $06, $02
  .db $07, $02
  .db $08, $02
  .db $09, $02
  .db $0A, $02
  .db $0B, $02
  .db $0C, $02
	.db $FF
