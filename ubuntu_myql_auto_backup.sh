##############################################################
# BEFORE EXECUTE THE SCRIPT PLEASE READ THE INSTRUCTION CAREFULLY 
# ----------------------------------------------------------
# Author : abhiram Das | abhiramdas99@gmail.com
# ----------------------------------------------------------
# About Script : 
# After run this script it will take the backup of  mysql 
# database. further you can link to kron job to take the 
# schedule backup automatically
# ----------------------------------------------------------
# Instruction -
# 1) create bash file 
# 2) create crone job 
#    a) command to open crontabe tool : sudo crontab -e
#    b) add the below line end of file. It will take the backup everyday night 1 : 00 AM 
#     0 1 * * * /root/myscript/script_mysql_backup.sh
#############################################################


#!/bin/bash

# (1) set up all the mysqldump variables
DATE=`date +"%d_%b_%Y_%H%M"`
DATABASE=ums_spcc_dev
SQLFILE=/mnt/share/backup/${DATABASE}_${DATE}.sql
USER=root
PASSWORD=<mentioned your root  password of myslq >
# (2) in case you run this more than once a day,
# remove the previous version of the file
unalias rm     2> /dev/null
rm ${SQLFILE}     2> /dev/null
rm ${SQLFILE}.gz  2> /dev/null

# (3) do the mysql database backup (dump)
sudo mysqldump -u ${USER} -p${PASSWORD} ${DATABASE}|gzip > ${SQLFILE}.gz

# (4) delete backups older than 30 days
sudo find /mnt/share/backup/. -mtime +30 -exec rm {} \;
# note that mentioned your storage location path 



