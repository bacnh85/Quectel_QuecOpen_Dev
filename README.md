# Introduction

QuecOpen is originally meant for OpenLinux modules of Quectel: EC2x, AG35 modules where end-user can program their own application run along with the Quectel processes.

There are more example at [QuecOpen Example repo](https://github.com/bacnh85/Quectel_QuecOpen_Examples).

## Prepare

1. [Install docker](https://docs.docker.com/get-docker/) for your machine

2. For MacOS, pls config NFS share for nfsd with [macos_setup_nfs.sh script](script/macos_setup_nfs.sh), so you could take advantage of read/write access compare to Mac FS driver.

## Usage for Linux users

1. Pull the docker image

```
docker pull bacnh85/quectel-quecopen
```

2. Create docker container that point to your working directory

```
docker run -d --name quectel-quecopen \
 -e PUID=`id -u` -e PGID=`id -g` -v 
 "$(pwd)":/opt bacnh85/quectel-quecopen
```

3. Start the container shell to start build your application, the rootfs, kernel, ... 

```
docker exec -it -u `id -u` quectel-quecopen /bin/bash
```

## Docker Compose

Sample `docker-compose.yml` is provided for more convenience.

```
version: '3.4'
services:
  quectel-quecopen-dev:
    image: bacnh85/quectel-quecopen
    container_name: quectel-quecopen
    environment:
      - PUID=501
      - PGID=20
    volumes:
      - "./:/opt"
    tty: true
```

Then, power up the container:

```
docker-compose up -d
```
Login to the contailer shell:
```
docker exec -it -u `id -u` quectel-quecopen /bin/bash
```

## Usage for macOS users

Due to OSX driver performance is not that good, a good approach is using NFS share. Thus, docker-compose file is more convience to start with.

Before doing it, you need to config nfsd to share your current working directory to docker container, pls refer to [macos_setup_nfs.sh](script/macos_setup_nfs.sh)

```
docker-compose -f docker-compose_macos.yml up -d
```

Then, login to the container to start:

```
docker exec -it -u `id -u` quectel-quecopen /bin/bash
```



