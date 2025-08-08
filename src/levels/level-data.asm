LevelDataAreaLo:
  .db <LevelDataArea0
  .db <LevelDataArea1
  .db <LevelDataArea2
  .db <LevelDataArea3
  .db <LevelDataArea4
  .db <LevelDataArea5

  .db <LevelDataArea6

  .db <LevelDataArea7

LevelDataAreaHi:
  .db >LevelDataArea0
  .db >LevelDataArea1
  .db >LevelDataArea2
  .db >LevelDataArea3
  .db >LevelDataArea4
  .db >LevelDataArea5

  .db >LevelDataArea6

  .db >LevelDataArea7

.include "src/levels/foreground/LevelDataArea0"

.include "src/levels/foreground/LevelDataArea1"

.include "src/levels/foreground/LevelDataArea2"

.include "src/levels/foreground/LevelDataArea3"

.include "src/levels/foreground/LevelDataArea4"

.include "src/levels/foreground/LevelDataArea5"

.include "src/levels/foreground/LevelDataArea6"

.include "src/levels/foreground/LevelDataArea7"
