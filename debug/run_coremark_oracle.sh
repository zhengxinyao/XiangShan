#!/bin/bash

R="coremark"
LOG="coremark1"
ITER=10
MISS_RATE=0
while getopts ":t:a:ci:" opt
do
    case $opt in
    t)
        case $OPTARG in
        10)
            R="coremark10"
            LOG="coremark10"
            ;;
        100)
            R="coremark100"
            LOG="coremark100"
            ITER=3
            ;;
        esac
        ;;
    a)
        MISS_RATE=$OPTARG
        ;;
    c)
        echo cleaning data folder
        rm /home/glr/XiangShan/debug/data/*
        exit
        ;;
    i)
        ITER=$OPTARG
        ;;
    esac
done

for i in $(seq 1 ${ITER})
do
    echo running $LOG "for" the $i "time"
    make coremark SEED=9596 E=0 R=$R A=$MISS_RATE 2>&1 | grep -E "IPC|totally|MbpBWrong" | tee -a data/${LOG}_rate${MISS_RATE}.log
done


