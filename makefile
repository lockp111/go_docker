DK = docker
DC = docker-compose

project ?=

image:
	$(DK) build -t go-alpine ./go-alpine

build:
	sh ./basic_build.sh $(project)
	sh ./service_build.sh $(project)

basic:
	$(DC) -f basic-docker-compose.yaml up -d
	$(DC) -f basic-docker-compose.yaml logs

service:
	$(DC) -f service-docker-compose.yaml up -d
	$(DC) -f service-docker-compose.yaml logs --tail 10