#!/bin/bash

cd ./IC3_cryminsat
cryminisat="./cryptominisat/build/lib/libcryptominisat5.so"

if [ ! -f $cryminisat ]; then
   cd ./cryptominisat
   rm -r build
   mkdir build
   cd build
   cmake ..
   make
   cd ../..
fi
 
dir="./build"

if [ ! -d $dir ]; then
   mkdir build
fi

cd build
rm -r *
cmake ..
make


