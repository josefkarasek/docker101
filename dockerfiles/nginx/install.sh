#!/bin/sh

set -e

if chroot $HOST systemctl -q is-active "$NAME"; then
    chroot $HOST systemctl stop "$NAME"
fi

sed "s%IMAGE%${IMAGE}%g; s%NAME%${NAME}%g;" /etc/nginx.service.template > ${HOST}/etc/systemd/system/${NAME}.service
chroot $HOST systemctl daemon-reload
echo "Service ${NAME}.service configured to run nginx container."
