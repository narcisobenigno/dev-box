#!/usr/bin/env bash

echo 'Set up tmux...'
installMissing 'tmux'
confln 'tmux'
installMissing 'reattach-to-user-namespace'

ln -i $HOME/.tmux/tmux.conf $HOME/.tmux.conf
echo 'tmux has been set up!'
