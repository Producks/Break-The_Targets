#!/bin/sh

PRG0="47ba60fad332fdea5ae44b7979fe1ee78de1d316ee027fea2ad5fe3c0d86f25a"
PRG1="6ca47e9da206914730895e45fef4f7393e59772c1c80e9b9befc1a01d7ecf724"
SM_USA="c63bacd07cf0d2336e8a4f9b9c556d0758629f102211d989d92495e117a8b3a0"


compareHash() {
	echo $1 $2 | sha256sum --check > /dev/null 2>&1
}

build() {
	tools/asm6f smb2.asm -n -c -L bin/smb2.nes bin/smb2.lst "$@" > bin/assembler.log
}

cd ./tiled_parser

./foreground Area0_Foreground.csv "LevelDataArea0"
./background Area0_Background.csv "Area0BackgroundBlocks"
./sprites  Area0_Sprites.csv "EnemyData_Level_1_1_Area0"

cd ..

echo 'Assembling...'
build $@

if [ $? -ne 0 ] ; then
	echo 'Build failed!'
	exit 1
fi

echo 'Build succeeded.'

cmd.exe /c start C:/Users/davet/Desktop/Mesen.exe //wsl.localhost/Ubuntu/home/dave/Double-Trouble/bin/smb2.nes > /dev/null 2>&1
