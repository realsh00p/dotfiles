#!/usr/bin/env bash

PWD="$(pwd)"
WHOAMI="$(whoami)"

if [ "$PWD" != "/home/$WHOAMI/.dotfiles" ]; then
    echo "ERROR: script must be run from /home/$WHOAMI/.dotfiles"
    exit 1
fi

# arg1: dotfiles path
# arg2: config path
function safeln () {
    DOTFILES_PATH="$PWD/$1"
    CONFIG_PATH="$HOME/.config/$2"

    echo "INFO: safeln called with DOTFILES_PATH=$DOTFILES_PATH and CONFIG_PATH=$CONFIG_PATH"

    if [ -f "$DOTFILES_PATH" ]; then
        echo "INFO: target $DOTFILES_PATH is a file"
        DIRNAME="$(dirname "${CONFIG_PATH}")"
        if [ ! -d "$DIRNAME" ]; then
            echo "INFO: directory $DIRNAME doesn't exist, creating..."
            mkdir -p "$DIRNAME"
        fi
    else
        echo "INFO: target $DOTFILES_PATH is a directory"
    fi

    if [ -f "$CONFIG_PATH" ] || [ -d "$CONFIG_PATH" ] || [ -L "$CONFIG_PATH" ]; then
        echo -e "ERROR: directory or file exists, or is a symlink ($CONFIG_PATH)\n"
        return
    fi

    if ! ln -s "$DOTFILES_PATH" "$CONFIG_PATH"; then
        echo -e "ERROR: could not create symlink from $CONFIG_PATH to target $DOTFILES_PATH, error code: $?\n"
        return
    fi

    echo -e "INFO: successfully linked $CONFIG_PATH to target $DOTFILES_PATH\n"
}

safeln 'fish' 'fish'
safeln 'i3' 'i3'
safeln 'i3-polybar'  'polybar'
safeln 'i3-rofi' 'rofi'
safeln 'i3-networkmanager-dmenu' 'networkmanager-dmenu'
safeln 'i3-networkmanager-dmenu-config/config.ini' 'networkmanager-dmenu/config.ini'
safeln 'xfce4/terminal/colorschemes/gruvbox.theme' 'xfce4/terminal/colorschemes/gruvbox.theme'

