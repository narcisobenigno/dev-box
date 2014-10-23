#!/usr/bin/env bash

installMissing 'cabal-install'
installMissing 'ghc'

$HOME/.vim/bundle/haskell-vim-now/install.sh
