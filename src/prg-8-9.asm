;
; Bank 8 & Bank 9
; ===============
;
; What's inside:
;
;   - Level and enemy data pointer tables
;   - Level data
;   - Enemy data
;

;
; Table to determine what "total" index a given
; level + area is. Get the starting area from this
; table (based on CurrentLevel) and add the area to it
;
LevelAreaStartIndexes:
	.db $00 ; Level 1-1
	.db $0A ; Level 1-2
	.db $14 ; Level 1-3


; Pointers to level data
include "src/levels/level-data-pointers.asm"


; Include level data;
; see src/levels/level-data.asm for level format details
include "src/levels/level-data.asm"


; Pad out any remaining space
; @TODO Verify that this is OK if unused space is reclaimed
LevelData_Unused:
unusedSpace $A500,$FF


; Pointers to enemy data
include "src/levels/enemy-data-pointers.asm"


; Include enemy data;
; see src/levels/enemy-data.asm for enemy format details
include "src/levels/enemy-data.asm"