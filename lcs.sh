#!/bin/bash
set -x

NUMRUNS=1
NUMBALLOONS=9
SLEEP=5
#declare -a inputsize=( 512 1024 2048 4096 8192 16384 32768 )
#declare -a startingmemory=( 10 10 10 10 10 10 10)
declare -a inputsize=( 524288 )
declare -a startingmemory=( 5)
TOTALMEMORY_MB=5
TOTALMEMORY=$((TOTALMEMORY_MB*1024*1024))
INPUTWIDTH=2048

if [ $# -ne 1 ]
then
	echo "Must supply 1 argument. \n \
	Usage: sudo ./lcs.sh <cgroup_name>"
fi

if [ -f "mm_out.txt" ]
then
  echo "mm_out.txt already exists. Deleting it first."
  rm mm_out.txt
fi

if [ -f "balloon_log.txt" ]
then
  echo "balloon_log.txt already exists. Deleting it first."
  rm balloon_log.txt
fi


if [ -f "err" ]
then
  echo "err already exists. Deleting it first."
  rm err
fi

#if [ ! -f "nullbytes" ]
#then
#  echo "First creating file for storing data."
#  dd if=/dev/urandom of=nullbytes count=16384 bs=1048576
#fi

cmake ./build && make --directory=./build

for (( index=0; index<=${#inputsize[@]}-1; index++ ));
do
	echo $index
        INPUTWIDTH=${inputsize[$index]}
        STARTINGMEMORY_MB=${startingmemory[$index]}
	#run lcs_our alg on constant memory
	echo "Running lcs_our alg on constant memory"
	./cgroups.sh $1
	sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches; echo 0 > /proc/sys/vm/vfs_cache_pressure"
	echo $TOTALMEMORY > /sys/fs/cgroup/memory/$1/memory.limit_in_bytes
	#for j in `seq 1 $NUMBALLOONS`;
	#do
	#	cgexec -g memory:$1 ./build/balloon2 > "balloon_log.txt" 0 $TOTALMEMORY_MB $STARTINGMEMORY_MB 9 $j $MATRIXWIDTH &
	#	#cgexec -g memory:$1 ./build/balloon3 > "balloon_log.txt" $j &
	#done
	#cgexec -g memory:$1 ./build/lcs-classic $INPUTWIDTH 1 < ./data/data-$INPUTWIDTH.in
        #cgexec -g memory:$1 ./build/lcs-hirschberg-opt-uneq $INPUTWIDTH 1 < ./data/data-$INPUTWIDTH.in
        cgexec -g memory:$1 ./build/lcs-our-alg-opt-uneq $INPUTWIDTH 1 < ./data/data-$INPUTWIDTH.in
	#pkill -f lcs-our-alg
        echo "Done"
done
