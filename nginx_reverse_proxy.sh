#!/bin/bash

sudo apt install nginx certbot

sudo mkdir /etc/nginx/snippets/ssl
sudo touch /etc/nginx/snippets/ssl/common.conf
sudo touch /etc/nginx/snippets/ssl/example.org.conf
sudo touch /etc/nginx/sites-available/example.org.conf
sudo touch /etc/nginx/snippets/example.org.conf

cat ./setup_nginx_reverse_proxy/snippets/ssl/common.conf | sudo tee /etc/nginx/snippets/ssl/common.conf
cat ./setup_nginx_reverse_proxy/snippets/ssl/example.org.conf | sudo tee /etc/nginx/snippets/ssl/example.org.conf
cat ./setup_nginx_reverse_proxy/sites-available/example.org.conf | sudo tee /etc/nginx/sites-available/example.org.conf
cat ./setup_nginx_reverse_proxy/snippets/example.org.conf | sudo tee /etc/nginx/snippets/example.org.conf

ln -sr /etc/nginx/sites-available/example.org.conf /etc/nginx/sites-enabled/

openssl dhparam -out /etc/nginx/dhparam.pem 2048

nginx -t
systemctl reload nginx