#!/usr/bin/bash -x

# Initial script worked. Refactored the apt command down to one line and added -y.
# Issues with phpmyadmin blank screen solved by adding libapache2-mod-php
# 
apt update
apt upgrade
DEBIAN_FRONTEND=noninteractive apt install mariadb-server apache2 phpmyadmin libapache2-mod-php -y
ufw allow 'Apache'
systemctl enable apache2
systemctl enable mariadb

# CONFIGURE PHPMYADMIN FOR APACHE2
cp /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
a2enconf phpmyadmin

systemctl reload apache2


