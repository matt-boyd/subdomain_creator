#!/bin/bash
echo "Enter the name of the subdomain you want to delete" 
domain="example.com"
read subdomain
rm -r /var/www/$subdomain
a2dissite $subdomain.$domain.conf
systemctl reload apache2
rm /etc/apache2/sites-available/$subdomain.$domain.conf
