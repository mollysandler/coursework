#!/bin/sh

rsync -av --delete --exclude-from='exclusions.txt' --filter='dir-merge,- .rsync-filter' -e "ssh -i ../429_key" root@team8.csc429.io:/ ../backups/backup_system
