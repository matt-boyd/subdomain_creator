#!/bin/bash
echo "What's the name of the subdomain you want" 
domain=example.com
read subdomain 
mkdir /var/www/$subdomain
echo "<VirtualHost *:80>
        ServerAdmin webmaster@$subdomain.$domain
        ServerName $subdomain.$domain 
        DocumentRoot /var/www/$subdomain
        <Directory /var/www/$subdomain/>
            Options Indexes FollowSymLinks
            AllowOverride All
            Require all granted
        </Directory>
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet" > /etc/apache2/sites-available/$subdomain.$domain.conf
a2ensite $subdomain.$domain.conf
systemctl reload apache2
