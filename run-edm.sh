#!/usr/bin/env bash

xhost + local:docker
docker run --rm -u $(id -u):$(id -g) -e DISPLAY="$DISPLAY" -h "$HOSTNAME" --network host -v /tmp/.X11-unix:/tmp/.X11-unix slac-epics-client-rocky9:latest edm
