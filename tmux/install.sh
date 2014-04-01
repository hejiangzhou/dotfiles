#!/bin/bash
source $(dirname $0)/../install-lib.sh

safe_symlink $LOCAL_DIR/.tmux_conf ~/.tmux_conf

