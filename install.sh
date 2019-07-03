#!/bin/bash

DOT_FILES=(
    .zshrc
    .bashrc
    .bash_profile
    .vimrc
    .gvimrc
    .git_templates
)

for file in ${DOT_FILES[@]}
do
	ln -s $HOME/dotfiles/$file $HOME/$file
done
