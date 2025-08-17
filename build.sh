#!/bin/sh

build() {
	tools/asm6f smb2.asm -n -c -L bin/smb2.nes bin/smb2.lst "$@" > bin/assembler.log
}

cd ./tiled_parser

./foreground Area0_Foreground.csv "LevelDataArea0"
./background Area0_Background.csv "Area0BackgroundBlocks"
./sprites  Area0_Sprites.csv "EnemyData_Level_1_1_Area0"

./foreground Area1_Foreground.csv "LevelDataArea1"
./background Area1_Background.csv "Area1BackgroundBlocks"
./sprites  Area1_Sprites.csv "EnemyData_Level_1_1_Area1"

./foreground Area2_Foreground.csv "LevelDataArea2"
./background Area2_Background.csv "Area2BackgroundBlocks"
./sprites  Area2_Sprites.csv "EnemyData_Level_1_1_Area2"

./foreground Area3_Foreground.csv "LevelDataArea3"
./background Area3_Background.csv "Area3BackgroundBlocks"
./sprites  Area3_Sprite.csv "EnemyData_Level_1_1_Area3"

./foreground Area3_Foreground.csv "LevelDataArea3"
./background Area3_Background.csv "Area3BackgroundBlocks"
./sprites  Area3_Sprite.csv "EnemyData_Level_1_1_Area3"

./foreground Area4_Foreground.csv "LevelDataArea4"
./background Area4_Background.csv "Area4BackgroundBlocks"
./sprites  Area4_Sprites.csv "EnemyData_Level_1_1_Area4"

./foreground Area5_Foreground.csv "LevelDataArea5"
./background Area5_Background.csv "Area5BackgroundBlocks"
./sprites  Area5_Sprites.csv "EnemyData_Level_1_1_Area5"

./foreground Area6_Foreground.csv "LevelDataArea6"
./background Area6_Background.csv "Area6BackgroundBlocks"
./sprites  Area6_Sprites.csv "EnemyData_Level_1_1_Area6"

./foreground Area7_Foreground.csv "LevelDataArea7"
./background Area7_Background.csv "Area7BackgroundBlocks"
./sprites  Area7_Sprites.csv "EnemyData_Level_1_1_Area7"

cd ..

echo 'Assembling...'
build $@

if [ $? -ne 0 ] ; then
	echo 'Build failed!'
	exit 1
fi

echo 'Build succeeded.'
