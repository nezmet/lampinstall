### LAMPinstall.sh ###
## A LAMP suite installer script
# Built for classroom use to reproduce Ubuntu Server clones into fresh LAMP installs quickly.

Feel free to use if you can produce any value out of it.

Built and tested on Ubuntu Server 22.04
Run as SUDO. As with anything review the code before running as sudo... not on me if you have undesired results.
Script is non-interactive once it gets started.
It installs Apache2, MariaDB, phpmyadmin and the Sakila sample DB.

MariaDB defaults will be root / admin once complete.

Use from ubuntu:
```
git clone https://github.com/nezmet/lampinstall
sudo /lampinstall/LAMPinstall.sh
