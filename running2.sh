#!/bin/bash
time=$(date "+%Y-%m-%d-%H-%M-%S")

mkdir outfile/$time


nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance True --lamda 0.0001 --loss_reduction "sum" --_running_time $time > ./outfile/$time/running1.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance False --lamda 0.0001 --loss_reduction "sum" --_running_time $time > ./outfile/$time/running2.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance True --lamda 0.01 --loss_reduction "sum" --_running_time $time > ./outfile/$time/running3.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance False --lamda 0.01 --loss_reduction "sum" --_running_time $time > ./outfile/$time/running4.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance True --lamda 1.0 --loss_reduction "sum" --_running_time $time > ./outfile/$time/running5.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance False --lamda 1.0 --loss_reduction "sum" --_running_time $time > ./outfile/$time/running6.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance True --lamda 10 --loss_reduction "sum" --_running_time $time > ./outfile/$time/running7.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance False --lamda 10 --loss_reduction "sum" --_running_time $time > ./outfile/$time/running8.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance True --lamda 100 --loss_reduction "sum" --_running_time $time > ./outfile/$time/running9.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance False --lamda 100 --loss_reduction "sum" --_running_time $time > ./outfile/$time/running10.out 2>&1 &
wait

done








