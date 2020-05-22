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
docker run -d --name quectel-quecopen -e UID=`id -u` -e GID=`id -g` -v "$(pwd)":/opt -v ~/.ssh:/home/${UID}/.ssh bacnh85/quectel-quecopen
```

3. Start the container shell to start build your application, the rootfs, kernel, ... 

```
docker exec -it -u $UID quectel-quecopen /bin/bash
```

## Compile kernel, rootfs, ...

Start docker container and deal with EC2x SDK 

```
$ sh start.sh
Recreating quecopen-dev ... done
bacnh@e2c15b93e6a8:/opt$ 
```

## Debug the apps

```
$ adb shell
mdm9607-perf login: root
Password: 
root@mdm9607-perf:~#
```



