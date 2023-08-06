#! /bin/bash
set -ex
now=$(date)
echo "$now"
if [ -d "/sys/fs/cgroup/memory/cache-test" ]
then
cgdelete memory:cache-test
fi
cgcreate -g memory:cache-test
echo 1 > /sys/fs/cgroup/memory/cache-test/memory.oom_control
declare -a mem_size=("1G" "2G" "4G" "6G" "8G" "10G" "12G" "14G" "16G" "18G" "20G" "22G" "24G" "26G" "28G" "30G")

cmake ./build && make --directory=./build 



#declare -a ip_size=( "8192" "16384" "32768" "65536" "131072" "262144" "524288" "1048576" "2097152" "4194304" "8388608" )
#( "1048576" "2097152" "4194304" "8388608" )

for (( j=0; j<=${#mem_size[@]}-1; j++ ));
do
#echo ${mem_size[$j]}
sync
echo 3 > /proc/sys/vm/drop_caches
echo ${mem_size[$j]} > /sys/fs/cgroup/memory/cache-test/memory.limit_in_bytes 
cgexec -g memory:cache-test ./build/lcs-classic 65536 1 < data/data-65536.in

#gcc lcs-classic.c
#cgexec -g memory:cache-test-arghya ./a.out ${ip_size[$j]} $numruns < data/data-${ip_size[$j]}.in 
#g++ -std=c++11 lcs-our-alg-opt-uneq.c
#cgexec -g memory:cache-test-arghya ./a.out ${ip_size[$j]} $numruns < data/data-${ip_size[$j]}.in
done


