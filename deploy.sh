#!/bin/bash
sudo apt update -y  && sudo apt install curl -y && curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt install nodejs -y && sudo apt-get install screen -y
screen_name=$1
max_create_num=$2
run_key=$3
if screen -ls|grep $screen_name;then
    echo "$screen_name screen exist"
else
    screen -dmS $screen_name
    screen -x -S $screen_name -p 0 -X stuff "npx --yes @lens-protocol/momoka --node "https://polygon-mainnet.g.alchemy.com/v2/$run_key" --environment="POLYGON" --concurrency=$max_create_num"
    screen -x -S $screen_name -p 0 -X stuff $'\n'
fi
sleep 8
echo "ctrl + a; d <quit screen window>"
screen -x $screen_name 
