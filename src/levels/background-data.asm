;
; Index looking table for creating a block, will index real blocks
; 4 x 4 of 8 x 8 pixels.

TableTopLeftBackGroundBlock:
  .db Tile_Sky_Background       ; Sky 4x4
  .db Tile_Solid_Fith_FP        ; Solid one tile ground
  .db Tile_Solid_Fith_SP        ; Top of the pipe
  .db Tile_Solid_Seventh_SP     ; bottom of the pipe
  .db Tile_Background_First_TP  ; Cloud 4x4 third palette background
  .db Tile_Solid_Seventh_FP     ; Solid one tile block 4x4
  .db Tile_Sky_Background       ; Top left sky, 3 solid one block tile 

TableTopRightBackgroundBlock:
  .db Tile_Sky_Background
  .db Tile_Solid_Fith_FP
  .db Tile_Solid_Sixth_SP
  .db Tile_Solid_Eighth_SP
  .db Tile_Background_Second_TP
  .db Tile_Solid_Seventh_FP
  .db Tile_Solid_Seventh_FP

TableBottomLeftBackGroundBlock:
  .db Tile_Sky_Background
  .db Tile_Solid_Fith_FP
  .db Tile_Solid_Seventh_SP
  .db Tile_Solid_Seventh_SP
  .db Tile_Background_Third_TP
  .db Tile_Solid_Seventh_FP
  .db Tile_Solid_Seventh_FP

TableBottomRightBackgroundBlock:
  .db Tile_Sky_Background
  .db Tile_Solid_Fith_FP
  .db Tile_Solid_Eighth_SP
  .db Tile_Solid_Eighth_SP
  .db Tile_Background_Fourth_TP
  .db Tile_Solid_Seventh_FP
  .db Tile_Solid_Seventh_FP

BackgroundBlocks_Lo:
  .db <Area0BackgroundBlocks
  .db <Area1BackgroundBlocks
  .db <Area2BackgroundBlocks
  .db <Area3BackgroundBlocks
  .db <Area4BackgroundBlocks
  .db <Area5BackgroundBlocks
  .db <Area6BackgroundBlocks
  .db <Area7BackgroundBlocks
  .db <Area8BackgroundBlocks
  .db <Area9BackgroundBlocks
  .db <Area10BackgroundBlocks
  .db <Area11BackgroundBlocks
  .db <Area12BackgroundBlocks
  .db <Area13BackgroundBlocks
  .db <Area14BackgroundBlocks
  .db <Area15BackgroundBlocks
  .db <Area16BackgroundBlocks

BackgroundBlocks_Hi:
  .db >Area0BackgroundBlocks
  .db >Area1BackgroundBlocks
  .db >Area2BackgroundBlocks
  .db >Area3BackgroundBlocks
  .db >Area4BackgroundBlocks
  .db >Area5BackgroundBlocks
  .db >Area6BackgroundBlocks
  .db >Area7BackgroundBlocks
  .db >Area8BackgroundBlocks
  .db >Area9BackgroundBlocks
  .db >Area10BackgroundBlocks
  .db >Area11BackgroundBlocks
  .db >Area12BackgroundBlocks
  .db >Area13BackgroundBlocks
  .db >Area14BackgroundBlocks
  .db >Area15BackgroundBlocks
  .db >Area16BackgroundBlocks

Area0BackgroundBlocks:
.db $09, $00
.db $01, $04
.db $14, $00
.db $01, $06
.db $06, $00
.db $01, $06
.db $01, $05
.db $01, $00
.db $07, $01
.db $01, $00
.db $FE
.db $0e, $00
.db $01, $04
.db $02, $00
.db $01, $04
.db $18, $00
.db $01, $01
.db $01, $02
.db $04, $01
.db $FF

Area1BackgroundBlocks:
  .db $FF

Area2BackgroundBlocks:
  .db $FF

Area3BackgroundBlocks:
  .db $FF

Area4BackgroundBlocks:
  .db $FF

Area5BackgroundBlocks:
  .db $FF

Area6BackgroundBlocks:
  .db $FF

Area7BackgroundBlocks:
  .db $FF

Area8BackgroundBlocks:
  .db $FF

Area9BackgroundBlocks:
  .db $FF

Area10BackgroundBlocks:
  .db $FF

Area11BackgroundBlocks:
  .db $FF

Area12BackgroundBlocks:
  .db $FF

Area13BackgroundBlocks:
  .db $FF

Area14BackgroundBlocks:
  .db $FF

Area15BackgroundBlocks:
  .db $FF

Area16BackgroundBlocks:
  .db $FF
