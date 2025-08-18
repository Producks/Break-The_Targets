# Break the targets
My entry for SMW Central [SMB2 level design contest](https://www.smwcentral.net/?p=viewthread&t=130297&page=1&pid=1652030#p1652030).

## Features
* Optimization everywhere for a lag-free experience
* Split hud using MMC3 IRQ
* New level rendering system (RLE)
* New music for every character
* Unique stage graphics for every character
* Brand new sprites
* Character swapping mid-stage
* 2 new extra characters
* Fast respawn
* Fast loading
* Custom title, info, and credit screens
* And a bunch of QOL improvements that make the game more enjoyable...

## How the new level renderer works
A new editor needed to be made quickly for this contest so I could get away from all the restrictions. I went with the RLE approach that [Xkeeper0](https://github.com/Xkeeper0) discussed on the SMB2 disassembly discord. My approach is a bit different; I have a background layer, a foreground layer, and a sprite layer when building levels. I ended up settling with the program [Tiled](https://www.mapeditor.org/).  

### Process before Tiled
Planning is required before any area editing is done, since they all use a unique tileset for the most part. Areas were planned with graphics and palettes in mind before anything was done. When everything was inside the ROM, palettes were set up, and new tiles were made if needed.
A tileset is made in [asesprite](https://www.aseprite.org/) for the background, foreground, and sprite layers with the correct color palette and Tile ID.

### Background layer
Metatiles of 32 pixels per 32 pixels (4x4 of the foreground metatile). These are bonker save space and make the levels look more unique Any configuration of blocks can easily be made to fit what's needed. This also use the RLE system.
![](https://github.com/Producks/Break-The_Targets/blob/main/doc/background.PNG?raw=true)

### Foreground layer
Metatiles of 16 pixels per 16 pixels (4x4 of 8x8 pixels tile). This is what the vanilla game uses, but I use them with the RLE configuration to save space. I made custom, unique tiles for every tile in this hack!
![](https://github.com/Producks/Break-The_Targets/blob/main/doc/foreground.PNG?raw=true)

### Sprite layer
This is pretty much what the game uses, but since all sprites were unique, I had to set them up correctly in the tileset.
![](https://github.com/Producks/Break-The_Targets/blob/main/doc/sprites.PNG?raw=true)  

### End result
![](https://github.com/Producks/Break-The_Targets/blob/main/doc/final%20result.PNG?raw=true)
The result of each layer is saved individually as a `.csv` file and is set up in the `build.sh` file to be automatically included every time we build. This makes it dynamic, and any change in Tiled will be reflected instantly in the ROM when we rebuild.
