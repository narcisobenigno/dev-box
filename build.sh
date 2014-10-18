#!/usr/bin/env bash

set -ex

echo 'Set up vim...'
sourceDir="${HOME}/Dropbox/dev-box"
ln -si "${sourceDir}/.vim" ~/.vim
ln -i ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall
echo 'Vim has been set up!'
