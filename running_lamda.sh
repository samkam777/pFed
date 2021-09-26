#!/bin/bash
time=$(date "+%Y-%m-%d-%H-%M-%S")

mkdir outfile/$time


nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance True --lamda 0.0001 --_running_time $time > ./outfile/$time/running1.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance False --lamda 0.0001 --_running_time $time > ./outfile/$time/running2.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance True --lamda 0.001 --_running_time $time > ./outfile/$time/running3.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance False --lamda 0.001 --_running_time $time > ./outfile/$time/running4.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance True --lamda 0.01 --_running_time $time > ./outfile/$time/running5.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance False --lamda 0.01 --_running_time $time > ./outfile/$time/running6.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance True --lamda 0.1 --_running_time $time > ./outfile/$time/running7.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance False --lamda 0.1 --_running_time $time > ./outfile/$time/running8.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance True --lamda 1.0 --_running_time $time > ./outfile/$time/running9.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance False --lamda 1.0 --_running_time $time > ./outfile/$time/running10.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance True --lamda 0.00001 --_running_time $time > ./outfile/$time/running11.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance False --lamda 0.00001 --_running_time $time > ./outfile/$time/running12.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance True --lamda 0.000001 --_running_time $time > ./outfile/$time/running13.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance False --lamda 0.000001 --_running_time $time > ./outfile/$time/running14.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance True --lamda 0.0000001 --_running_time $time > ./outfile/$time/running15.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance False --lamda 0.0000001 --_running_time $time > ./outfile/$time/running16.out 2>&1 &
wait

done








