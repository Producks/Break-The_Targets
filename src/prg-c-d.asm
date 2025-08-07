;
; Bank C & Bank D
; ===============
;
; What's inside:
;
;   - The ending sequence with Mario sleeping and the cast roll
;

EndScreenPalettes:
	.db $0F, $30, $02, $02
	.db $0F, $30, $26, $0F
	.db $0F, $35, $25, $0F ; Border
	.db $0F, $35, $25, $0F ; Text part of the screen

EndScreenSpritesPalettes:
	.db $0F, $30, $16, $02
	.db $0F, $38, $10, $02
	.db $0F, $30, $25, $02
	.db $0F, $23, $02, $30

EndScreenGFX:
; THANKS FOR PLAYING
ThankYouText
  .db $20, $87, $12
  .db $33, $27, $20, $2D, $2A, $32, $7C, $25, $2E, $31, $7C, $2F, $2B, $20, $38, $28, $2D, $26

; Break The Targets BY REDACTED
ByText:
  .db $20, $E2, $1D
  .db $21, $31, $24, $20, $2A, $7C, $33, $27, $24, $7C, $33, $20, $31, $26, $24, $33, $32, $7C, $21, $38, $7C, $31, $24, $23, $20, $22, $33, $24, $23

; Tools used: SMB2 DISASSEMBLY,
ToolsUsedText:
  .db $21, $42, $1D
  .db $33, $2E, $2E, $2B, $32, $7C, $34, $32, $24, $23, $3A, $7C, $32, $2C, $21, $3E, $7C, $23, $28, $32, $20, $32, $32, $24, $2C, $21, $2B, $38, $3D

; TILED, FAMSITUDIO, YYCHR,
ToolsNameText:
  .db $21, $63, $19
  .db $33, $28, $2B, $24, $23, $3D, $7C, $25, $20, $2C, $28, $32, $33, $34, $23, $28, $2E, $3D, $7C, $38, $38, $22, $27, $31, $3D

; Modern SMB2, PIXELER.
ToolsNameTextTwo:
  .db $21, $85, $15
  .db $2C, $2E, $23, $24, $31, $2D, $7C, $32, $2C, $21, $3E, $3D, $7C, $2F, $28, $37, $24, $2B, $24, $31, $3B

; CODE BY:
CodeByText:
  .db $21, $E3, $08
  .db $22, $2E, $23, $24, $7C, $21, $38, $3A

; XKEEPER0, KMCK, NESDEV
CodeAuthorText:
  .db $22, $05, $17
  .db $37, $2A, $24, $2F, $2F, $24, $31, $3F, $3D, $7C, $2A, $2C, $22, $2A, $3D, $7C, $2D, $24, $32, $23, $24, $35, $3B

; GRAPHICS BY:
GraphicText:
  .db $22, $43, $0C
  .db $26, $31, $20, $2F, $27, $28, $22, $32, $7C, $21, $38, $3A

; TAILSPOWER, P-P, KOOPSS20
AuthorGraphicText:
  .db $22, $64, $19
  .db $33, $20, $28, $2B, $32, $2F, $2E, $36, $24, $31, $3D, $7C, $2F, $2F, $3D, $7C, $2A, $2E, $2E, $2F, $32, $32, $3E, $3F, $3B

; MUSIC BY:
MusicByText:
  .db $22, $A3, $09
  .db $2C, $34, $32, $28, $22, $7C, $21, $38, $3A

; VINYLCHEESE, JX, TOKYOSCARAB
MusicCredit:
  .db $22, $C2, $1D
  .db $29, $37, $3D, $7C, $35, $28, $2D, $38, $2B, $22, $27, $24, $24, $32, $24, $3D, $7C, $33, $2E, $2A, $38, $2E, $32, $22, $20, $31, $20, $21, $3B

AttributeEndScreen:
	.db $00

; End

ShowEndScreen:
  SEI

	JSR WaitForNMI_TurnOffPPU
  JSR ClearNametablesAndSprites

	LDA #Stack100_Menu
	STA StackArea
	LDA #PPUCtrl_Base2000 | PPUCtrl_WriteHorizontal | PPUCtrl_Sprite0000 | PPUCtrl_Background1000 | PPUCtrl_SpriteSize8x16 | PPUCtrl_NMIEnabled
	STA PPUCtrlMirror
	STA PPUCTRL

  JSR WaitForNMI

  LDA #ScreenUPdateBuffer_EndScreen
  STA ScreenUpdateIndex
  LDA #CHRBank_Ending
  STA BackgroundCHR1

	LDA PPUSTATUS
	LDA #$3F
	LDY #$00
	STA PPUADDR
	STY PPUADDR

PaletteLoopEndScreen:
	LDA EndScreenPalettes, Y
	STA PPUDATA
	INY
	CPY #$20
	BCC PaletteLoopEndScreen

  JSR EnableNMI

	JSR WaitForNMI_TurnOnPPU

  LDA #<music_data_pictionary_
  STA MusicLoPTR
  LDA #>music_data_pictionary_
  STA MusicHiPTR
  LDA #$07
  STA CurrentMusicBank
  INC MusicUpdate

InfiniteEndingLoop:
  JSR WaitForNMI
  JMP InfiniteEndingLoop

.pad $A000, $ff
.include "src/music/together_we_ride.asm"
.include "src/music/song_of_storm.asm"
