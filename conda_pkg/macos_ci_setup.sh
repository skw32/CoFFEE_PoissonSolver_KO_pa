#!/bin/bash -x

# needed for some tests
brew install tree wget

# install MacOS 10.9 sdk to /opt/MacOSX10.9.sdk
(
    sudo mkdir -p /opt
    sudo chmod oug+w /opt
    cd /opt
    wget https://github.com/phracker/MacOSX-SDKs/releases/download/10.13/MacOSX10.9.sdk.tar.xz
    tar -xvf MacOSX10.9.sdk.tar.xz
    rm MacOSX10.9.sdk.tar.xz
)

