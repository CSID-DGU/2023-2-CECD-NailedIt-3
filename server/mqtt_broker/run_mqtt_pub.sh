#!/bin/sh

nohup python script.py > log.out 2>&1 &

echo "Script is running in background."