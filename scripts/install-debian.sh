#!/bin/bash
source ./iniget.sh
# Update using debian pkg manager and get standard repository programs
sudo apt update && sudo apt full-upgrade -y &&

# Switch to nala pkg manager for better UX
source ./nala.sh &&

function install {
    which $1 &>/dev/null

    if [ $? -ne 0 ]; then
        echo "Installing: ${1}..."
        sudo nala install -y $1
    else
        echo "Already installed: ${1}"
    fi
}

commonProgramsToInstall=$(iniget ./programs/Inventory common)

for program in $commonProgramsToInstall; do
    install "$program"
done

debianPrograms=$(iniget ./programs/Inventory debian)

for program in $debianPrograms; do
    install "$program"
done

# Run all scripts in programs/
# for f in programs/*.sh; do bash "$f" -H; done

# Get all upgrades
sudo nala upgrade -y
sudo nala autoremove -y
