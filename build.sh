#!/usr/bin/env bash

set -e

function confln {
  ln -si "${sourceDir}/$1" ~/.$1
}

sourceDir="${HOME}/Dropbox/dev-box"

echo 'Set up vim...'
confln 'vim'
ln -i ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall
echo 'Vim has been set up!'

set -x
echo 'Set up tmux...'
confln 'tmux'
ln -i ~/.tmux/tmux.conf ~/.tmux.conf
echo 'tmux has been set up!'
