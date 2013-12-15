#!/bin/sh
# brew_notify.sh | Curtis Free (http://curtisfree.com)
# Assumes that Ruby has been installed with Homebrew and that the MacLight gem has been installed.

# launchd's PATH does not include Homebrew executables or installed gems
bin=/usr/local/bin
brew=${bin}/brew
maclight=$(${bin}/gem environment | grep "\- EXECUTABLE DIRECTORY" | sed "s/.*: //")/maclight

${brew} update &>/dev/null
[ "$(${brew} outdated)" != "" ] && light_on=1 || light_on=0
${maclight} keyboard toggle --capslock ${light_on}

