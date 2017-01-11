#!/bin/sh

# Update System
sudo apt-get update -y
sudo apt-get upgrade -y
# Install Unzip
sudo apt-get install unzip -y

# ModSecurity
sudo apt-get install libapache2-mod-security2 -y
# ModSecurity | Configuration
sudo wget https://raw.githubusercontent.com/SpiderLabs/owasp-modsecurity-crs/v3.0/master/crs-setup.conf.example
sudo mv crs-setup.conf.example /etc/modsecurity/modsecurity.conf
# ModSecurity | t3ModSec.conf
wget https://raw.githubusercontent.com/avarx/t3ModSec/master/t3ModSec.conf
sudo cat t3ModSec.conf >> /etc/apache2/apache2.conf
rm -rf t3ModSec.conf
# ModSecurity | Rules
wget https://github.com/SpiderLabs/owasp-modsecurity-crs/archive/v3.0/master.zip
unzip master.zip
sudo mv owasp-modsecurity-crs-3.0-master /etc/apache2/conf-available/owasp-modsecurity-crs-3.0.0
# ModSecurity | aliases
wget https://raw.githubusercontent.com/Apache-Labor/labor/master/bin/.apache-modsec.alias
cat .apache-modsec.alias >> ~/.bash_aliases
rm -rf .apache-modsec.alias

# Cleanup
cd ..
rm -rf t3ModSec

# PHP
sudo apt-get install -y php-soap
sudo apt-get install -y php-zip
sudo apt-get install -y php-xml

# Apache reload
sudo service apache2 reload

# TYPO3
curl -L -o typo3_src.tgz https://get.typo3.org/8.5.1
tar -xzvf typo3_src.tgz
ln -s typo3_src-8.5.1 typo3_src
ln -s typo3_src/index.php index.php
ln -s typo3_src/typo3 typo3
rm -rf typo3_src.tgz
touch FIRST_INSTALL