TitleLayout:
  .db $20, $84, $01, $B6
  .db $20, $85, $57, $B8
  .db $20, $9C, $01, $BA
  .db $20, $A4, $C9, $B4
  .db $20, $BC, $C9, $B5
  .db $20, $AF, $4D, $FD
  .db $20, $CF, $4D, $FD
  .db $20, $EF, $4D, $FD
  .db $21, $0F, $4D, $FD

; Break The
  .db $20, $A5, $17, $FD, $FD, $10, $12, $14, $16, $18, $1A, $1C, $1E, $A0, $A2, $FD, $FD, $FD, $A4, $A6, $A8, $AA, $18, $1A, $FD, $FD
  .db $20, $C5, $17, $FD, $FD, $11, $13, $15, $17, $19, $1B, $1D, $1F, $A1, $A3, $FD, $FD, $FD, $A5, $A7, $A9, $AB, $19, $1B, $FD, $FD

  .db $20, $E5, $17, $FD, $FD, $30, $32, $34, $36, $38, $3A, $3C, $3E, $C0, $C2, $FD, $FD, $FD, $C4, $C6, $C8, $CA, $38, $3A, $FD, $FD
  .db $21, $05, $17, $FD, $FD, $31, $33, $35, $37, $39, $3B, $3D, $3F, $C1, $C3, $FD, $FD, $FD, $C5, $C7, $C9, $CB, $39, $3B, $FD, $FD

; Targets
  .db $21, $25, $17, $FD, $FD, $FD, $FD, $40, $42, $44, $46, $48, $4A, $4C, $4E, $50, $52, $40, $42, $54, $56, $FD, $FD, $FD, $FD, $FD
  .db $21, $45, $17, $FD, $FD, $FD, $FD, $41, $43, $45, $47, $49, $4B, $4D, $4F, $51, $53, $41, $43, $55, $57, $FD, $FD, $FD, $FD, $FD

  .db $21, $65, $17, $FD, $FD, $FD, $FD, $60, $62, $64, $66, $68, $6A, $6C, $6E, $70, $72, $60, $62, $74, $76, $FD, $FD, $FD, $FD, $FD
  .db $21, $85, $17, $FD, $FD, $FD, $FD, $61, $63, $65, $67, $69, $6B, $6D, $6F, $71, $73, $61, $63, $75, $77, $FD, $FD, $FD, $FD, $FD

  .db $21, $A5, $17, $FD, $FD, $FD, $FD, $80, $82, $84, $86, $88, $8A, $8C, $8E, $90, $92, $80, $82, $94, $96, $FD, $FD, $FD, $FD, $FD

  .db $21, $C4, $19, $B7, $B0, $B0, $B0, $B0
  .db $81, $83, $85, $87, $89, $8B, $8D, $8F, $91, $93, $81, $83, $95, $97
  .db $B0, $B0, $B0, $B0, $B0, $BB

DrawMarioText:
  .db $20, $43, $05, $E6, $DA, $EB, $E2, $E8

DrawWorldAndtime:
  .db $20, $52, $0B, $F0, $E8, $EB, $E5, $DD, $FA, $FA, $ED, $E2, $E6, $DE

DrawScoreAndCoingsDigits:
  .db $20, $63, $0C, $D0, $D0, $D0, $D0, $D0, $D0, $FF, $FF, $CC, $CD, $D0, $D0

DrawPracticeRomText:
  .db $21, $EF, $0E, $B1, $D2, $D0, $D2, $D5, $FB, $EB, $DE, $DD, $DA, $DC, $ED, $DE, $DD

Draw1_1:
  .db $20, $73, $03, $D1, $F4, $D1

DrawCloud:
  .db $20, $C2, $02, $04, $06
  .db $20, $E1, $03, $03, $05, $07
  .db $21, $01, $03, $22, $24, $26

DrawMushroomBackground:
  .db $23, $1C, $04, $7C, $7E, $7C, $7E
  .db $23, $3C, $04, $7D, $7F, $7D, $7F

