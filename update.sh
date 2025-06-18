#!/bin/sh

DESTINO=~/AppData/Local/nvim/dotfiles

# Borrar todo lo que hay dentro del directorio destino
rm -rf "$DESTINO"/*

# Copiar archivos al directorio destino
cp -r ~/.config/wezterm "$DESTINO/"
cp -r ~/.config/starship.toml "$DESTINO/"
cp -r ~/.bashrc "$DESTINO/"
cp -r ~/AppData/Local/lazygit "$DESTINO/"
cp -r ~/AppData/Local/superfile "$DESTINO/"
cp -r ~/AppData/Roaming/bat "$DESTINO/"
