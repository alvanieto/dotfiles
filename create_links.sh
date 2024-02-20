#!/bin/bash

FILES=".bashrc .hgrc .dir_colors .vimrc .vim .pylintrc .gdbinit .inputrc .gitconfig"

for file in ${FILES}
do
    ln -s ~/proyectos/dotfiles/${file} ~/${file}
done

FILES="config i3status.conf config.toml"

mkdir -p ~/.config/i3
for file in ${FILES}
do
    ln -s ~/proyectos/dotfiles/.config/i3/${file} ~/.config/i3/${file}
done

ln -s ~/proyectos/dotfiles/.config/picom.conf ~/.config/picom.conf

mkdir -p ~/.config/nvim
ln -s ~/proyectos/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/lvim
ln -s ~/proyectos/dotfiles/.config/lvim/config.lua ~/.config/lvim/config.lua

mkdir -p ~/.config/alacritty
ln -s ~/proyectos/dotfiles/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

mkdir -p ~/utils
ln -s ~/proyectos/dotfiles/utils/diff_one_file.sh ~/utils/diff_one_file.sh
