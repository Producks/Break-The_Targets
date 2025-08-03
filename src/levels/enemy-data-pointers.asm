;
; Pointers to pointers to pointers...
; I'm not entirely certain what the point of
; having pointer-pointers was, when level data
; appears to use standard split pointers just fine,
; but that's what they did here in any case
;

; -------------------------------------
; Pointers to pointers to enemy data here

EnemyPointersByLevel_HiHi:
	.db >EnemyPointers_Level_1_1_Hi

EnemyPointersByLevel_HiLo:
	.db <EnemyPointers_Level_1_1_Hi

EnemyPointersByLevel_LoHi:
	.db >EnemyPointers_Level_1_1_Lo

EnemyPointersByLevel_LoLo:
	.db <EnemyPointers_Level_1_1_Lo

; ----------------------------------------
; Actual pointers to enemy data here

EnemyPointers_Level_1_1_Hi:
	.db >EnemyData_Level_1_1_Area0

EnemyPointers_Level_1_1_Lo:
	.db <EnemyData_Level_1_1_Area0

