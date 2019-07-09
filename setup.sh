#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle

cd $HOME
rcup -d $HOME/dotfiles
cd -

curl -L https://get.oh-my.fish | fish
fish -c "omf install bang-bang"
fish -c "omf install nvm"
