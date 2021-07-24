#!/usr/bin/bash
set -e

echo "Preparing..."
backup-nextcloud-prepare.sh

BACKUP_PATH=/var/snap/nextcloud/common/backups/current

echo "Backing up..."
restic -r s3:s3.amazonaws.com/$RESTIC_BUCKET_NAME backup $BACKUP_PATH

echo "Cleaning up..."
backup-nextcloud-finish.sh
~
