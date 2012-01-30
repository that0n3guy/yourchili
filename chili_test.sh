#!/bin/bash

./install.sh
source /usr/local/lib/yourchili/yourchili.sh

HOSTNAME="mysite.com"
DB_PASSWORD="password"
NGINX_USER="www-data"
NGINX_GROUP="www-data"


USER="librarian"
USER_PW="ookook"
USER_FIRST_NAME="The"
USER_LAST_NAME="Librarian"
USER_EMAIL="librarian@uu.edu.am"

BACKUP_DIR="/backups" #directory where we store backups

git pull >/dev/null 2>&1

nginx_create_site "$HOSTNAME"        "$HOSTNAME www.$HOSTNAME"               0 "" 1
nginx_ensite "$HOSTNAME"
nginx_delete_site default

install_chili_project   "$HOSTNAME" ""      1 0 ""     mysql "$DB_PASSWORD"      1 "$USER" "$USER_PW" "$USER_FIRST_NAME" "$USER_LAST_NAME" "$USER_EMAIL"     "my-git-proj1" 1 "My Git One"

cd /root
ln -s /srv/www/my*/chili
ln -s /srv/www/my*/chili/v*/plug*/*git*



