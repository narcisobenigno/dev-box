#!/usr/bin/env bash

echo 'Set up tmux...'
confln 'tmux'
checkIfCopyPasteIsInstalled=`brew ls --versions reattach-to-user-namespace`
if [ -z "${checkIfCopyPasteIsInstalled}" ]; then
  brew upgrade reattach-to-user-namespace
fi
ln -i $HOME/.tmux/tmux.conf $HOME/.tmux.conf
echo 'tmux has been set up!'
