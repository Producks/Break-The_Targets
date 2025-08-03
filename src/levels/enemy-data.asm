EnemyDataPTRLo:
  .db <EnemyData_Level_1_1_Area0
  .db <EnemyData_Level_1_1_Area1
  .db <EnemyData_Level_1_1_Area2
  .db <EnemyData_Level_1_1_Area3
  .db <EnemyData_Level_1_1_Area4
  .db <EnemyData_Level_1_1_Area5
  .db <EnemyData_Level_1_1_Area6
  .db <EnemyData_Level_1_1_Area7
  .db <EnemyData_Level_1_1_Area8
  .db <EnemyData_Level_1_1_Area9
  .db <EnemyData_Level_1_1_Area10
  .db <EnemyData_Level_1_1_Area11
  .db <EnemyData_Level_1_1_Area12
  .db <EnemyData_Level_1_1_Area13
  .db <EnemyData_Level_1_1_Area14
  .db <EnemyData_Level_1_1_Area15
  .db <EnemyData_Level_1_1_Area16

EnemyDataPTRHi:
  .db >EnemyData_Level_1_1_Area0
  .db >EnemyData_Level_1_1_Area1
  .db >EnemyData_Level_1_1_Area2
  .db >EnemyData_Level_1_1_Area3
  .db >EnemyData_Level_1_1_Area4
  .db >EnemyData_Level_1_1_Area5
  .db >EnemyData_Level_1_1_Area6
  .db >EnemyData_Level_1_1_Area7
  .db >EnemyData_Level_1_1_Area8
  .db >EnemyData_Level_1_1_Area9
  .db >EnemyData_Level_1_1_Area10
  .db >EnemyData_Level_1_1_Area11
  .db >EnemyData_Level_1_1_Area12
  .db >EnemyData_Level_1_1_Area13
  .db >EnemyData_Level_1_1_Area14
  .db >EnemyData_Level_1_1_Area15
  .db >EnemyData_Level_1_1_Area16

EnemyData_Level_1_1_Area0:
; Page 0
	distTo + ; $07 (3 enemies)
	enemy $2, $4, Enemy_Porcupo
	enemy $4, $5, Enemy_Porcupo
	enemy $6, $6, Enemy_Porcupo
	enemy $7, $7, Enemy_Porcupo
	enemy $8, $8, Enemy_VegetableLarge

; Page 1
+	distTo + ; $01 (0 enemies)

; End of enemy data
+

EnemyData_Level_1_1_Area1:
EnemyData_Level_1_1_Area2:
EnemyData_Level_1_1_Area3:
EnemyData_Level_1_1_Area4:
EnemyData_Level_1_1_Area5:
EnemyData_Level_1_1_Area6:
EnemyData_Level_1_1_Area7:
EnemyData_Level_1_1_Area8:
EnemyData_Level_1_1_Area9:
EnemyData_Level_1_1_Area10:
EnemyData_Level_1_1_Area11:
EnemyData_Level_1_1_Area12:
EnemyData_Level_1_1_Area13:
EnemyData_Level_1_1_Area14:
EnemyData_Level_1_1_Area15:
EnemyData_Level_1_1_Area16:
