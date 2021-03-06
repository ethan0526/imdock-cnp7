#!/bin/bash

docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}"
CURRENT=$(grep './docker-compose.yml' -e 'container_name:' | awk '{ print $2 };')
read -p "Container-Name/Id or Enter empty(default: $CURRENT): " CONTAINERID
case $CONTAINERID in
     *)
        if [ "$CONTAINERID" == "" ]; then
            docker exec -it ${CURRENT} bash
        else
            docker exec -it ${CONTAINERID} bash
        fi
    ;;esac