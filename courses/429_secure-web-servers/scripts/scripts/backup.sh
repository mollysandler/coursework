#!/bin/sh

rsync -av --delete -e "ssh -i ../429_key" root@team8.csc429.io:/var/www/html ../backups/backup
rsync -av --delete -e "ssh -i ../429_key" root@team8.csc429.io:/var/www/html/orders.db ../backups/backup
rsync -av --delete -e "ssh -i ../429_key" root@team8.csc429.io:/etc/apache2 ../backups/backup
