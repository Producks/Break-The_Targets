LevelDataAreaLo:
  .db <LevelDataArea0
LevelDataAreaHi:
  .db >LevelDataArea0

LevelDataArea0:
  .db $FD, $35
  .db $14
  .db $FD, $03
  .db $14
  .db $FD, $1d
  .db $14
  .db $FD, $1d
  .db $14
  .db $FD, $03
  .db $14
  .db $FD, $0C
  .db $FC, $03, $14
  .db $FD, $27
  .db $FC, $10, Tile_Solid_Fith_FP
  .db $FF

LevelDataArea1:
  .db $FF

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
