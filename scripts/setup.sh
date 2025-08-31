#!/bin/sh

rm -rf ~/.config/wezterm/*
cp -r ./dotfiles/wezterm/* ~/.config/wezterm

rm -rf ~/.config/starship.toml
cp -r ./dotfiles/starship.toml ~/.config

rm -rf ~/.bashrc
cp -r ./dotfiles/.bashrc ~/

rm -rf ~/AppData/Local/lazygit/*
cp -r ./dotfiles/lazygit/* ~/AppData/Local/lazygit

rm -rf ~/AppData/Local/superfile/*
cp -r ./dotfiles/superfile/* ~/AppData/Local/superfile

rm -rf ~/AppData/Roaming/bat/*
cp -r ./dotfiles/bat/* ~/AppData/Roaming/bat
