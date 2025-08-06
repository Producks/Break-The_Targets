.include "src/levels/level-info.asm"

.include "src/levels/level-data.asm"

.include "src/levels/enemy-data.asm"

.include "src/levels/background-data.asm"

;
; Lookup tables for decoded level data by page
;
DecodedLevelPageStartLo_Bank6:
	.db <DecodedLevelData
	.db <(DecodedLevelData+$00F0)
	.db <(DecodedLevelData+$01E0)
	.db <(DecodedLevelData+$02D0)
	.db <(DecodedLevelData+$03C0)
	.db <(DecodedLevelData+$04B0)
	.db <(DecodedLevelData+$05A0)
	.db <(DecodedLevelData+$0690)
	.db <(DecodedLevelData+$0780)
	.db <(DecodedLevelData+$0870)
	.db <(SubAreaTileLayout)

DecodedLevelPageStartHi_Bank6:
	.db >DecodedLevelData
	.db >(DecodedLevelData+$00F0)
	.db >(DecodedLevelData+$01E0)
	.db >(DecodedLevelData+$02D0)
	.db >(DecodedLevelData+$03C0)
	.db >(DecodedLevelData+$04B0)
	.db >(DecodedLevelData+$05A0)
	.db >(DecodedLevelData+$0690)
	.db >(DecodedLevelData+$0780)
	.db >(DecodedLevelData+$0870)
	.db >(SubAreaTileLayout)

;
; Resets level data and PPU scrolling.
;
; This starts at the end of the last page and works backwards to create a blank slate upon which to
; render the current area's level data.
;
ResetLevelData:
	LDA #$00
	STA PPUScrollXMirror
	STA PPUScrollYMirror
	STA CurrentLevelPageX
	STA byte_RAM_D5
	STA byte_RAM_E6
	STA ScreenYHi
	STA ScreenYLo
	STA ScreenBoundaryLeftHi
	STA ScreenBoundaryLeftLo
	STA_abs NeedsScroll
	RTS

LoadCurrentPalette_N_CHRBank:
  LDX CurrentLevelArea
  LDA PalettePTRLo, X
  STA TempAdrLo
  LDA PalettePTRHi, X
  STA TempAdrHi

; Setup addr in buffer
	LDA #$3F
	STA PPUBuffer_301
	LDA #$00
	STA PPUBuffer_301 + 1
	LDA #$20
	STA PPUBuffer_301 + 2

	LDY #$00
  LDA (TempAdrLo), Y
	STA SkyColor

ApplyPalette_BackgroundLoop:
  LDA (TempAdrLo), Y
	STA PPUBuffer_301 + 3, Y
	INY
	CPY #$20
  BNE ApplyPalette_BackgroundLoop

  LDX #$00
CHRBankAreaLoop:
  LDA (TempAdrLo), Y
  STA BackgroundCHR1, X
  INY
  INX
  CPY #$26
  BNE CHRBankAreaLoop

	RTS

;
; ## Area loading and rendering
;
; This is the main subroutine for parsing and rendering an entire area of a level.
;
LoadCurrentArea:
	; First, reset the level data and PPU scrolling.
	JSR ResetLevelData

	JSR ResetPPUScrollHi_Bank6

  JSR UnpackBackgroundBlocks

; Load current target
  LDY CurrentLevelArea
  LDA TargetsCountTable, Y
  STA TargetsCount

; Set restriction count
  LDA RestrictionCountTable, Y
  STA RestrictionsCount

; Set restriction type
  LDA RestrictionTypeTable, Y
  STA RestrictionType

; Determine whether this area is Horizontal or vertical.
  LDA #$01
	STA IsHorizontalLevel

; Set it up everytime
  LDA #$3C
  STA Timer_60_Sec

	; Determine the level length (in pages).
  LDA ScreenCountArea, Y
	STA CurrentLevelPages

  JSR DecodeLevelData

  JMP CopyEnemyData

CopyEnemyData:
	LDA #>RawEnemyDataAddr
	STA byte_RAM_3
	LDY #<RawEnemyDataAddr
	STY byte_RAM_2

  LDY CurrentLevelArea
  LDA EnemyDataPTRLo, Y
  STA TempAdrLo
  LDA EnemyDataPTRHi, Y
  STA TempAdrHi

  LDY #$00

CopyEnemyDataLoop: ; TODO Optimize this later so i dont copy 255 bytes lol
  LDA (TempAdrLo), Y
  STA (byte_RAM_2), Y
  DEY
  BNE CopyEnemyDataLoop

  RTS

