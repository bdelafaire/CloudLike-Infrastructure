#!/usr/bin/env bash

# nginx
apt-get -y install nginx

cd /vagrant/nginx
sed -i "s/VM1_BACK_HOST/$VM1_BACK_HOST/" nginx.conf
sed -i "s/VM1_BACK_PORT/$VM1_BACK_PORT/" nginx.conf
sed -i "s/VM2_BACK_HOST/$VM2_BACK_HOST/" nginx.conf
sed -i "s/VM2_BACK_PORT/$VM2_BACK_PORT/" nginx.conf
sed -i "s/VM1_FRONT_HOST/$VM1_FRONT_HOST/" nginx.conf
sed -i "s/VM1_FRONT_PORT/$VM1_FRONT_PORT/" nginx.conf
sed -i "s/VM2_FRONT_HOST/$VM2_FRONT_HOST/" nginx.conf
sed -i "s/VM2_FRONT_PORT/$VM2_FRONT_PORT/" nginx.conf

# set up nginx server
cp /vagrant/nginx/nginx.conf /etc/nginx/sites-available/nginx.conf
chmod 644 /etc/nginx/sites-available/nginx.conf
sudo rm /etc/nginx/sites-availables/default
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf
service nginx restart

# clean /var/www
rm -Rf /var/www

# symlink /var/www => /vagrant
ln -s /vagrant /var/www
