#! /bin/bash

SERVICES=(app backend)
PROJECT=""

build() {
    # init dir
    for SRV in ${SERVICES[@]}
    do
        sudo mkdir -p /mnt/$PROJECT/$SRV
    done

    # init data-volume
    for SRV in ${SERVICES[@]}
    do
        docker volume create --driver local \
            --opt type=none \
            --opt device=/mnt/$PROJECT/$SRV \
            --opt o=bind \
            --name=$SRV-data-volume
    done
}

if [ $1 ]
then
    PROJECT=$1
    build
    echo "done!"
else  
    echo "Usage: $0 <project name>"
fi