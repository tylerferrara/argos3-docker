#!/bin/bash

# Creating workspace
cd /setup || exit

# Installing examples
git clone https://github.com/ilpincy/argos3-examples.git argos3-examples
cd argos3-examples || exit
mkdir build
cd build || exit
cmake -DCMAKE_BUILD_TYPE=Debug ..
make
