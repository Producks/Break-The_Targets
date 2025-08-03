; Targets number, Index by current area
TargetsCountTable:
  .db $02, $00, $0F, $0F

; Restriction table, Index by current area
RestrictionCountTable:
  .db $02, $03, $0F, $0F

RestrictionTypeTable:
  .db NoRestriction, JumpRestriction, JumpRestriction
