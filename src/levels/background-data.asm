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
  .db Tile_Background_Sixth_TP   ; Water...
  .db Tile_Solid_Third_FP       ; 2 Solid block left and 2 sky right
  .db Tile_Solid_Third_FP       ; 4 x4 solid
  .db Tile_Sky_Background       ; 2 x non solid at top 2 x solid bottom
  .db Tile_Background_First_SP  ; Tree shape 4 x 4 background
  .db Tile_Mario3_Cutoff       ; Cutoff mario 3
  .db Tile_SolidBlack_Sky       ; BLACK

  .db Tile_Solid_Seventh_SP     ; Pipe stuff gl
  .db Backgroundtile_Solid_Pipe_09 ; LOL
  .db Backgroundtile_Solid_Pipe_10 ; LOL
  .db Backgroundtile_Solid_Pipe_05 ; this sucks
  .db Backgroundtile_Solid_Pipe_06 ; LOLOOL
  .db Backgroundtile_Solid_Pipe_06

  .db Tile_Background_First_SP     ; Zelda 2 background
  .db Tile_Background_Sixth_SP      ; Lava

TableTopRightBackgroundBlock:
  .db Tile_Sky_Background
  .db Tile_Solid_Fith_FP
  .db Tile_Solid_Sixth_SP
  .db Tile_Solid_Eighth_SP
  .db Tile_Background_Second_TP
  .db Tile_Solid_Seventh_FP
  .db Tile_Solid_Seventh_FP
  .db Tile_Background_Sixth_TP 
  .db Tile_Sky_Background
  .db Tile_Solid_Third_FP
  .db Tile_Sky_Background 
  .db Tile_Background_Second_SP
  .db Tile_SolidBlack_Sky
  .db Tile_SolidBlack_Sky
  .db Tile_Solid_Eighth_SP
  .db Backgroundtile_Solid_Pipe_09
  .db Backgroundtile_Solid_Pipe_10
  .db Backgroundtile_Solid_Pipe_06
  .db Backgroundtile_Solid_Pipe_06
  .db Backgroundtile_Solid_Pipe_01
  .db Tile_Background_First_SP
  .db Tile_Background_Sixth_SP

TableBottomLeftBackGroundBlock:
  .db Tile_Sky_Background
  .db Tile_Solid_Fith_FP
  .db Tile_Solid_Seventh_SP
  .db Tile_Solid_Seventh_SP
  .db Tile_Background_Third_TP
  .db Tile_Solid_Seventh_FP
  .db Tile_Solid_Seventh_FP
  .db Tile_Background_Eighth_TP 
  .db Tile_Solid_Third_FP
  .db Tile_Solid_Third_FP
  .db Tile_Solid_Fith_FP
  .db Tile_Background_Third_SP
  .db Tile_Mario3_Cutoff
  .db Tile_SolidBlack_Sky
  .db Tile_Solid_First_SP
  .db Backgroundtile_Solid_Pipe_09
  .db Backgroundtile_Solid_Pipe_10
  .db Backgroundtile_Solid_Pipe_07
  .db Backgroundtile_Solid_Pipe_08
  .db Backgroundtile_Solid_Pipe_08
  .db Tile_Background_First_SP
  .db Tile_Background_Eighth_SP

TableBottomRightBackgroundBlock:
  .db Tile_Sky_Background
  .db Tile_Solid_Fith_FP
  .db Tile_Solid_Eighth_SP
  .db Tile_Solid_Eighth_SP
  .db Tile_Background_Fourth_TP
  .db Tile_Solid_Seventh_FP
  .db Tile_Solid_Seventh_FP
  .db Tile_Background_Eighth_TP
  .db Tile_Sky_Background
  .db Tile_Solid_Third_FP
  .db Tile_Solid_Fith_FP
  .db Tile_Background_Fourth_SP
  .db Tile_SolidBlack_Sky
  .db Tile_SolidBlack_Sky
  .db Tile_Solid_Second_SP
  .db Backgroundtile_Solid_Pipe_09
  .db Backgroundtile_Solid_Pipe_10
  .db Backgroundtile_Solid_Pipe_08
  .db Backgroundtile_Solid_Pipe_08
  .db Backgroundtile_Solid_Pipe_03
  .db Tile_Background_First_SP
  .db Tile_Background_Eighth_SP

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

.include "src/levels/background/Area0BackgroundBlocks"
.include "src/levels/background/Area1BackgroundBlocks"
.include "src/levels/background/Area2BackgroundBlocks"
.include "src/levels/background/Area3BackgroundBlocks"
.include "src/levels/background/Area4BackgroundBlocks"
.include "src/levels/background/Area5BackgroundBlocks"


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
