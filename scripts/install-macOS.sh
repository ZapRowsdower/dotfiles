#!/bin/bash
source ./iniget.sh
if ! [ -x "$(command -v brew)" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

function install {
    which $1 &>/dev/null
    
    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        arch -arm64 brew install $1
    else
        echo "Already installed: ${1}"
    fi
}

commonProgramsToInstall=$(iniget ./programs/Inventory common)

for program in $commonProgramsToInstall; do
    install "$program"
done

macProgramsToInstall=$(iniget ./programs/Inventory macos)

for program in $macProgramsToInstall; do
    install "$program"
done