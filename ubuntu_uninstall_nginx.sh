#!/bin/bash

##############################################
#author : abhiram
#date   : 08/09/2022
#
#--------------------------------------------
#About script :
#The script is completely uninstall the
#nginx in ubuntu machine
#------------------------------------------
#
#-------------------------------------------
#Limitaion : only execute in ubuntu machine
##############################################

# uninstall NGINX Management Suite
sudo apt-get remove nms-*
sudo systemctl stop clickhouse-server
sudo apt-get remove clickhouse-server

# uninstall API Connectivity Manager
sudo apt-get remove nms-api-connectivity-manager
sudo apt-get remove nginx-devportal

# uninstall App Delivery Manager
sudo apt-get remove nms-adm

# uninstall the Security Monitoring module
sudo apt-get remove nms-sm

# uninstall NGINX Agent
sudo systemctl stop nginx-agent
sudo apt-get remove nginx-agent
