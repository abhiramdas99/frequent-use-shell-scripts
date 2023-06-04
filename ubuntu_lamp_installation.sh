
##############################################################
# -- PLEASE READ SCRIPT'S INSTRUCTION BEFORE EXEECUTE IT ----
# -----------------------------------------------------------
# * This script is completely install - apache + php + mysql + php my admin
# 1) The script is compatible for ubuntu OS
# 2) if its hang during running please use the following 
#    command in anather terminal and replace the secret 
#    password -
#     sudo pkill -f mysql_secure_installation ;
#     sudo mysql ;
#     ALTER USER 'root'@'localhost' IDENTIFIED WITH 
#     mysql_native_password by 'my-secret-password';  
#     2 is also important for phpmyadmin login 
# 3) For any aupdate and suggestion in script pleases email to 
#    abhiramdas99@gmail.com 
###############################################################


#!/bin/bash

# Update package lists
sudo apt update

# Install Apache
sudo apt install apache2 -y

# Install MySQL Server and client
sudo apt install mysql-server mysql-client -y

# Secure MySQL installation
sudo mysql_secure_installation

# Install PHP and necessary modules
sudo apt install php libapache2-mod-php php-mysql -y

# Restart Apache
sudo systemctl restart apache2

# Install PHPMyAdmin
sudo apt install phpmyadmin -y

# Configure PHPMyAdmin to work with Apache
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo a2enconf phpmyadmin.conf
sudo systemctl reload apache2

# Enable mod_rewrite for Apache
sudo a2enmod rewrite
sudo systemctl restart apache2

# Print PHP and MySQL versions
php --version
mysql --version

