# Local and remote S3 Restic backups for NextCloud snap

# Set up

Initialise Restic repos in a local folder and on S3.

Configure the .env files and set times in the .timer files, then run:

```sh
sudo cp backup-nextcloud-prepare.sh /usr/bin/
sudo install-service.sh backup-nextcloud-local
sudo install-service.sh backup-nextcloud-s3
```