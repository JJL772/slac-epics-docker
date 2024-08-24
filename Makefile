
IMAGES=slac-epics-rocky9 slac-epics-centos7 slac-epics-client-rocky9

all: $(IMAGES)

slac-epics-rocky9:
	docker build -t $@ -f Dockerfile.rocky9 .

slac-epics-centos7:
	true

slac-epics-client-rocky9: slac-epics-rocky9
	docker build -t $@ -f Dockerfile.client.rocky9 .

prune:
	docker image prune -f

.PHONY: prune