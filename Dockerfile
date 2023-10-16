# EPICS IOC Application using Device Support for General Network Devices (netDev) on CetnOS7

# Base image
FROM junpeihep/centos7-epics-base:epics-3.15.8

# Maintainer
LABEL maintainer="junpeihep <junpeihep@gmail.com>"

# netDev version
ENV NETDEV_VERSION=1.2.2

# Version info
LABEL version="centos7-epics3.15.8-netDev${NETDEV_VERSION}"

# dnf update
RUN yum -y update

# EPICS_BASE variable
ENV EPICS_BASE=${EPICS}/base-${EPICS_VER}

# get and untar the tarball of netDev
RUN mkdir -p ${EPICS_BASE}/../modules/src && \
    cd ${EPICS_BASE}/../modules/src && \
    wget https://github.com/shuei/netDev/archive/refs/tags/v${NETDEV_VERSION}.tar.gz && \
    tar -C ${EPICS_BASE}/../modules/src -x -f v${NETDEV_VERSION}.tar.gz && \
    rm v${NETDEV_VERSION}.tar.gz

# go to the top-level directory of the device support, then edit configure/RELEASE (removed as already defined)
RUN cd ${EPICS_BASE}/../modules/src/netDev-${NETDEV_VERSION} && \
    sed "s|EPICS_BASE=\/opt\/epics\/base|EPICS_BASE=${EPICS_BASE}|" configure/RELEASE > configure/RELEASE.local && \
    cat configure/RELEASE.local && \
    mv configure/RELEASE.local configure/RELEASE

# netDev build
RUN cd ${EPICS_BASE}/../modules/src/netDev-${NETDEV_VERSION} && \
    make

# IOC application
ENV APP_DIR=${EPICS}/iocApp \
    USER=ioc_user

RUN mkdir ${APP_DIR} && cd ${APP_DIR} && \
    ${EPICS_BASE}/bin/${EPICS_HOST_ARCH}/makeBaseApp.pl -t ioc iocApp && \
    ${EPICS_BASE}/bin/${EPICS_HOST_ARCH}/makeBaseApp.pl -i -t ioc iocApp && \
    echo

# modify IOC Application to use the device support
RUN echo "NETDEV = ${EPICS_BASE}/../modules/src/netDev-${NETDEV_VERSION}" >> ${APP_DIR}/configure/RELEASE && \
    cd ${APP_DIR} && \
    sed 's/#ioc_DBD += xxx.dbd/ioc_DBD += netDev.dbd/' iocApp/src/Makefile > iocApp/src/Makefile.mod && \
    mv iocApp/src/Makefile.mod iocApp/src/Makefile && \
    sed 's/#ioc_LIBS += xxx/ioc_LIBS += netDev/' iocApp/src/Makefile > iocApp/src/Makefile.mod && \
    mv iocApp/src/Makefile.mod iocApp/src/Makefile && \
    cat iocApp/src/Makefile

