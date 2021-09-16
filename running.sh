#!/bin/bash
time=$(date "+%Y-%m-%d-%H-%M-%S")

mkdir outfile/$time

#for num in 5 10 20 50;do
#{
#nohup python -u main.py --seg_data $num --algorithm "pFedMe" --_balance True --_running_time $time > ./outfile/$time/running1.out 2>&1 &
#nohup python -u main.py --seg_data $num --algorithm "FedAvg" --_balance True --_running_time $time > ./outfile/$time/running2.out 2>&1 &
#nohup python -u main.py --seg_data $num --algorithm "FedAvg" --_balance False --_running_time $time > ./outfile/$time/running3.out 2>&1 &
#nohup python -u main.py --seg_data $num --algorithm "pFedMe" --_balance False --_running_time $time > ./outfile/$time/running4.out 2>&1 &
#wait
#}



nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance True --_running_time $time > ./outfile/$time/running1.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "FedAvg" --_balance True --_running_time $time > ./outfile/$time/running2.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "FedAvg" --_balance False --_running_time $time > ./outfile/$time/running3.out 2>&1 &
nohup python -u main.py --seg_data 5 --algorithm "pFedMe" --_balance False --_running_time $time > ./outfile/$time/running4.out 2>&1 &
nohup python -u main.py --seg_data 10 --algorithm "pFedMe" --_balance True --_running_time $time > ./outfile/$time/running5.out 2>&1 &
nohup python -u main.py --seg_data 10 --algorithm "FedAvg" --_balance True --_running_time $time > ./outfile/$time/running6.out 2>&1 &
nohup python -u main.py --seg_data 10 --algorithm "FedAvg" --_balance False --_running_time $time > ./outfile/$time/running7.out 2>&1 &
nohup python -u main.py --seg_data 10 --algorithm "pFedMe" --_balance False --_running_time $time > ./outfile/$time/running8.out 2>&1 &
wait
nohup python -u main.py --seg_data 20 --algorithm "pFedMe" --_balance True --_running_time $time > ./outfile/$time/running1.out 2>&1 &
nohup python -u main.py --seg_data 20 --algorithm "FedAvg" --_balance True --_running_time $time > ./outfile/$time/running2.out 2>&1 &
nohup python -u main.py --seg_data 20 --algorithm "FedAvg" --_balance False --_running_time $time > ./outfile/$time/running3.out 2>&1 &
nohup python -u main.py --seg_data 20 --algorithm "pFedMe" --_balance False --_running_time $time > ./outfile/$time/running4.out 2>&1 &
nohup python -u main.py --seg_data 50 --algorithm "pFedMe" --_balance True --_running_time $time > ./outfile/$time/running5.out 2>&1 &
nohup python -u main.py --seg_data 50 --algorithm "FedAvg" --_balance True --_running_time $time > ./outfile/$time/running6.out 2>&1 &
nohup python -u main.py --seg_data 50 --algorithm "FedAvg" --_balance False --_running_time $time > ./outfile/$time/running7.out 2>&1 &
nohup python -u main.py --seg_data 50 --algorithm "pFedMe" --_balance False --_running_time $time > ./outfile/$time/running8.out 2>&1 &
wait


done


