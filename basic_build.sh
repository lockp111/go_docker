#! /bin/bash

PROJECT=""

build() {
    mkdir -p /mnt/$PROJECT/consul_data \
        /mnt/$PROJECT/redis_data \
        /mnt/$PROJECT/mysql_data \

    docker volume create --driver local \
        --opt type=none \
        --opt device=/mnt/$PROJECT/consul_data \
        --opt o=bind \
        --name=consul-data-volume

    docker volume create --driver local \
        --opt type=none \
        --opt device=/mnt/$PROJECT/redis_data \
        --opt o=bind \
        --name=redis-data-volume

    docker volume create --driver local \
        --opt type=none \
        --opt device=/mnt/$PROJECT/mysql_data \
        --opt o=bind \
        --name=mysql-data-volume

    docker network create backend
}

if [ $1 ]
then
    PROJECT=$1
    build
    echo "done!"
else  
    echo "Usage: $0 <project name>"
fi