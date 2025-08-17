# Break the targets
My entry for smw central [SMB2 level design contest](https://www.smwcentral.net/?p=viewthread&t=130297&page=1&pid=1652030#p1652030).

## Features
* Optimization everywhere for a lag free experience
* Split hud using MMC3 IRQ
* New level rendering system (RLE)
* New music for every character
* Unique stage graphics for every characters
* Brand new sprites
* Character swapping mid stage
* 2 new extra characters
* Fast respawn
* Fast loading
* Custom title/info/credit screen
* Bunch of QOL that I probably forgot...

## How the new level renderer works
A new editor needed to be made quick for this contest so I could get away from all the restrictions. I went with the RLE approach that [Xkeeper0](https://github.com/Xkeeper0) discussed on the smb2 disassembly discord. My approach is a bit different, I have a background layer, a foreground layer and a sprite layer when building levels. I ended up settling with the program [Tiled](https://www.mapeditor.org/)  

### Background layer
Metatiles of 32 pixels per 32 pixels (4x4 of the foreground metatile). These are bonkers to save space and make the levels look more uniques. Any configuration of blocks can easily be made to fit what was needed.  
![](https://github.com/Producks/Break-The_Targets/blob/main/doc/background.PNG?raw=true)

### Foreground layer
Metatiles of 16 pixels per 16 pixels (4x4 of 8x8 pixels tile). What the vanilla use, but I use them with the RLE
configuration to save space. I made custom unique tiles for every tile in this hack!
![](https://github.com/Producks/Break-The_Targets/blob/main/doc/background.PNG?raw=true)

### Sprite layer
Pretty much what the game use, but since all sprites were uniques I had to set them up correctly in the tileset.

### End result
The result of each layer is save individually has a `.csv` and is setup in the build.sh to be automatically included everytime we build. It make it so it's dynamic and any change in Tiled will be reflected instnaly in the ROM when we rebuild.
