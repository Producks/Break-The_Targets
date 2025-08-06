LevelDataAreaLo:
  .db <LevelDataArea0
  .db <LevelDataArea1

LevelDataAreaHi:
  .db >LevelDataArea0
  .db >LevelDataArea1

.include "src/levels/foreground/LevelDataArea0"

.include "src/levels/foreground/LevelDataArea1"

LevelDataArea2:
  .db $FF

LevelDataArea3:
  .db $FF

LevelDataArea4:
  .db $FF

LevelDataArea5:
  .db $FF

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
