#!/bin/bash

docker-compose up -d
docker exec -it -u $UID quectel-quecopen /bin/bash