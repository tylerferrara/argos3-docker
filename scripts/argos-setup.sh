#!/bin/bash

# Creating workspace
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR" || exit

# Gathering dependencies
apt-get update
export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true
apt-get install \
    git g++ cmake libfreeimage-dev libfreeimageplus-dev \
    qt5-default freeglut3-dev libxi-dev libxmu-dev liblua5.3-dev \
    lua5.3 doxygen graphviz libgraphviz-dev asciidoc -y

# Installing Argos
# Steps taken from https://github.com/ilpincy/argos3#argos-readme
git clone https://github.com/ilpincy/argos3.git argos3
cd argos3 || exit
mkdir build_simulator
cd build_simulator || exit
cmake ../src
make doc
make
make install
cp -r /usr/local/lib/argos3 /usr/lib
ldconfig

# Cleaning up
rm -rf "$TEMP_DIR"
