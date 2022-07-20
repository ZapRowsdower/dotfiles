#!/bin/bash

if ! [- x "$(command -v brew)" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

function install {
    which $1 &>/dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        brew install $1
    else
        echo "Already installed: ${1}"
    fi
}

# Basics
# https://github.com/BurntSushi/ripgrep
install ripgrep
install brave-browser
install curl
install git
install htop
install tree
install vim
install wget
install neofetch
# Great WM: https://rectangleapp.com/
install rectangle