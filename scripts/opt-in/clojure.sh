#!/bin/bash

brew install emacs

[[ -x $HOME/bin/lein ]] && {
  $HOME/bin/lein
} || {
  wget -O $HOME/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
  chmod a+x $HOME/bin/lein
  $HOME/bin/lein
}

