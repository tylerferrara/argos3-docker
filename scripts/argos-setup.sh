#!/bin/bash

# Creating workspace
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR" || exit

# Gathering dependencies
export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
apt install \
    git g++ cmake libfreeimage-dev libfreeimageplus-dev \
    qt5-default freeglut3-dev libxi-dev libxmu-dev liblua5.3-dev \
    lua5.3 doxygen graphviz libgraphviz-dev asciidoc -y

# Installing Argos
# Steps taken from https://github.com/ilpincy/argos3#argos-readme
git clone https://github.com/ilpincy/argos3.git argos3
cd argos3 || exit
mkdir build_simulator
cd build_simulator || exit
cmake -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DARGOS_BUILD_FOR=simulator \
    -DARGOS_BUILD_NATIVE=OFF \
    -DARGOS_THREADSAFE_LOG=ON \
    -DARGOS_DYNAMIC_LOADING=ON \
    -DARGOS_USE_DOUBLE=ON \
    -DARGOS_DOCUMENTATION=ON \
    -DARGOS_INSTALL_LDSOCONF=ON \
    ../src
make doc
make
make install
cp -r /usr/local/lib/argos3 /usr/lib
ldconfig

# Cleaning up
cd / || exit
rm -rf "$TEMP_DIR"
