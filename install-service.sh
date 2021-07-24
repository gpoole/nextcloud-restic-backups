#!/usr/bin/bash

SERVICE_NAME="$SERVICE_NAME"

if [ -z "$SERVICE_NAME" ]; then
  echo "Usage: install-service.sh service-name" > /dev/stderr
  exit 1
fi

cp $SERVICE_NAME.service /etc/systemd/system
cp $SERVICE_NAME.timer /etc/systemd/system

if [ -r $SERVICE_NAME.env ]; then
  echo "Copying $SERVICE_NAME.env to /etc/backups..."
  mkdir -p /etc/backups/
  cp $SERVICE_NAME.env /etc/backups/$.env
else
  echo "Config in /etc/backups/$SERVICE_NAME.env will not be overwritten."
fi

systemctl daemon-reload
systemctl enable $SERVICE_NAME.timer $SERVICE_NAME
systemctl start $SERVICE_NAME.timer
