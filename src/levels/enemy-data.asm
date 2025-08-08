EnemyDataPTRLo:
  .db <EnemyData_Level_1_1_Area0
  .db <EnemyData_Level_1_1_Area1
  .db <EnemyData_Level_1_1_Area2
  .db <EnemyData_Level_1_1_Area3
  .db <EnemyData_Level_1_1_Area4
  .db <EnemyData_Level_1_1_Area5
  .db <EnemyData_Level_1_1_Area6
  .db <EnemyData_Level_1_1_Area7

EnemyDataPTRHi:
  .db >EnemyData_Level_1_1_Area0
  .db >EnemyData_Level_1_1_Area1
  .db >EnemyData_Level_1_1_Area2
  .db >EnemyData_Level_1_1_Area3
  .db >EnemyData_Level_1_1_Area4
  .db >EnemyData_Level_1_1_Area5
  .db >EnemyData_Level_1_1_Area6
  .db >EnemyData_Level_1_1_Area7


.include "src/levels/sprites/EnemyData_Level_1_1_Area0"
.include "src/levels/sprites/EnemyData_Level_1_1_Area1"
.include "src/levels/sprites/EnemyData_Level_1_1_Area2"
.include "src/levels/sprites/EnemyData_Level_1_1_Area3"
.include "src/levels/sprites/EnemyData_Level_1_1_Area4"
.include "src/levels/sprites/EnemyData_Level_1_1_Area5"
.include "src/levels/sprites/EnemyData_Level_1_1_Area6"
.include "src/levels/sprites/EnemyData_Level_1_1_Area7"
