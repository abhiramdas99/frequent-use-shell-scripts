#!/bin/bash

#####################################################3
#  Alert : Witout knowldge please dont run this script
#  ---------------------------------------------------
#  About Script :
#  This script will delete the complete the directory
#  whose name are nginx any where in linux machine
#  Its very full during unintsall of any tools
#  ---------------------------------------------------
#  Author : Abhiram Das
#  Date   : 23/06/2021
#
#####################################################

for i in $(find / -type d -name nginx); do
        rm -r $i
done

