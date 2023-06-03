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

################################################
# ON PASSWORD RELATED IISSUE  RUN THE FOLLWOING COMMAND
# sudo pkill -f mysql_secure_installation ;
# sudo mysql ;
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'my-secret-password';
################################################
