#!/bin/bash

cd ./IC3_cadicalsat
cadical="./cadical/build/libcadical.a"
if [ ! -f "$cadical" ]; then
	cd cadical
	mkdir build
	cd build
	for f in ../src/*.cpp; do g++ -O3 -DNDEBUG -DNBUILD -c $f; done
	ar rc libcadical.a `ls *.o | grep -v ical.o`
	cd ../..
fi
buidlfile="./build"
if [ ! -d "$buildfile" ]; then
	mkdir build
fi
cd build
cmake ..
make
