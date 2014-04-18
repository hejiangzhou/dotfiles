LOCAL_DIR=$(cd "$(dirname $0)" && pwd)
DOTFILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

safe_symlink()
{
    SRC=$1
    DEST=$2
    if [ -L "$DEST" ]; then
        rm -f "$DEST"
    fi
    if [ -e "$DEST" ]; then
        rm -i "$DEST"
    fi
    if ! [ -e "$DEST" ]; then
        ln -s "$SRC" "$DEST"
    else
        echo "Skip $DEST"
    fi
}

mod_enable()
{
    $DOTFILES_DIR/mod-enable $1/mods.available/$2
}
