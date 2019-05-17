# Introduction


## Requirement 

1. Install Docker for MacOS from [Docker For Mac](https://docs.docker.com/docker-for-mac/install/). 

2. Install home-brew 

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

3. Config NFS for MacOS to speed up the write to bind mount, and also install ADB Tools

```
$ ./script/bootstrap
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



