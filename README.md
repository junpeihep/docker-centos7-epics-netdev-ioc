# docker-centos7-epics-netdev-ioc
Docker image of [EPICS](https://epics.anl.gov/) [IOC Application](https://epics.anl.gov/EpicsDocumentation/AppDevManuals/iocAppBuildSRcontrol.html) using [EPICS Device and Driver Support for General Network Devices (netDev)](https://www-linac.kek.jp/cont/epics/netdev/) on CentOS7.
The netDev is now maintained on [the GitHub repository](https://github.com/shuei/netDev).

The image uses the base image of [centos7-epics-base on Docker Hub](https://hub.docker.com/r/junpeihep/centos7-epics-base) made by [docker-centos7-epics-base](https://github.com/junpeihep/docker-centos7-epics-base).

<!--
The image is also available as [centos7-epics-base on Docker Hub](https://hub.docker.com/r/junpeihep/centos7-epics-base).
So you can pull the image as follows:
```bash
docker pull junpeihep/centos7-epics-base
```
Or use as a base image in your Dockerfile:
```Dockerfile
FROM junpeihep/centos7-epics-base:latest
```
-->
WARNING: The repository is Under construction.

## Environment variables
The following variables are set as the environment variable. 
|variable name|contents|
|:-------|:---------------|
|NETDEV_VERSION|1.2.2|
