#!/usr/bin/env bash

function confln {
  ln -si "${sourceDir}/$1" ~/.$1
}

export -f confln

sourceDir="${HOME}/Dropbox/dev-box"

for conf in ${sourceDir}/confs/*; do
  source $conf
done

unset confln
