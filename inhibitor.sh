#!/bin/bash

function banner {
    echo "      ** MDM Inhibitor by Francesco Masala **"
    echo "** Tested on iPad Pro 10.5 with mosyle MDM + DUP**"
    echo "         Can cause a thermonuclear war lol"
}

function usage {
    echo "Usage:"
    echo -e "./inhibitor.sh --help\t Show this guide"
    echo -e "./inhibitor.sh --inhibit\t Inhibits the MDM"
    echo -e "./inhibitor.sh --backup\t Backups the MDM profile"
    echo -e "./inhibitor.sh --version\t Shows the version of the script"
}

# Shows the banner
banner

if [ -z $1 ]; then
    echo "Missing argument";
    usage
    
elif [ $1 == "--help" ]; then
    usage
    
elif [ $1 == "--backup" ]; then
    echo "Info: backup will be on /MDM-Backup"
    echo "!! Starting Backup !!"
    echo "** Creating Directory **"
    mkdir /MDM-Backup
    echo "** Directory Created **"
    echo "** Backing up profiles **"
    cp /private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/ /MDM-backup
    echo "!! Done !!"
    
elif [ $1 == "--inhibit" ]; then
    echo "!! Inhibiting MDM profile !!"
    rm -rf /private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/ 
    echo "!! Done !!"
    
elif [ $1 == "--version" ]; then
    echo " Version 0.1 "
    
else
    usage
fi
