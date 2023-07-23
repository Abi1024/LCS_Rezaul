#!/bin/bash
./build/lcs-classic 8192 1 < data/data-8192.in > out1
./build/lcs-classic 16384 1 < data/data-16384.in > out2
./build/lcs-classic 32768 1 < data/data-32768.in > out3
./build/lcs-classic 65536 1 < data/data-65536.in > out4
./build/lcs-classic 131072 1 < data/data-131072.in > out5
./build/lcs-classic 262144 1 < data/data-262144.in > out6


