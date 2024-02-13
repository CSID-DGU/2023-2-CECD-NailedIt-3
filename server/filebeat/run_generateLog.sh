#!/bin/bash

nohup python genreateLog.py > /dev/null 2>&1 &
echo "Script is running in background."
