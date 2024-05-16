# #!/bin/sh

PID=$(pgrep -f script.py)
if [ -z "$PID" ]; then
    echo "No process found."
else
    kill $PID
    echo "Process with PID $PID has been stopped."
fi