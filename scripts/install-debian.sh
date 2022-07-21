#!/bin/bash
source ./iniget.sh
# Update using debian pkg manager and get standard repository programs
sudo apt update && sudo apt full-upgrade -y

function install {
    which $1 &>/dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        sudo apt install -y $1
    else
        echo "Already installed: ${1}"
    fi
}

# Basics
# install ripgrep
# install brave-browser
# install curl
# install git
# install htop
# install tree
# install vim
# install wget
# install gnome-tweak-tool
# install gnome-shell-extensions
# install neofetch

# # Image processing
# install gimp

commonProgramsToInstall=$(iniget ./programs/Inventory common)

for program in $commonProgramsToInstall; do
    install "$program"
done

debianPrograms=$(iniget ./programs/Inventory debian)

for program in $debianPrograms; do
    install "$program"
don

# Run all scripts in programs/
for f in programs/*.sh; do bash "$f" -H; done

# Get all upgrades
sudo apt upgrade -y
sudo apt autoremove -y
