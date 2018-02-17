#!/bin/zsh
dir="$HOME/workspace"
mkdir -p $dir
cd $dir
git clone --recursive git://github.com/karlboyle/dotfiles.git
cd dotfiles
./symlink-dotfiles.sh