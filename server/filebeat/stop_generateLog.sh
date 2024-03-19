#!/bin/bash

PID=$(pgrep -f generateLog.py)
if [ -z "$PID" ]; then
    echo "No process found."
else
    kill $PID
    echo "Process with PID $PID has been stopped."
fi

#!/bin/bash

PID=$(pgrep -f generateLog2.py)
if [ -z "$PID" ]; then
    echo "No process found."
else
    kill $PID
    echo "Process with PID $PID has been stopped."
fi

#!/bin/bash

PID=$(pgrep -f generateLog3.py)
if [ -z "$PID" ]; then
    echo "No process found."
else
    kill $PID
    echo "Process with PID $PID has been stopped."
fi