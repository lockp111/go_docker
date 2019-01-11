DK = docker
DC = docker-compose

project ?=

basic-build:
	sh ./basic_build.sh $(project)
	
image:
	$(DK) build -t go-alpine ./go-alpine

service-build: image
	sh ./service_build.sh $(project)

basic-up:
	$(DC) -f basic-docker-compose.yaml up -d
	$(DC) -f basic-docker-compose.yaml logs

service-up:
	$(DC) -f service-docker-compose.yaml up -d
	$(DC) -f service-docker-compose.yaml logs --tail 10