#!/bin/bash

# MySQL credentials
MYSQL_ROOT_USER="root"
MYSQL_ROOT_PASSWORD="your_root_password"

# Database and user credentials
DB_NAME="hbnb_dev_db"
DB_USER="hbnb_dev"
DB_PASSWORD="hbnb_dev_pwd"

# Create database if it does not exist
mysql -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"

# Create user and grant privileges
mysql -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';"
mysql -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} -e "GRANT SELECT ON performance_schema.* TO '${DB_USER}'@'localhost';"

# Flush privileges
mysql -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
