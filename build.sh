#!/usr/bin/env bash

function confln {
  origin="${sourceDir}/$1"
  host="$HOME/.$1"
  if [ ! -L "$host" ]; then
    ln -si $origin $host
  fi
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