;
; Updates the area page and tile placement offset
;
; ##### Input
; - `byte_RAM_E8`: area page
; - `byte_RAM_E5`: tile placement offset shift
; - `byte_RAM_E6`: previous tile placement offset
;
; ##### Output
; - `byte_RAM_1`: low byte of decoded level data RAM
; - `byte_RAM_2`: high byte of decoded level data RAM
; - `byte_RAM_E7`: target tile placement offset
;
SetTileOffsetAndAreaPageAddr_Bank6:
	LDX byte_RAM_E8
	JSR SetAreaPageAddr_Bank6

	LDA byte_RAM_E6
	CLC
	ADC byte_RAM_E5
	STA byte_RAM_E7
	RTS

;
; Updates the area page that we're drawing tiles to
;
; ##### Input
; - `X`: area page
;
; ##### Output
; - `byte_RAM_1`: low byte of decoded level data RAM
; - `byte_RAM_2`: high byte of decoded level data RAM
;
SetAreaPageAddr_Bank6:
	LDA DecodedLevelPageStartLo_Bank6, X
	STA byte_RAM_1
	LDA DecodedLevelPageStartHi_Bank6, X
	STA byte_RAM_2
	RTS

;
; High byte of the PPU scroll offset for nametable B.
;
; When mirroring vertically, nametable A is `$2000` and nametable B is `$2800`.
; When mirroring horizontally, nametable A is `$2000` and nametable B is `$2400`.
;
PPUScrollHiOffsets_Bank6:
	.db $28 ; vertical
	.db $24 ; horizontal

;
; Resets the PPU high scrolling values and sets the high byte of the PPU scroll offset.
;
; The version of the subroutine in this bank is always called with `A = $00`.
;
; ##### Input
; - `A`: 0 = use nametable A, 1 = use nametable B
; - `Y`: 0 = vertical, 1 = horizontal
;
; ##### Output
; - `PPUScrollYHiMirror`
; - `PPUScrollXHiMirror`
; - `PPUScrollCheckHi`: PPU scroll offset high byte
;
ResetPPUScrollHi_Bank6:
	LSR A
	BCS ResetPPUScrollHi_NametableB_Bank6

ResetPPUScrollHi_NametableA_Bank6:
	LDA #$01
	STA PPUScrollXHiMirror
	ASL A
	STA PPUScrollYHiMirror
	LDA #$20
	BNE ResetPPUScrollHi_Exit_Bank6

ResetPPUScrollHi_NametableB_Bank6:
	LDA #$00
	STA PPUScrollXHiMirror
	STA PPUScrollYHiMirror
	LDA PPUScrollHiOffsets_Bank6, Y

ResetPPUScrollHi_Exit_Bank6:
	STA PPUScrollCheckHi
	RTS

PreCalculatedTableRAM_LevelDataStartLo:
  .db $00, $F0, $E0, $D0, $C0, $B0, $A0, $90, $80, $70
PreCalculatedTableRAM_LevelDataStartHi:
  .db $60, $60, $61, $62, $63, $64, $65, $66, $67, $68

;
; Magic happens here, will iterate over how many pages there are, no more
; Should 8 x 6 x screen number = total blocks unloaded.
; XX   XX
; LEN  BloackID
; $FE inc page
; $FF = END
UnpackBackgroundBlocks:
  LDX CurrentLevelArea
  LDA BackgroundBlocks_Lo, X
  STA TempAdrLo
  LDA BackgroundBlocks_Hi, X
  STA TempAdrHi

  LDA #$00
  STA CurrentPageBackgroundBlocks ; Set first page to 0

SetPageRamIndex:
  LDA #$08
  STA BlockCounterX ; Counter for later

  LDY CurrentPageBackgroundBlocks
  LDA PreCalculatedTableRAM_LevelDataStartHi, Y
  STA RamIndexTopHi
  STA RamIndexBottomHi
  LDA PreCalculatedTableRAM_LevelDataStartLo, Y
  STA RamIndexTopLo
  CLC
  ADC #$10
  STA RamIndexBottomLo
  BCC SetYIndexBackground
  INC RamIndexBottomHi

SetYIndexBackground:
LDY #$00

SkipAddBottomHi:
  LDX #$00 ; cheat way

