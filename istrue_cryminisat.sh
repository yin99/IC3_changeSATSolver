#!/bin/bash

folder="./test_example"
error_num=0
passed_num=0
for file in "$folder"/*.aig; do
	t1=$(date +"%Y-%m-%d %H:%M:%S")
	ref=`./IC3ref/build/ic3refmain < "$file"`
	t2=$(date +"%Y-%m-%d %H:%M:%S")
	tref=$(( $(date -d "$t2" +%s) - $(date -d "$t1" +%s) ))
	t1=$(date +"%Y-%m-%d %H:%M:%S")
	new=`./IC3_cryminsat/build/ic3refmain < "$file"`
	t2=$(date +"%Y-%m-%d %H:%M:%S")
	tchag=$(( $(date -d "$t2" +%s) - $(date -d "$t1" +%s) ))
	if [ $ref != $new ]; then
		error_num=$((error_num+1))
		echo "error: in $file, ref is $ref while changed is $new.ref time: $tref s,new time: $tchag s"
	else
		passed_num=$((passed_num+1))
		echo "pass:  in $file, ref is $ref and changed is $new.ref time: $tref s,new time: $tchag s"
	fi
done
echo "passed: $error_num   and    failed: $passed_num"

