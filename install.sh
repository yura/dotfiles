#!/bin/bash
#
# Script creates symlinks for all files from current dir to home dir
#

dir=`pwd`
olddir=~/dotfiles.old
files=`ls | grep -v README | grep -v *.sh`

echo "Creating backup dir $olddir"
mkdir -p $olddir 

for file in $files; do
  echo "Checking .$file ..."
  if [ -f ~/.$file ]; then
    echo "  moving .$file"
    mv ~/.$file $olddir
  else
    echo "  not found"
  fi

  echo "Symlinking $file in home directory"
  ln -sf $dir/$file ~/.$file
done
source ~/.bash_aliases
