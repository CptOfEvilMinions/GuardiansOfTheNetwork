#!/bin/bash

VOLUME_HOME="/var/lib/mysql"

sed -ri -e "s/^upload_max_filesize.*/upload_max_filesize = ${PHP_UPLOAD_MAX_FILESIZE}/" \
    -e "s/^post_max_size.*/post_max_size = ${PHP_POST_MAX_SIZE}/" /etc/php5/apache2/php.ini
if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected in $VOLUME_HOME"
    echo "=> Installing MySQL ..."
    mysql_install_db > /dev/null 2>&1
    echo "=> Done!"
    /create_mysql_admin_user.sh
else
    echo "=> Using an existing volume of MySQL"
fi

# Start MySQL
service mysql start

# Create database
mysql -u root -e "create database dvwa"

# Dump database
cat /tmp/dvwa.sql | /usr/bin/mysql -u root dvwa 

# Stop MySQL
service mysql stop

# Create run dir for sshd
mkdir /var/run/sshd

# Start supervisor
exec supervisord -n

