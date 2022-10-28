#!/usr/bin/bash -x

# Initial script worked. Refactored the apt command down to one line and added -y.
# Issues with phpmyadmin blank screen solved by adding libapache2-mod-php
# 
apt update
apt upgrade
apt install mariadb-server apache2 phpmyadmin libapache2-mod-php -y
ufw allow 'Apache'
systemctl enable apache2
systemctl enable mariadb
service apache2 restart


