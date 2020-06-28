#!/bin/bash

if [ "$1" != "" ]; then
    exec $@
fi

if [ ! -f /etc/butterfly-init-done ]; then
    if [ "$PASSWORD" = "" ]; then
        PASSWORD=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1`
        echo "generating root user password : \"$PASSWORD\""
    else
        echo "please use your specified password"
    fi
    echo "root:${PASSWORD}" | chpasswd
    touch /etc/butterfly-init-done
else
    echo "skip generating password"
fi

if [ "$OPTS" = "" ]; then
    OPTS='--keepalive_interval=10 --force_unicode_width=True --uri_root_path=/term/'
fi

exec butterfly.server.py --host=0.0.0.0 --port=${PORT:-80} --unsecure --login --motd=/etc/motd $OPTS
