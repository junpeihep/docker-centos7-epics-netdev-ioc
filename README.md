# docker-centos7-epics-netdev-ioc
Docker image of [EPICS](https://epics.anl.gov/) [IOC Application](https://epics.anl.gov/EpicsDocumentation/AppDevManuals/iocAppBuildSRcontrol.html) using [EPICS Device and Driver Support for General Network Devices (netDev)](https://www-linac.kek.jp/cont/epics/netdev/) on CentOS7.
The netDev is now maintained on [the GitHub repository](https://github.com/shuei/netDev).

The image uses the base image of [centos7-epics-base on Docker Hub](https://hub.docker.com/r/junpeihep/centos7-epics-base) made by [docker-centos7-epics-base](https://github.com/junpeihep/docker-centos7-epics-base).

The image is also available as [centos7-epics-netdev-ioc on Docker Hub](https://hub.docker.com/r/junpeihep/centos7-epics-netdev-ioc).
So you can pull the image as follows:
```bash
docker pull junpeihep/centos7-epics-netdev-ioc
```
Or use as a base image in your Dockerfile:
```Dockerfile
FROM junpeihep/centos7-epics-netdev-ioc:latest
```

## How to use
WARNING: The repository is Under construction.

## Environment variables
The following variables are set as the environment variable (Some of them have been defined in [centos7-epics-base](https://hub.docker.com/r/junpeihep/centos7-epics-base). 
|variable name|contents|
|:-------|:---------------|
|WORK_DIR|/usr/local/epics|
|EPICS_VER|7.0.7|
|EPICS|/usr/local/epics|
|EPICS_HOST_ARCH|linux-x86_64|
|PATH	|/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/epics/base-7.0.7/bin/linux-x86_64|
|NETDEV_VERSION|1.2.2|
|EPICS_BASE|${EPICS}/base-${EPICS_VER}|
|ENV APP_DIR|${EPICS}/iocApp |
|USER|ioc_user|
    
## for developers
### to build the container (if needed)
```bash
git clone https://github.com/junpeihep/docker-centos7-epics-netdev-ioc.git
cd docker-centos7-epics-netdev-ioc
docker build -t junpeihep/centos7-epics-netdev-ioc .
```
### to run and login the shell
```bash
docker run -it junpeihep/centos7-epics-netdev-ioc bash
```
