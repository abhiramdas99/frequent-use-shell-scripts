# adding repository and installing nginx. Just replace your application in the place of "abhiapp"	
apt update
apt install nginx -y
cat <<EOT > abhiapp
upstream abhiapp {

 server app01:8080;

}

server {

  listen 80;

location / {

  proxy_pass http://abhiapp;

}

}

EOT

mv abhiapp /etc/nginx/sites-available/abhiapp
rm -rf /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/abhiapp /etc/nginx/sites-enabled/abhiapp

#starting nginx service and firewall
systemctl start nginx
systemctl enable nginx
systemctl restart nginx
