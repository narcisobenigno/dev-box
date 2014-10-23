#!/usr/bin/env bash

function confln {
  ln -si "${sourceDir}/$1" $HOME/.$1
}

function installMissing {
  checkIfIsInstalled=`brew ls --versions $1`
  if [ -z "${checkIfIsInstalled}" ]; then
    echo "Installing $1"
    brew install $1 $2
  fi
}

export -f confln
export -f installMissing

export sourceDir="${HOME}/Dropbox/dev-box"

for conf in ${sourceDir}/confs/*.sh; do
  source $conf
done

unset sourceDir
unset confln
unset installMissing
