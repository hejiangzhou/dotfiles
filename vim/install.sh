#!/bin/bash
source $(dirname $0)/../install-lib.sh

safe_symlink $LOCAL_DIR/.vimrc ~/.vimrc

