InfoScreenInit:
  JSR WaitForNMI_Menu_TurnOffPPU

	JSR DisableNMI ; Disable NMI since I won't need it for now

  JSR BlackOutPalette

  LDA #CHRBank_InfoScreen_BG1
  STA BackgroundCHR1
  LDA #CHRBank_InfoScreen_Sprites1
  STA SpriteCHR1
  LDA #CHRBank_InfoScreen_Sprites2
  STA SpriteCHR2

  JSR SetScrollXYTo0

	JSR ClearNametablesAndSprites

  LDA #BorderPPUBuffer
  STA ScreenUpdateIndex
  LDA PPUSTATUS

  JSR EnableNMI_OptionSelect

  JSR WaitForNMI_Menu

  LDX #TraditionalPPUBuffer
  STX CursorLocation ; Setup cursor right away
  LDA #$04
  STA ScreenUpdateIndex
  JSR WaitForNMI_Menu

  JSR DumpSpriteOptionSelect

  JSR WaitForNMI_Menu_TurnOnPPU

  ; Fade in the colors
  LDA #<OptionMenuBackgroundPalettes
  STA LoPaletteAddress
  LDA #>OptionMenuBackgroundPalettes
  STA HiPaletteAddress
  JSR PaletteFadeIn
  LDA #<music_data_pictionary_
  STA MusicLoPTR
  LDA #>music_data_pictionary_
  STA MusicHiPTR
  LDA #$07
  STA CurrentMusicBank
  INC MusicUpdate
