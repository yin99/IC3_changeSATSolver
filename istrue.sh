#!/bin/bash

folder="./test_example"
error_num=0
passed_num=0
for file in "$folder"/*.aig; do
	ref=`./IC3ref/build/ic3refmain < "$file"`
	new=`./IC3changed/build/ic3refmain < "$file"`
	if [ $ref != $new ]; then
		error_num=$((error_num+1))
		echo "error: in $file, ref is $ref while changed is $new"
	else
		passed_num=$((passed_num+1))
		echo "pass:  in $file, ref is $ref and changed is $new"
	fi
done
echo "passed: $error_num   and    failed: $passed_num"

