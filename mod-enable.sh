#!/bin/bash

CURR_DIR=$PWD
while [ "$1" != "" ]; do
    if [ -e $1 ]; then
        MODULE_NAME=$(basename $1)
        DIR_PATH=$(dirname $1)
        DIR_NAME=$(basename "$DIR_PATH")
        if [ "$DIR_NAME" == "mods.available" ]; then
            INSTALLER_NAME="${MODULE_NAME%.*}.install"
            ERR=0
            if [ -x "$DIR_PATH/$INSTALLER_NAME" ]; then
                cd $DIR_PATH
                "./$INSTALLER_NAME"
                ERR=$?
                cd $CURR_DIR
            fi
            if [ $ERR != 0 ]; then
                echo "Error occurs while installing $1" >& 2
            else
                UPDIR_PATH=$(dirname "$DIR_PATH")
                DEST_DIR_PATH="$UPDIR_PATH/mods.enabled"
                DEST_PATH="$DEST_DIR_PATH/$MODULE_NAME"
                mkdir -p "$DEST_DIR_PATH"
                rm -f "$DEST_PATH"
                ln -s "../mods.available/$MODULE_NAME" "$DEST_PATH"
            fi
        else
            echo "$1 is not in mods.available" >& 2
        fi
    else
        echo "$1 does not exist" >& 2
    fi
    shift
done

