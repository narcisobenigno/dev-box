#!/usr/bin/env bash

echo 'Set up vim...'

installMissing 'macvim' '--env-std --override-system-vim'

confln 'vim'
ln -i $HOME/.vim/vimrc $HOME/.vimrc
vim +PluginInstall +qall
if [ -f "${sourceDir}/confs/vimext/haskell.sh" ]; then
  $sourceDir/confs/vimext/haskell.sh
fi
echo 'Vim has been set up!'
