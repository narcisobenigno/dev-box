#!/usr/bin/env bash

echo 'Set up vim...'

installMissing 'macvim' '--env-std --override-system-vim'
installMissing 'cabal-install'

confln 'vim'
ln -i $HOME/.vim/vimrc $HOME/.vimrc
vim +PluginInstall +qall

make --directory="${HOME}/.vim/bundle/vimproc.vim/"

echo 'Vim has been set up!'
