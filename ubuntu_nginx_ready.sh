# adding repository and installing nginx. Just replace your application in the place of "abhiapp"	
apt update
apt install nginx -y
#starting nginx service and firewall
systemctl start nginx
systemctl enable nginx
systemctl restart nginx
