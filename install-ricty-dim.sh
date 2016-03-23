#!/bin/sh

echo '--- copy fonts to /usr/share/fonts/truetype ---'
sudo cp ./ext/RictyDiminished/*.ttf /usr/share/fonts/truetype

echo '--- update font cache ---'
sudo fc-cache -fv
