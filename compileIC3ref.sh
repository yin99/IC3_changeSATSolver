#!/bin/bash

cd ./IC3ref
buildfile="./build"
if [ ! -d "$buildfile" ]; then
	mkdir build
fi
cd build
cmake ..
make
