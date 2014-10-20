#!/usr/bin/env bash

set -e

function confln {
  ln -si "${sourceDir}/$1" ~/.$1
}

sourceDir="${HOME}/Dropbox/dev-box"

echo 'Set up vim...'
confln 'vim'
ln -i $HOME/.vim/vimrc $HOME/.vimrc
vim +PluginInstall +qall
echo 'Vim has been set up!'

echo 'Set up tmux...'
confln 'tmux'
ln -i $HOME/.tmux/tmux.conf $HOME/.tmux.conf
echo 'tmux has been set up!'
