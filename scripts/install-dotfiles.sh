#!/bin/bash
ln -s ~/dotfiles/bash/.profile ~/.profile
ln -s ~/dotfiles/bash/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/dotfiles/zsh/.zprofile ~/.zprofile
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
mkdir -p ~/.config/nvim/init.vim &&
ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim   