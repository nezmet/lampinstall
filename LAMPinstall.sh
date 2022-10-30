#!/usr/bin/bash -x

# UBUNTU SERVER LAMP INSTALL SCRIPT

# UPDATE UBUNTU 
apt update
apt upgrade

# DOWNLOAD LAMP PACKAGES SILENTLY
DEBIAN_FRONTEND=noninteractive apt install mariadb-server apache2 phpmyadmin libapache2-mod-php -y

# ALLOW APACHE IN FIREWALL
ufw allow 'Apache'

# DOUBLE CHECK SERVICES ARE ENABLED (SHOULD NOT BE NEEDED BUT DOES NOT HURT)
systemctl enable apache2
systemctl enable mariadb

# CONFIGURE PHPMYADMIN FOR APACHE2
cp /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
a2enconf phpmyadmin

# SET MYPHPADMIN PASSWORD TO 'ADMIN'
mysql -u root -e "SET PASSWORD FOR root@'localhost' = PASSWORD('admin');"

# RESTART APACHE
systemctl reload apache2

# INSTALL SAKILA SAMPLE DB
curl https://downloads.mysql.com/docs/sakila-db.tar.gz
tar -xvzf community_images.tar.gz -C ~/Documents/
mysql
SOURCE ~/Documents/sakila-db/sakila-schema.sql;
SOURCE ~/Documents/sakila-db/sakila-data.sql
