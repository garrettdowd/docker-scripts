# docker-scripts

## backup.sh
Run as a cron script to backup your persistent data (bind mounts) on a regular basis.

This will stop all of the docker containers on your host, create a tar archive of the directory of app data, and restart all containers.

`REMOVE_AFTER_DAYS` defines when an archive should be removed from your backups. Backups will only be removed if the current backup was successful.

`FILENAME` defines the name of the archive. The current filename includes a full date-time of the arhive creation.
