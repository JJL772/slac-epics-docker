# SLAC EPICS Docker

Containerized build of EPICS base and SLAC's EDM fork.

## Building

```
docker build . -t slac-epics-rocky9 -f Dockerfile.rocky9

docker build . -t edm -f Dockerfile.client.rocky9
```

## EDM Font Packages

On Rocky 9 systems, make sure you install:
```
$ sudo dnf install xorg-x11-fonts-ISO8859-1-75dpi
```

On Debian derivatives:
```
$ sudo apt install xfonts-75dpi
```
