.include "src/menu/init_title_screen.asm"

;- Loop of the title screen -; 
TitleScreenLoop:
ReadInput:
CheckSelect:
  LDA Player1JoypadPress
  CMP #ControllerInput_Select
  BNE CheckStart
  LDA SpriteDMAArea
  EOR #$10
  STA SpriteDMAArea
CheckStart:
	LDA Player1JoypadPress
	CMP #ControllerInput_Start
	BNE WaitThenJmpToLoop
  JMP QuitTitleScreen

WaitThenJmpToLoop:
  JSR AnimationTitleScreen
	JSR WaitForNMI_TitleScreen
  JMP ReadInput


QuitTitleScreen:
;	LDA #$D0
;	JSR WaitTitleScreenTimer

	LDA #$00 ; ???
	TAY

ZeroMemoryAfterTitleScreen: ; CREATED MASSIVE BUG IF AUDIO WAS GOING, MADE ME LOSE 2 HOURS
	STA byte_RAM_0, Y
	INY
	CPY #$F0
	BCC ZeroMemoryAfterTitleScreen

  LDY #$00
  LDA #Tile_Empty_Hud
DumpTileInWorkRam:
  STA $60C0, Y
  STA $61B0, Y
  INY
  CPY #$30
  BNE DumpTileInWorkRam

	JMP HideAllSprites

PaletteTimerTable:
  .db $24, $08, $08, $08

PaletteColorTable:
  .db $27, $17, $07, $17

AnimationTitleScreen:
  INC byte_RAM_10 ; Increase global timer
  LDA byte_RAM_10
  CMP #$06
  BNE PaletteTitleScreen
  LDA #$00
  STA byte_RAM_10
ShyGuyAnimation:
  LDA ShyGuy_Left_GFX
  EOR #$04
  STA ShyGuy_Left_GFX
  LDA ShyGuy_Right_GFX
  EOR #$04
  STA ShyGuy_Right_GFX
  DEC ShyGuy_Left_X
  DEC ShyGuy_Right_X

PaletteTitleScreen:
  LDA PaletteTimerTitleScreen
  BNE DecreasePaletteTimerTitleScreen
  INC PaletteIndexTitleScreen
  LDA PaletteIndexTitleScreen
  CMP #$04
  BNE SetNewPaletteIndex
  LDA #$00

SetNewPaletteIndex:
  STA PaletteIndexTitleScreen

SetNewColorPalette:
  TAX
  LDA PaletteTimerTable, X
  STA PaletteTimerTitleScreen
  LDA PaletteColorTable, X
  STA PPUBuffer_TitleScreen_Palette

DecreasePaletteTimerTitleScreen:
  DEC PaletteTimerTitleScreen

ScreenUpdateTitleScreenLoop:
  LDA #$02 ; Screen update
  STA ScreenUpdateIndex
  RTS

;- Leave title screen end -;

; End of function TitleScreen
