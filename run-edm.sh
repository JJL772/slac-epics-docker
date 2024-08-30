#!/usr/bin/env bash

#xhost + local:docker
docker run --rm -u $(id -u):$(id -g) -e DISPLAY="$DISPLAY" -h "$HOSTNAME" --network host -h $HOSTNAME -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/.Xauthority slac-epics-client-rocky9:latest edm
