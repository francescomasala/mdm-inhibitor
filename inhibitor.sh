#!/bin/bash

# Variables 
VERSION="0.4.9"

# Banner Function (Shows the banner lol)
function banner {
    echo "      ** MDM Inhibitor by Francesco Masala **" # It's Me!
    echo "** Tested on iPad Pro 10.5 with mosyle MDM + DUP**" 
    echo "         Can cause a thermonuclear war lol" #I don't think but oke
}

# Usage or Help Function (Shows the guide for using this script)
function usage {
    echo "Usage:"
    echo -e "./inhibitor.sh --help\t Show this guide"
    echo -e "./inhibitor.sh --inhibit\t Inhibits the MDM"
    echo -e "./inhibitor.sh --backup\t Backups the MDM profile"
    echo -e "./inhibitor.sh --restore-backup\t Revert the MDM profile"
    echo -e "./inhibitor.sh --remove-backup\t remove the MDM profile"
    echo -e "./inhibitor.sh --version\t Shows the version of the script"
}

# Backup function, in case you delete something important
function backup {
    echo " [!] Backup will be on /MDM-Backup [!]"
    echo " [+] Starting Backup [+]"
    echo " [~] Creating Directory [~]"
    mkdir /MDM-Backup
    echo " [!] Directory Created [!]"
    echo " [!] Backing up profiles [!]"
    cp /private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/ /MDM-backup
    echo " [✓] Done [✓]"
}

# restore function, for restoring the backup
function restore {
    echo " [⭮] Reverting Backup [⭯]"
    cp /MDM-backup /private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/
    echo " [✓] Done [✓]"
}

# removeBackup function, for removing the backup
function removeBackup {
    echo "!! Deleting Backup !!"
    rm /MDM-backup 
    echo "!! Done !!"
}

# Uhh, my favorite the inhibit function, this piece of code inhibits the MDM profile
function inhibit {
    echo "!! Inhibiting MDM profile !!"
    rm -rf /private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/ 
    echo "!! Done !!"
}

# Shows the banner
banner

# Uhhh! Spaghetti code
if [ -z $1 ]; then
    echo "Missing argument";
    usage
######################################
elif [ $1 == "--help" ]; then
    usage
######################################
elif [ $1 == "--backup" ]; then
    backup
######################################
elif [ $1 == "--restore-backup" ]; then
    restore
######################################
elif [ $1 == "--delete-backup" ]; then
    removeBackup
######################################
elif [ $1 == "--inhibit" ]; then
    inhibit
######################################
elif [ $1 == "--version" ]; then
    echo "Version $VERSION"
######################################
else
    usage
fi
