#!/bin/bash
#
# Script creates symlinks for all files from current dir to home dir
#

dir=`pwd`
olddir=~/dotfiles.old
files=`ls -I "README*" -I "*.sh"`

echo "Creating backup dir $olddir"
mkdir -p $olddir 

for file in $files; do
  if [ -f ~/$file ]; then
    mv ~/.$file $olddir
  fi

  echo "Symlinking $file in home directory"
  ln -s $dir/$file ~/.$file
done
source ~/.bash_aliases
