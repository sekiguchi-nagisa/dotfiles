#!/bin/sh

# install fontforge
echo '--- install fontforge ---'
sudo zypper in -y fontforge

# install inconsolata font
echo '--- install inconsolata font'
sudo zypper in -y google-inconsolata-fonts

# install migu 1M font
echo '--- install migu-1m font ---'
MIGU_FONT='migu-1m-20150712'
wget https://osdn.jp/projects/mix-mplus-ipa/downloads/63545/${MIGU_FONT}.zip
unzip ${MIGU_FONT}.zip
(cd ./$MIGU_FONT && sudo cp *.ttf /usr/share/fonts/truetype)
sudo fc-cache -fv

# gnerate Ricty font
echo '--- generate Ricty font ---'
cd ./ext/Ricty
./ricty_generator.sh auto

echo '--- copy fonts to /usr/share/fonts/truetype ---'
sudo cp ./Ricty*.ttf /usr/share/fonts/truetype

echo '--- update font cache ---'
sudo fc-cache -fv
