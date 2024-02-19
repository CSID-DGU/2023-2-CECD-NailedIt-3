#!/bin/bash

nohup python generateLog.py > /dev/null 2>&1 &
echo "Script is running in background."
