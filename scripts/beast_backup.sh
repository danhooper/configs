#!/bin/bash

/usr/bin/rsync --links --one-file-system --archive --progress --stats --delete --exclude=virtualenvs/ --exclude=.npm/ --exclude=git/ --exclude=.cache/ /home/dhooper/ /mnt/homes/dhooper/backups/beast/home/dhooper/
/usr/bin/rsync --links --one-file-system --archive --progress --stats --delete  /etc /mnt/homes/dhooper/backups/beast/etc/ > /dev/null

