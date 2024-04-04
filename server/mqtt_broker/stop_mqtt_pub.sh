# #!/bin/sh

# PID=$(pgrep -f script.py)
# if [ -z "$PID" ]; then
#     echo "No process found."
# else
#     kill $PID
#     echo "Process with PID $PID has been stopped."
# fi

#!/bin/sh
# stop_mqtt_pub.sh
if [ ! -f script.pid ]; then
    echo "PID file not found."
else
    PID=$(cat script.pid)
    kill $PID
    rm script.pid
    echo "Process with PID $PID has been stopped."
fi
