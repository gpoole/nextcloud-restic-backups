#!/usr/bin/bash
set -e

echo "Preparing..."
backup-nextcloud-prepare.sh

echo "Backing up..."
restic -r $REPO_PATH backup $BACKUP_PATH

echo "Cleaning up..."
backup-nextcloud-finish.sh