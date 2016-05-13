#!/bin/sh

set -e

if chroot $HOST systemctl -q is-active "$NAME"; then
    chroot $HOST systemctl stop "$NAME"
fi

rm -f ${HOST}/etc/systemd/system/${NAME}.service
chroot $HOST systemctl daemon-reload
echo "Service ${NAME}.service removed."
