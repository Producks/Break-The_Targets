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
	.db >EnemyPointers_Level_1_2_Hi
	.db >EnemyPointers_Level_1_3_Hi

EnemyPointersByLevel_HiLo:
	.db <EnemyPointers_Level_1_1_Hi
	.db <EnemyPointers_Level_1_2_Hi
	.db <EnemyPointers_Level_1_3_Hi

EnemyPointersByLevel_LoHi:
	.db >EnemyPointers_Level_1_1_Lo
	.db >EnemyPointers_Level_1_2_Lo
	.db >EnemyPointers_Level_1_3_Lo

EnemyPointersByLevel_LoLo:
	.db <EnemyPointers_Level_1_1_Lo
	.db <EnemyPointers_Level_1_2_Lo
	.db <EnemyPointers_Level_1_3_Lo

; ----------------------------------------
; Actual pointers to enemy data here

EnemyPointers_Level_1_1_Hi:
	.db >EnemyData_Level_1_1_Area0
	.db >EnemyData_Level_1_1_Area1
	.db >EnemyData_Level_1_1_Area2
	.db >EnemyData_Level_1_1_Area3
	.db >EnemyData_Level_1_1_Area4
	.db >EnemyData_Level_1_1_Area5
	.db >EnemyData_Level_1_1_Area5
	.db >EnemyData_Level_1_1_Area5
	.db >EnemyData_Level_1_1_Area5
	.db >EnemyData_Level_1_1_Area5

EnemyPointers_Level_1_1_Lo:
	.db <EnemyData_Level_1_1_Area0
	.db <EnemyData_Level_1_1_Area1
	.db <EnemyData_Level_1_1_Area2
	.db <EnemyData_Level_1_1_Area3
	.db <EnemyData_Level_1_1_Area4
	.db <EnemyData_Level_1_1_Area5
	.db <EnemyData_Level_1_1_Area5
	.db <EnemyData_Level_1_1_Area5
	.db <EnemyData_Level_1_1_Area5
	.db <EnemyData_Level_1_1_Area5

EnemyPointers_Level_1_2_Hi:
	.db >EnemyData_Level_1_2_Area0
	.db >EnemyData_Level_1_2_Area1
	.db >EnemyData_Level_1_2_Area2
	.db >EnemyData_Level_1_2_Area3
	.db >EnemyData_Level_1_2_Area4
	.db >EnemyData_Level_1_2_Area5
	.db >EnemyData_Level_1_2_Area5
	.db >EnemyData_Level_1_2_Area5
	.db >EnemyData_Level_1_2_Area5
	.db >EnemyData_Level_1_2_Area5

EnemyPointers_Level_1_2_Lo:
	.db <EnemyData_Level_1_2_Area0
	.db <EnemyData_Level_1_2_Area1
	.db <EnemyData_Level_1_2_Area2
	.db <EnemyData_Level_1_2_Area3
	.db <EnemyData_Level_1_2_Area4
	.db <EnemyData_Level_1_2_Area5
	.db <EnemyData_Level_1_2_Area5
	.db <EnemyData_Level_1_2_Area5
	.db <EnemyData_Level_1_2_Area5
	.db <EnemyData_Level_1_2_Area5

EnemyPointers_Level_1_3_Hi:
	.db >EnemyData_Level_1_3_Area0
	.db >EnemyData_Level_1_3_Area1
	.db >EnemyData_Level_1_3_Area2
	.db >EnemyData_Level_1_3_Area3
	.db >EnemyData_Level_1_3_Area4
	.db >EnemyData_Level_1_3_Area4
	.db >EnemyData_Level_1_3_Area4
	.db >EnemyData_Level_1_3_Area4
	.db >EnemyData_Level_1_3_Area4
	.db >EnemyData_Level_1_3_Area4

EnemyPointers_Level_1_3_Lo:
	.db <EnemyData_Level_1_3_Area0
	.db <EnemyData_Level_1_3_Area1
	.db <EnemyData_Level_1_3_Area2
	.db <EnemyData_Level_1_3_Area3
	.db <EnemyData_Level_1_3_Area4
	.db <EnemyData_Level_1_3_Area4
	.db <EnemyData_Level_1_3_Area4
	.db <EnemyData_Level_1_3_Area4
	.db <EnemyData_Level_1_3_Area4
	.db <EnemyData_Level_1_3_Area4
