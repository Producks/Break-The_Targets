;
; Enemy Data
; ==========
;
; This data is broken down by page (ie. screen), where the first byte indicates
; the number of bytes for this page. Each enemy is two bytes, where the first
; byte is the enemy, and the second byte is XY position.
;
; Each "page" of enemy data is 16x16 tiles.
;
; Note that this is one tile GREATER than level data. Consequently, level and
; enemy data becomes increasingly misaligned in vertical areas.
;
; Examples:
;   $01 - an empty page
;   $03,$01,$47 - a page with a single pink shyguy ($01) at X=4, Y=7
;

; -------------------------------
; World 1

; World 1-1
include "src/levels/1/1-1/1-1-area0-enemies.asm"

; -------------------------------
