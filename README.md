# SLAC EPICS Docker

Containerized build of EPICS base and SLAC's EDM fork.

# Building

```
docker build . -t slac-epics-rocky9 -f Dockerfile.rocky9

docker build . -t edm -f Dockerfile.client.rocky9
```
