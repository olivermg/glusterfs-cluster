#!/bin/sh

glusterd -N &

sleep 5

NOPEERS=$(gluster peer status | grep -i "Number of Peers" | sed -r -e 's/[[:space:]]+//g' | cut -f2 -d':')

if [ $NOPEERS -eq 0 ]; then
    echo "No peers found, will try to connect..."
    for P in "$@"; do
        echo -n "${P}: "
        gluster peer probe $P
    done
else
    echo "Peers already connected: $NOPEERS"
fi

wait  # wait indefinitely for glusterd
