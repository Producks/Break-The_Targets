SpritesOptionSelectTable:

; Top left corner sprites to hide the top part of rendering
  .db $00, $1D, $00, $00
  .db $00, $1D, $00, $00
  .db $00, $1D, $00, $00
  .db $00, $1D, $00, $00
  .db $00, $1D, $00, $00
  .db $00, $1D, $00, $00
  .db $00, $1D, $00, $00
  .db $00, $1D, $00, $00

; Dancing ditto
DancingDitto:
	.db $B9, $41, $33, $1A
	.db $B9, $43, $33, $22
	.db $B9, $45, $33, $2A
	.db $B9, $47, $33, $32

	.db $C9, $61, $33, $1A
	.db $C9, $63, $33, $22
	.db $C9, $65, $33, $2A
	.db $C9, $67, $33, $32

; 8 targets in total
	.db $1F, $0F, $30, $44
	.db $1F, $11, $30, $4C
	.db $60, $0F, $30, $B8
	.db $60, $11, $30, $C0

	.db $75, $0F, $30, $AA
	.db $75, $11, $30, $B2
	.db $02, $0F, $30, $02
	.db $02, $11, $30, $0A

; Scroll up left 1 sprite
	.db $2C, $0F, $30, $A1
	.db $2C, $11, $30, $A9

; Scroll up right 1 sprite
	.db $A5, $0F, $30, $DB
	.db $A5, $11, $30, $E3

UpdateSpriteLogicOptionSelect:
;  LDA OptionSelectSeedCounter
;  AND #$01 ; Update the sprites half the time
;  BEQ ScrollDowndLeft
;  RTS

ScrollDowndLeft:
  INC SpriteDMAArea + 32 + 32
  DEC SpriteDMAArea + 35 + 32
  INC SpriteDMAArea + 36 + 32
  DEC SpriteDMAArea + 39 + 32
; Second Sprite
  INC SpriteDMAArea + 40 + 32
  DEC SpriteDMAArea + 43 + 32
  INC SpriteDMAArea + 44 + 32
  DEC SpriteDMAArea + 47 + 32

ScrollDownRight:
  INC SpriteDMAArea + 48 + 32
  INC SpriteDMAArea + 51 + 32
  INC SpriteDMAArea + 52 + 32
  INC SpriteDMAArea + 55 + 32
; Second Sprite
  INC SpriteDMAArea + 56 + 32
  INC SpriteDMAArea + 59 + 32
  INC SpriteDMAArea + 60 + 32
  INC SpriteDMAArea + 63 + 32

ScrollUpLeft:
  DEC SpriteDMAArea + 64 + 32
  DEC SpriteDMAArea + 67 + 32
  DEC SpriteDMAArea + 68 + 32
  DEC SpriteDMAArea + 71 + 32

ScrollUpRight:
  DEC SpriteDMAArea + 72 + 32
  INC SpriteDMAArea + 75 + 32
  DEC SpriteDMAArea + 76 + 32
  INC SpriteDMAArea + 79 + 32

AnimateDitto:
  INC DittoDanceCounter
  LDA DittoDanceCounter
  CMP #$08
  BNE LeaveDittoDance
  LDA #$00
  STA DittoDanceCounter ; reset counter

  LDA SpriteDMAArea + 33
  CMP #$59
  BNE UpdateDittoSprite

ResetDance:
  LDY #$21
  LDX #$00
ResetDanceLoop:
  LDA SpriteDMAArea, Y
  SEC
  SBC #$18
  STA SpriteDMAArea, Y
  INY
  INY
  INY
  INY
  INX
  CPX #$08
  BNE ResetDanceLoop
  RTS

UpdateDittoSprite:
  LDX #$00 ; Index
  LDY #$21
UpdateDittoSpriteLoop:
  LDA SpriteDMAArea, Y
  CLC
  ADC #$08
  STA SpriteDMAArea, Y
  INY
  INY
  INY
  INY
  INX
  CPX #$08
  BNE UpdateDittoSpriteLoop

LeaveDittoDance:
  RTS

; Read the routine name
DumpSpriteOptionSelect:
  LDY #$00
SpriteDumpOptionSelectLoop:
  LDA SpritesOptionSelectTable, Y
  STA SpriteDMAArea, Y
  INY
  CPY #$70
  BNE SpriteDumpOptionSelectLoop
  RTS
