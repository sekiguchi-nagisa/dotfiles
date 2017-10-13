#!/bin/sh

SCRIPT_DIR="$(cd $(dirname $0) && pwd -P)"

cp $SCRIPT_DIR/.vimrc ~/
mkdir ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim \
~/.vim/bundle/neobundle.vim
