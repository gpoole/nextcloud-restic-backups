#!/usr/bin/bash
set -e

rm -rf /var/snap/nextcloud/common/backups/current
/snap/bin/nextcloud.export 2>&1 >/var/log/nextcloud-export.log
mv /var/snap/nextcloud/common/backups/* /var/snap/nextcloud/common/backups/current
