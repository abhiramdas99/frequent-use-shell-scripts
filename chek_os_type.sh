#!/bin/bash
#################################################
# This script retrive os name, then conditionally 
# we can perform OS specific task 
#----------------------------------------------
# Author : abhiram 
# Date   : 09/06/2023
#################################################

osname=$(grep '^NAME=' /etc/os-release | cut -d "=" -f2 | tr -d '"' | tr '[:upper:]' '[:lower:]')

if [ "ubuntu" = "$osname" ]
then
        echo "The OS name is :$osname"
else
        echo "Not get valid OS"
fi
