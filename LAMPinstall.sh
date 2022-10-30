#!/usr/bin/bash -x

# UBUNTU SERVER LAMP INSTALL SCRIPT

# SET NON INTERACTIVE SCRIPT
export DEBIAN_FRONTEND=noninteractive

# UPDATE UBUNTU 
apt update
apt upgrade -y

# DOWNLOAD LAMP PACKAGES SILENTLY
apt install mariadb-server apache2 phpmyadmin libapache2-mod-php -y

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
tar -xvzf sakila-db.tar.gz
mysql
SOURCE ~/sakila-db/sakila-schema.sql;
SOURCE ~/sakila-db/sakila-data.sql