; Load how many times we will need to repeat the block
  LDA (TempAdrLo, X)
  CMP #$FF ; Check if we're done
  BEQ UnpackBackgroundBlocksDone
  CMP #$FE ; Check if we need to change page
  BNE UnPackBackgroundData
  JSR Increment_TempAdrLo
  INC CurrentPageBackgroundBlocks
  JMP SetPageRamIndex

; Here is where all the writting to buffer will happen!
UnPackBackgroundData:
  STA UnpackBackgroundDataLoopCount ; Give it the loop count
  JSR Increment_TempAdrLo
  LDA (TempAdrLo, X)
  JSR Increment_TempAdrLo
  TAX

UnPackBackgroundDataLoop:
  LDA TableTopLeftBackGroundBlock, X
  STA (RamIndexTopLo), Y
  LDA TableBottomLeftBackGroundBlock, X
  STA (RamIndexBottomLo), Y
  INY
  LDA TableTopRightBackgroundBlock, X
  STA (RamIndexTopLo), Y
  LDA TableBottomRightBackgroundBlock, X
  STA (RamIndexBottomLo), Y
  INY
  JSR DecreaseBlockCounterX
  DEC UnpackBackgroundDataLoopCount
  BNE UnPackBackgroundDataLoop
  BEQ SkipAddBottomHi
UnpackBackgroundBlocksDone:
  RTS

; Subroutine that check for overflow
Increment_TempAdrLo:
  INC TempAdrLo
  BNE Increment_TempAdrLoLeave
  INC TempAdrHi
Increment_TempAdrLoLeave:
  RTS

; Decrease this until we reach 0, when we reach 0 we adjust the addr
DecreaseBlockCounterX:
  DEC BlockCounterX
  BNE DecreaseBlockCounterXLeave
  TYA
  CLC
  ADC #$10
  TAY
  LDA #$08
  STA BlockCounterX
DecreaseBlockCounterXLeave:
  RTS

;
; Decode RLE level data here
; $FF = END
; $FE next page
; $FD skip writes, $XX LEN
; $FC repeat writes horizontal $XX LEN, $XX Tile ID
; $FB special tile, $XX Tile ID
; Nothing that match will just write raw!
DecodeLevelData:
  LDX CurrentLevelArea
  LDA LevelDataAreaLo, X
  STA TempAdrLo
  LDA LevelDataAreaHi, X
  STA TempAdrHi

  LDX #$00 ; Set current page count, and is also used has a deference index later
  STX CurrentPageCount

ReadParamDecodeLevelDataInit:
  JSR AdvancePagePTR
  LDY #$00 ; index baby
ReadParamDecodeLevelData:
  LDA (TempAdrLo, X)
  CMP #$FF ; Quit if we find the FF
  BEQ DecodeLEvelDataLeave
  CMP #$FE ; Will swap page
  BEQ ForwardPage
  CMP #$FD ; skip writes if we find it
  BEQ SkipWritesLevelData
  CMP #$FC
  BEQ RepeatWritesLevelData

WriteRaw:
  STA (LevelDataRamLo), Y
  INY
  JSR Increment_TempAdrLo
  JMP ReadParamDecodeLevelData

SkipWritesLevelData:
  JSR Increment_TempAdrLo
  TYA
  CLC
  ADC (TempAdrLo, X)
  TAY
  JSR Increment_TempAdrLo
  JMP ReadParamDecodeLevelData

RepeatWritesLevelData:
  JSR Increment_TempAdrLo ; $FC
  LDA (TempAdrLo, X) ; Get LEN
  STA LoopCountDecodeLevelData
  JSR Increment_TempAdrLo
  LDA (TempAdrLo, X)

RepeatWritesLevelDataLoop:
  STA (LevelDataRamLo), Y
  INY
  DEC LoopCountDecodeLevelData
  BNE RepeatWritesLevelDataLoop
  JSR Increment_TempAdrLo
  JMP ReadParamDecodeLevelData

DecodeLEvelDataLeave:
	LDA #$22
	ORA byte_RAM_10
	STA PseudoRNGSeed
	RTS

ForwardPage:
  JSR Increment_TempAdrLo
  INC CurrentPageCount
  JMP ReadParamDecodeLevelDataInit

AdvancePagePTR:
  LDY CurrentPageCount
  LDA PreCalculatedTableRAM_LevelDataStartLo, Y
  STA LevelDataRamLo
  LDA PreCalculatedTableRAM_LevelDataStartHi, Y
  STA LevelDataRamHi
  RTS

.pad $A000, $ff
.include "src/music/title_screen_song.asm"
