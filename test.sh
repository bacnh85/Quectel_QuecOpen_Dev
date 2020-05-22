#!/bin/sh

docker run -d --name quectel-quecopen -e UID=`id -u` -e GID=`id -g` -v "$(pwd)":/opt -v ~/.ssh:/home/${UID}/.ssh bacnh85/quectel-quecopen
docker exec -it -u $UID quectel-quecopen /bin/bash