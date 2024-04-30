#!/bin/sh

nohup sh -c '
    while true
    do
        mosquitto_pub -t log -m "timestamp: 2024-04-30 12:42:23, id: 1, pH: 7.12, DO(PPM): 8.71, salinity(%): 0.36, turbidity(NTU): 7.59, ammonia(mg/L): 0.01"
        sleep 5
    done' > /dev/null 2>&1 &

echo $! > script.pid
echo "Script is running in background."
