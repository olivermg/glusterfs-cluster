#!/bin/sh

docker network inspect glusterfs-cluster_default | jq '.[0].Containers | map([.Name, .IPv4Address])'
