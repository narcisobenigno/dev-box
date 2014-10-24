#!/usr/bin/env bash

echo 'Set up vim...'

installMissing 'macvim' '--env-std --override-system-vim'

confln 'vim'
ln -i $HOME/.vim/vimrc $HOME/.vimrc
vim +PluginInstall +qall
echo 'Vim has been set up!'
