#!/bin/bash

nohup python generateLog.py > /dev/null 2>&1 &
nohup python generateLog2.py > /dev/null 2>&1 &
nohup python generateLog3.py > /dev/null 2>&1 &
echo "Script is running in background."
