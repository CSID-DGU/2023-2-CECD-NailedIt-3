import random
import time
from datetime import datetime

# setting initial values
ph = 7.2
dissolved_oxygen = 8.5
salinity = 0.3
turbidity = 10
ammonia = 0.02

def generate_sensor_data():
    global ph, dissolved_oxygen, salinity, turbidity, ammonia
    
    # add random noise
    ph += random.uniform(-0.1, 0.1)
    dissolved_oxygen += random.uniform(-0.1, 0.1)
    salinity += random.uniform(-0.05, 0.05)
    turbidity += random.uniform(-1, 1)
    ammonia += random.uniform(-0.01, 0.01)
    
    # limit values to realistic ranges
    ph = max(min(ph, 14), 0)
    dissolved_oxygen = max(dissolved_oxygen, 0)
    salinity = max(min(salinity, 100), 0)
    turbidity = max(turbidity, 0)
    ammonia = max(ammonia, 0)
    
    timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    return timestamp, round(ph, 2), round(dissolved_oxygen, 2), round(salinity, 2), round(turbidity, 2), round(ammonia, 2)

while True:
    timestamp, ph, dissolved_oxygen, salinity, turbidity, ammonia = generate_sensor_data()
    log_line = "timestamp: {}, id: 3, pH: {}, DO(PPM): {}, salinity(%): {}, turbidity(NTU): {}, ammonia(mg/L): {}\n".format(timestamp, ph, dissolved_oxygen, salinity, turbidity, ammonia)
    with open('test3.log', 'a') as log_file:
        log_file.write(log_line)
    time.sleep(5)
