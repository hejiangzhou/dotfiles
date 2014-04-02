#!/bin/bash
source $(dirname $0)/../install-lib.sh

if ! [ -d ~/.vim/bundle/vundle ]; then
  echo "Vundle is missing, try to install it..."
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle && \
      vim +PluginInstall +qall
fi

safe_symlink $LOCAL_DIR/.vimrc ~/.vimrc
