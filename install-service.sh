#!/usr/bin/bash

SERVICE_NAME="$1"

if [ -z "$SERVICE_NAME" ]; then
  echo "Usage: install-service.sh service-name" > /dev/stderr
  exit 1
fi

cp $1.service /etc/systemd/system
cp $1.timer /etc/systemd/system

if [ -r $1.env ]; then
  mkdir -p /etc/backups/
  cp $1.env /etc/backups/$.env
fi

systemctl daemon-reload
systemctl enable $1.timer $1
systemctl start $1.timer
