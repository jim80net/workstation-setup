#!/usr/bin/env bash -evx

SCRIPTDIR=$(dirname $0)

echo "Making .bash_profile.d"

mkdir -p ${HOME:?}/.bash_profile.d/

cp -vR $SCRIPTDIR/../../files/.bash_profile.d/ ${HOME}/.bash_profile.d/
cp -vR /Keybase/private/jim80net/.bash_profile.d/ ${HOME}/.bash-profile.d/


echo
echo "Installing Jim tools"

brew install thefuck
brew install mosh
brew install ripgrep
brew install fd
brew install pandoc
brew install moreutils

brew cask install intel-power-gadget



