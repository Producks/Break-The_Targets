; Level 1-1, Area 0

LevelData_1_1_Area0:
	; Level Header
	;   pages (0-indexed), orientation, background palette, sprite palette, music,
	;   AX-FX type, 3X-9X type, ground setting (0-31), ground type (0-7)
	levelHeader 1, LevelDirection_Horizontal, 4, 0, LevelMusic_Underground, 0, 0, $00, $3

	.db $FF