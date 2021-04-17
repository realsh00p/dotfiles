#!/bin/sh
PWD="$(pwd)"
ln -s "$PWD/fish" "$HOME/.config/fish"
ln -s "$PWD/i3" "$HOME/.config/i3"
ln -s "$PWD/i3-polybar" "$HOME/.config/polybar"
ln -s "$PWD/i3-rofi" "$HOME/.config/rofi"
ln -s "$PWD/i3-networkmanager-dmenu" "$HOME/.config/networkmanager-dmenu"
ln -s "$PWD/i3-networkmanager-dmenu-config/config.ini" "$HOME/.config/networkmanager-dmenu/config.ini"
ln -s "$PWD/xfce4/terminal/colorschemes/gruvbox.theme" "$HOME/.config/xfce4/terminal/colorschemes/gruvbox.theme"
