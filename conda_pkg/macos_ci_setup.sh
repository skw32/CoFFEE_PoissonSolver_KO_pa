#!/bin/bash -x

brew install wget

sudo mkdir -p /opt && sudo chown $(whoami) /opt && sudo chmod u+w /opt

# install MacOS 10.9 sdk to /opt/MacOSX10.9.sdk
(
    cd /opt
    wget https://github.com/phracker/MacOSX-SDKs/releases/download/10.13/MacOSX10.9.sdk.tar.xz
    tar -xf MacOSX10.9.sdk.tar.xz
    rm MacOSX10.9.sdk.tar.xz
)

