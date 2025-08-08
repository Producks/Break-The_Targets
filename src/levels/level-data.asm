LevelDataAreaLo:
  .db <LevelDataArea0
  .db <LevelDataArea1
  .db <LevelDataArea2
  .db <LevelDataArea3
  .db <LevelDataArea4
  .db <LevelDataArea5

LevelDataAreaHi:
  .db >LevelDataArea0
  .db >LevelDataArea1
  .db >LevelDataArea2
  .db >LevelDataArea3
  .db >LevelDataArea4
  .db >LevelDataArea5

.include "src/levels/foreground/LevelDataArea0"

.include "src/levels/foreground/LevelDataArea1"

.include "src/levels/foreground/LevelDataArea2"

.include "src/levels/foreground/LevelDataArea3"

.include "src/levels/foreground/LevelDataArea4"

.include "src/levels/foreground/LevelDataArea5"


LevelDataArea6:
  .db $FF

LevelDataArea7:
  .db $FF

LevelDataArea8:
  .db $FF

LevelDataArea9:
  .db $FF

LevelDataArea10:
  .db $FF

LevelDataArea11:
  .db $FF

LevelDataArea12:
  .db $FF

LevelDataArea13:
  .db $FF

LevelDataArea14:
  .db $FF

LevelDataArea15:
  .db $FF

LevelDataArea16:
  .db $FF
