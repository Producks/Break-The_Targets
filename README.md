# Break the targets
My entry for SMW Central [SMB2 level design contest](https://www.smwcentral.net/?p=viewthread&t=130297&page=1&pid=1652030#p1652030).

[Clear video of the level](https://www.youtube.com/watch?v=jsrPxex7x3g)  

I only had 10 days to make this, imagine what could be made with the full 20 days

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
Metatiles of 32 pixels per 32 pixels (4x4 of the foreground metatile). These are bonker for saving space and make the levels look more unique Any configuration of blocks can easily be made to fit what's needed. This also use the RLE system.
![](https://github.com/Producks/Break-The_Targets/blob/main/doc/background.PNG?raw=true)

### Foreground layer
Metatiles of 16 pixels per 16 pixels (4x4 of 8x8 pixels tile). This is what the vanilla game uses, but I use them with the RLE configuration to save space. I made custom, unique tiles for every tile in this hack!
![](https://github.com/Producks/Break-The_Targets/blob/main/doc/foreground.PNG?raw=true)

### Sprite layer
This is pretty much what the game uses, but since all sprites were unique, I had to set them up correctly in the tileset.
![](https://github.com/Producks/Break-The_Targets/blob/main/doc/sprites.PNG?raw=true)  

### End result
![](https://github.com/Producks/Break-The_Targets/blob/main/doc/final%20result.PNG?raw=true)
The result of each layer is saved individually as a `.csv` file and is set up in the `build.sh` file to be automatically included every time we build. This makes it dynamic, and any change in Tiled will be reflected instantly in the ROM when we rebuild. The spawn X/Y position, the facing postion, which music, which restriciton and which character to use were setup by hand directly in some tables.


## Music/SFX
Having music was a priority for me, the best option was to use [FamiStudio audio driver](https://famistudio.org/). 
You can import `NSF` files directly from other games or download them from YouTube videos that people have made. here are a bunch of other file types that are also supported. This made it extremely fast and easy to import music once everything was set up. I did have to add some [code/system](https://github.com/Producks/Break-The_Targets/blob/6239a144cdff4824310c3d4b1b8a470900b0ad90/src/famistudio_asm6.asm#L7502) to make this all work, but once it was set up, it was a breeze.  

This method is so easy that I doubt anything will top this anytime soon.  

The version of FamiStudio I was using was bugged for DPCM, but once it's fixed, a more in-depth tutorial could be made if there is any demand.

### Finding the song
Let's take one of the songs I used as an example, `Together We Ride`. You can find the song [here](https://www.youtube.com/watch?v=IoGIq-caOXM); I just downloaded the NSF file from the description. A big shoutout to [VinylCheese](https://www.youtube.com/@SwissVinyl) for these sick covers.

### Famistudio software time
Load up the file that is compatible with FamiStudio and adjust the song so it loops correctly. Then, export it as an `asm6` file.
![](https://github.com/Producks/Break-The_Targets/blob/main/doc/export_famistudio.PNG?raw=true)

### Time to import it!
Once you have the music file FamiStudio generated, all I did was import it into a place that had space. For example, [bank C](https://github.com/Producks/Break-The_Targets/blob/main/src/prg-c.asm) had plenty of space for it. I added the track to my [songlist system](https://github.com/Producks/Break-The_Targets/blob/6239a144cdff4824310c3d4b1b8a470900b0ad90/src/prg-e-f.asm#L2017), gave the [info in what bank it was in](https://github.com/Producks/Break-The_Targets/blob/6239a144cdff4824310c3d4b1b8a470900b0ad90/src/prg-e-f.asm#L2002), gave it an [ID](https://github.com/Producks/Break-The_Targets/blob/6239a144cdff4824310c3d4b1b8a470900b0ad90/src/prg-e-f.asm#L1990C1-L1990C17) and that was pretty much it! Once set up, it's incredibly fast to import new songs, no more than 5 minutes of work.

## Song list
[Pictionary by Tim Follin](https://www.youtube.com/watch?v=SJwh3erQlyE)  
[Treasure Master by Tim Follin](https://www.youtube.com/watch?v=8wZGVazbJYY)  
[Astronomia 2K19 by 브금맨 JX](https://www.youtube.com/watch?v=4Frn8z8IiDA)  
[Super Bell Hill - Super Mario 3D World by 브금맨 JX](https://www.youtube.com/watch?v=Igp4aAShhcw)  
[Song of Storms - Zelda: Ocarina of Time by VinylCheese](https://www.youtube.com/watch?v=STGVwdcSlUI)  
[Together We Ride - Fire Emblem by VinylCheese](https://www.youtube.com/watch?v=IoGIq-caOXM)
## Credits
Check the end screen of the level :)
