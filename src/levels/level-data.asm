;
; Level Data
; ==========
;
; Levels are broken down by area. The first four bytes are a level header,
; specifying things like palettes, music, size, scrolling, and ground type.
; The rest is level objects. Levels are ended by the $FF special object.
;
; Each "page" of level data is 16x15 tiles.
;
; Level header (4 bytes):
;
;   Byte 1: HxBBBxSS
;   H: horizontal level flag (0 = vertical, 1 = horizontal)
;   B: background palette (0-7)
;   S: sprite palette (0-3)
;
;   Byte 2: xxxGGGGG
;   G: ground setting (0-31)
;
;   Byte 3: PPPPOOOO
;   P: number of pages minus 1 (0 = 1 page, 1 = 2 pages, etc.)
;   O: object type (xxOO for 3X-9X, OOxx for AX-FX)
;
;   Byte 4: xxTTTxMM
;   T: ground type (0-7)
;   M: music (0 = overworld, 1 = underground, 2 = boss, 3 = Wart)
;
; Regular object (2 bytes):
;   $YX - position
;   $TT - type
;
; Special objects (1-3 bytes):
;   $F0 - ground setting; byte 1: oooGGGGG, where o is offset and G is ground setting
;   $F1 - ground setting; byte 1: oooGGGGG, where o+8 is offset and G is ground setting
;   $F2 - skip forward one page; no parameters
;   $F3 - skip forward two pages; no parameters
;   $F4 - new object layer; next object will be positioned relative to (0, 0) of the first page; no parameters
;   $F5 - area pointer; byte 1: world/level offset, byte 2: $AP, where A is the area and P is the page offset within the area
;   $F6 - ground type; byte 1: ground type
;   $F7-$FE - seemingly unused
;   $FF - end of the data for the current level; no parameters
;
; Door pointer (2 bytes):
;   In worlds 1-5, the object immediately following a door acts as an area pointer
;

; -------------------------------
; World 1

; World 1-1
include "src/levels/1/1-1/1-1-area0.asm"

; -------------------------------

; $FF = END, $FE skip to the next screen, $FD Skip writes by -> $XX
;LevelDataArea0:
;  .db $FD, $B0
;  .db $10, BackgroundTile_Bridge
;  .db $FF

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
