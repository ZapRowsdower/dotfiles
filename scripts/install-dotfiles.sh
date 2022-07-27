#!/bin/bash

BACKUP_DIR="${HOME}/dotfiles-private"
BASH_BACKUP_DIR="${BACKUP_DIR}/bash"
ZSH_BACKUP_DIR="${BACKUP_DIR}/zsh"
VIM_BACKUP_DIR="${BACKUP_DIR}/vim"
backupPaths=("$BACKUP_DIR" "$BASH_BACKUP_DIR" "$ZSH_BACKUP_DIR" "$VIM_BACKUP_DIR")

for p in ${backupPaths[@]}; 
do
  mkdir -p $p
done

echo "$(ls -la $HOME/dotfiles-private)"
echo "Backing up existing dotfiles to ${BACKUP_DIR}..."
echo "Moving bash, profile dotfiles to ${BASH_BACKUP_DIR}..."
mv ~/.profile "${BASH_BACKUP_DIR}/.profile"
mv ~/.bash_profile "${BASH_BACKUP_DIR}/.bash_profile"
mv ~/.bashrc "${BASH_BACKUP_DIR}/.bashrc"

echo "Moving zsh dotfiles to ${ZSH_BACKUP_DIR}..."
mv ~/.zprofile "${ZSH_BACKUP_DIR}/.zprofile"
mv ~/.zshrc "${ZSH_BACKUP_DIR}/.zshrc"

echo "Moving vim dotfiles to ${VIM_BACKUP_DIR}..."
mv ~/.vimrc "${VIM_BACKUP_DIR}/.vimrc"

ln -s ~/dotfiles/bash/.profile ~/.profile
ln -s ~/dotfiles/bash/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/bash/.bashrc ~/.bashrc
ln -s ~/dotfiles/zsh/.zprofile ~/.zprofile
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
# mkdir -p ~/.config/nvim &&
# ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
