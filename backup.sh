#!/bin/bash
REMOVE_AFTER_DAYS=30
FILENAME=`date +"docker-appdata_%Y-%m-%d--%T" | tr ':' '-'`

echo "Stopping Docker containers..."
docker stop $(docker ps -aq)
echo "Creating archive..."
tar -jcp --one-file-system -f /mnt/backups/docker/$FILENAME.tar.bz2 -C /home/pve/ appdata/ || echo "Archive Failed" && $echo "Archive complete. Starting Docker containers"
docker start $(docker ps -aq)

echo "Removing backups older than " $REMOVE_AFTER_DAYS " days"
find /mnt/backups/docker -name "docker-appdata*" -type f -mtime +$REMOVE_AFTER_DAYS -exec rm -f {} \;

NUM_FILES=`ls -1 docker-appdata* | wc -l`
echo "There are are currently " $NUM_FILES " backups"