DrawTreessss:
  .db $22, $D6, $84, $59, $79, $98, $98
  .db $22, $D7, $84, $5B, $7B, $9A, $9A
  .db $22, $9A, $86, $59, $78, $78, $79, $98, $98
  .db $22, $9B, $86, $5B, $7A, $7A, $7B, $9A, $9A

DrawCastle:
  .db $22, $02, $06, $0A, $0C, $0A, $0C, $0A, $0C
  .db $22, $22, $46, $0B
  .db $22, $42, $06, $0B, $FE, $0B, $0B, $FE, $0B
  .db $22, $62, $06, $0B, $FE, $0B, $0B, $FE, $0B
  .db $22, $80, $0A, $0A, $0C, $2A, $2C, $2A, $2C, $2A, $2C, $0A, $0C
  .db $22, $A0, $4A, $0B
  .db $22, $C0, $4A, $0B
  .db $22, $E0, $4A, $0B
  .db $23, $00, $4A, $0B
  .db $23, $20, $4A, $0B
  .db $22, $C4, $84, $2B, $FE, $FE, $FE
  .db $22, $C5, $84, $2D, $FE, $FE, $FE

; Mario Game
MarioGameText:
  .db $22, $4D, $0A, $E6, $DA, $EB, $E2, $E8, $FB, $E0, $DA, $E6, $DE

; Luigi Game
LuigiGameText:
  .db $22, $8D, $0A, $E5, $EE, $E2, $E0, $E2, $FB, $E0, $DA, $E6, $DE

; Top- 000000 
ScoreText:
  .db $22, $EB, $0B, $ED, $E8, $E9, $F4, $FB, $D0, $D0, $D0, $D0, $D0, $D0

AttributeTitleScreen:
  .db $23, $C0, $48, $AA
  .db $23, $F0, $48, $55
  .db $23, $F8, $48, $55
  .db $23, $C9, $47, $55
  .db $23, $D1, $47, $55
  .db $23, $D9, $47, $55
  .db $23, $D6, $01, $DD
  .db $23, $DE, $01, $5D
  .db $23, $C2, $01, $EA
  .db $23, $C8, $01, $AA
  .db $23, $D0, $01, $AA
  .db $23, $E0, $43, $55
  .db $23, $E8, $43, $55
  .db $23, $E3, $43, $AA
  .db $23, $EB, $42, $AA
  .db $23, $ED, $01, $0A
  .db $23, $EE, $01, $02
  .db $23, $F3, $42, $5A
; Fix from old title screen, attribute update in the right spot for the lost level match
  .db $23, $EA, $01, $95
  .db $23, $ED, $01, $2A
	.db $00

IFDEF PAD_TITLE_SCREEN_PPU_DATA
	.pad TitleLayout + $300, $00
ENDIF

TitleBackgroundPalettes:
	.db $22, $29, $1A, $0F ; Most of screen, outline, etc.
	.db $0F, $36, $17, $0F ; Unused
	.db $0F, $30, $21, $0F ; Logo
	.db $0F, $27, $17, $0F ; Copyright, Story

TitleSpritePalettes:
	.db $22, $16, $27, $18 ; Unused DDP character palettes
	.db $0F, $30, $25, $0F ; There are no sprites on the title screen,
	.db $0F, $16, $30, $27 ; so these are totally unused
	.db $0F, $0F, $36, $17

TitleAttributeData1:
	.db $23, $CB, $42, $FF
	.db $23, $D1, $01, $CC
	.db $23, $D2, $44, $FF
	.db $23, $D6, $01, $33
	.db $23, $D9, $01, $CC
	.db $23, $DA, $44, $FF

TitleAttributeData2:
	.db $23, $DE, $01, $33
	.db $23, $E1, $01, $CC
	.db $23, $E2, $44, $FF
	.db $23, $E6, $01, $33
	.db $23, $EA, $44, $FF
	.db $23, $E9, $01, $CC
	.db $23, $EE, $01, $33

UpdateTitleScreen:
  .db $3F, $0D, $01, $27
  .db $00
