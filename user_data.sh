#!/bin/bash
# Script to install & configure Nginx + PHP and display hostname

apt update -y

# install nginx & php
apt install -y nginx php7.4-cli php-fpm
systemctl start nginx
systemctl enable nginx

# enable firewall
ufw allow 22
ufw enable
ufw allow 'Nginx HTTP'
ufw allow 'Nginx HTTPS'
ufw allow 'Nginx Full'

# create new nginx server block
echo "server {
        listen 80;
        root /var/www/html;
        index index.php index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                try_files \$uri \$uri/ =404;
        }

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
       }

       location ~ /\.ht {
            deny all;
       }
} " > /etc/nginx/sites-available/test


# enable new nginx server block
ln -s /etc/nginx/sites-available/test /etc/nginx/sites-enabled/


# disable default nginx server block
unlink /etc/nginx/sites-enabled/default

systemctl reload nginx


# display hostname
echo '<?php
                 Print "<h1><center>".gethostname()."</center></h1>";
?>' > /var/www/html/index.php