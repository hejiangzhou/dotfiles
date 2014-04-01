#!/bin/bash
source $(dirname $0)/../install-lib.sh

safe_symlink $LOCAL_DIR/.bashrc ~/.bashrc
safe_symlink $LOCAL_DIR/.bash_profile ~/.bash_profile

