#!/usr/bin/env bash

echo 'Set up tmux...'
installMissing 'git'
confln 'git'

ln -si $HOME/.git/gitconfig $HOME/.gitconfig
echo 'git has been set up!'
