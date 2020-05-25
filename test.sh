#!/bin/sh

# build docker image
docker build docker-files -t bacnh85/quectel-quecopen

docker stop quectel-quecopen
docker rm quectel-quecopen -v

docker run -d --name quectel-quecopen -e PUID=`id -u` -e PGID=`id -g` -v "$(pwd)":/opt -v ~/.ssh:/home/`id -u`/.ssh bacnh85/quectel-quecopen
docker exec -it -u `id -u` quectel-quecopen /bin/bash