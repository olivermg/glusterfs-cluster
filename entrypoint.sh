#!/bin/sh

MODE=$1
shift
BRICKS=$1
shift
echo "Starting in $MODE mode with $BRICKS bricks"

# make sure our brick folder(s) exist(s):
if [ "$MODE" != "client" ]; then
    for N in $(seq $BRICKS); do
        N0=$(( $N - 1 ))
        mkdir -p /var/gluster/brick${N0}
    done
fi

# start glusterd and give it some time to do so:
if [ "$MODE" != "client" ]; then
    echo "Starting glusterd..."
    glusterd -N & sleep 5
fi

# if we're master, check if we're already connected to our peers. if not, connect:
if [ "$MODE" = "master" ]; then
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
fi

# if we're client, try to mount volume:
if [ "$MODE" = "client" ]; then
    echo "Mounting volume..."
    FROM=$1
    TO=$2
    mkdir -p $2
    mount -t glusterfs $FROM $TO
    sleep infinity &
fi

trap "kill %1" SIGTERM SIGINT  # for quicker shutdown
wait  # wait indefinitely for glusterd (or sleep)
