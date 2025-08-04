CleanupBeforeCharacterSelect:
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



; ------------------------------------------------------------
; Initialisation of full palette buffer
; ------------------------------------------------------------
InitPPUPaletteBufferParams:
  LDA #$3F ; Setup PPU dump parameters
  STA PPU_PaletteBuffer
  LDA #$00
  STA PPU_PaletteBuffer + 1
  STA PPU_PaletteBufferEnd
  LDA #$20
  STA PPU_PaletteBuffer + 2
  RTS

; ------------------------------------------------------------
; Color fade in routine
; Params: Lo palette address 0x000E
;         Hi palette address 0x000F
; It's your responsability to save 0x000E-0x000F
; Use SaveBytes/RestoreBytes routine to save/restore them
; A lot of this code is taken from smb3 source code
; ------------------------------------------------------------
PaletteFadeIn:
  JSR InitPPUPaletteBufferParams
  LDY #$1F
SetupPaletteFadeInLoop:
  LDA (LoPaletteAddress), Y
  LDX #$00
SubtractLoop:
  SEC
  SBC #$30
  BCS SetResultSubtraction ; Branch if A is negative
  LDA #$0F ; Set to black by default if A is negative
SetResultSubtraction:
  STA PPU_PaletteBufferBegin, Y
  DEY
  BPL SetupPaletteFadeInLoop

  LDA #$04
  STA FadeCounter
LoopFadeIn:
  LDA #UpdatePallettePPUBuffer
  STA ScreenUpdateIndex
  DEC FadeCounter
  BEQ FadeInDone
  JSR WaitFixedAmountNMI
  JSR IncreaseBrightnessPalette
  BMI LoopFadeIn
FadeInDone:
  JSR WaitForNMI_Menu
  RTS

WaitForNMI_Menu_TurnOffPPU:
	LDA #$00
	BEQ WaitForNMI_Menu_StuffPPUMask ; Branch always

WaitForNMI_Menu_TurnOnPPU:
	LDA #PPUMask_ShowLeft8Pixels_BG | PPUMask_ShowLeft8Pixels_SPR | PPUMask_ShowBackground | PPUMask_ShowSprites

WaitForNMI_Menu_StuffPPUMask:
  STA PPUMaskMirror

WaitForNMI_Menu:
	LDA ScreenUpdateIndex
	ASL A
	TAX
	LDA TitleScreenPPUDataPointers, X
	STA RAM_PPUDataBufferPointer
	LDA TitleScreenPPUDataPointers + 1, X
	STA RAM_PPUDataBufferPointer + 1

	LDA #$00
	STA NMIWaitFlag
WaitForNMI_Menu_Loop:
	LDA NMIWaitFlag
	BPL WaitForNMI_Menu_Loop

	RTS

EnableNMI_Menu:
  LDA #PPUCtrl_Base2000 | PPUCtrl_WriteHorizontal | PPUCtrl_Sprite1000 | PPUCtrl_Background0000 | PPUCtrl_SpriteSize8x8 | PPUCtrl_NMIEnabled
	STA PPUCtrlMirror
	STA PPUCTRL
  RTS

EnableNMI_OptionSelect:
  LDA #PPUCtrl_Base2000 | PPUCtrl_WriteHorizontal | PPUCtrl_Sprite1000 | PPUCtrl_Background0000 | PPUCtrl_SpriteSize8x16 | PPUCtrl_NMIEnabled
	STA PPUCtrlMirror
	STA PPUCTRL
  RTS

; ------------------------------------------------------------
; params:
;         Define for loops or
;         Y = Numbers of loops to wait
; Wait a fix amount of NMI
; Call JSR WaitFixedAmountNMILoop if using the Y param
; ------------------------------------------------------------
WaitFixedAmountNMI:
  LDY #FadeoutTimer
WaitFixedAmountNMILoop:
  JSR WaitForNMI_Menu
  DEY
  BNE WaitFixedAmountNMILoop
  RTS

; ------------------------------------------------------------
; Make all colors #$0F (Black)
; ------------------------------------------------------------
BlackOutPalette:
  LDA #$3F ; Setup PPU dump parameters
  STA PPU_PaletteBuffer
  LDA #$00
  STA PPU_PaletteBuffer + 1
  LDA #$20
  STA PPU_PaletteBuffer + 2

  LDA #$0F ; Black out the entire PPU Buffer
  LDY #$1F
LoopBlackOut:
  STA PPU_PaletteBuffer + 3, Y
  DEY
  BPL LoopBlackOut
  RTS

; --------------------------------------------------------------------
; Decrease brightness of every colors until it match with the original
; Params: None
; --------------------------------------------------------------------
DecreaseBrightnessPalette:
  LDY #$1F
DecreaseBrightnessPaletteLoop:
  LDA PPU_PaletteBufferBegin, Y
  CMP #$0F
  BEQ DecLoopDecreaseBrightness
  SEC
  SBC #$10
  BCS SetResultDecDecBrightness
  LDA #$0F
SetResultDecDecBrightness:
  STA PPU_PaletteBufferBegin, Y
DecLoopDecreaseBrightness:
  DEY
  BPL DecreaseBrightnessPaletteLoop
  RTS

; ---------------------------------------------------------------------
; Increase brightness of every colors until it match with the original
; Params: None
; ---------------------------------------------------------------------
IncreaseBrightnessPalette:
  LDY #$1F ; BUG BUG, used to be something else, check later if this bug out and buffer overflow
IncreaseBrightnessPaletteLoop:
  LDA PPU_PaletteBufferBegin, Y
  CMP #$0F ; Check if black
  BNE BrightnessAddition
  LDA (LoPaletteAddress), Y ; Take the palette from the index and get the darkest shade of the color
  AND #$0F
  BPL SetBrightnessResult ; BUG BUG check if this bug out later
BrightnessAddition:
  CMP (LoPaletteAddress), Y ; Check if the color is already matching with the target color
  BEQ DecreaseBrightnessLoop
  CLC
  ADC #$10
SetBrightnessResult:
  STA PPU_PaletteBufferBegin, Y
DecreaseBrightnessLoop:
  DEY
  BPL IncreaseBrightnessPaletteLoop
  RTS


; ------------------------------------------------------------
; Color fade out routine
; Params: Lo palette address 0x000E
;         Hi palette address 0x000F
; It's your responsability to save 0x000E-0x000F
; Use SaveBytes/RestoreBytes routine to save/restore them
; ------------------------------------------------------------
PaletteFadeOut:
  JSR InitPPUPaletteBufferParams
  LDY #$1F
DumpPaletteLoop:
  LDA (LoPaletteAddress), Y
  STA PPU_PaletteBufferBegin, Y 
  DEY
  BPL DumpPaletteLoop

  LDA #$04
  STA FadeCounter
FadeOutLoop:
  JSR DecreaseBrightnessPalette
  LDA #UpdatePallettePPUBuffer
  STA ScreenUpdateIndex
  JSR WaitFixedAmountNMI
  DEC FadeCounter
  BPL FadeOutLoop
  RTS
