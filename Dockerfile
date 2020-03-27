FROM ubuntu:18.04

# Update Cling build name from https://root.cern.ch/download/cling/
ARG buildname=cling_2020-03-26_ubuntu18

# Install prerequisities
RUN apt-get update && apt-get install -y \
    git \
    dpkg-dev \
    cmake \
    g++ \
    gcc \
    binutils \
    libx11-dev \
    libxpm-dev \
    libxft-dev \
    libxext-dev \
    wget

WORKDIR /opt

# Download Cling binary build
RUN wget -c https://root.cern.ch/download/cling/${buildname}.tar.bz2 && \
    tar xjvf ${buildname}.tar.bz2 && \
    cp -r ./${buildname}/* /usr/local && \
    rm -R ${buildname} && \
    rm ${buildname}.tar.bz2

ENTRYPOINT ["cling"]
