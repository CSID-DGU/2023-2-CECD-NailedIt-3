#!/bin/sh
# run_mqtt_pub.sh

nohup python script.py > /dev/null 2>&1 &
echo $! > script.pid
echo "Script is running in background."