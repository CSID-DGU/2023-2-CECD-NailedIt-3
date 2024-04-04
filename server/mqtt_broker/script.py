import paho.mqtt.publish as publish
import json
import random
import time
from datetime import datetime

def publish_sensor_data():
    # 현재 시각을 timestamp로 사용
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    # 랜덤 값 생성
    ph = round(random.uniform(6.5, 8.5), 2) # pH는 6.5에서 8.5 사이
    dissolved_oxygen = round(random.uniform(5.0, 12.0), 2) # 용존 산소량은 5.0에서 12.0 PPM 사이
    salinity = round(random.uniform(0.0, 5.0), 2) # 염분은 0.0%에서 5.0% 사이
    turbidity = round(random.uniform(0.0, 30.0), 2) # 탁도는 0.0에서 30.0 NTU 사이
    ammonia = round(random.uniform(0.0, 1.0), 2) # 암모니아는 0.0에서 1.0 mg/L 사이
    # 메시지 구성
    message = json.dumps({
        "timestamp": timestamp,
        "pH": ph,
        "DO(PPM)": dissolved_oxygen,
        "salinity(%)": salinity,
        "turbidity(NTU)": turbidity,
        "ammonia(mg/L)": ammonia
    })
    # message = f"timestamp: {timestamp}, pH: {ph}, DO(PPM): {dissolved_oxygen}, salinity(%): {salinity}, turbidity(NTU): {turbidity}, ammonia(mg/L): {ammonia}"
    
    # Mosquitto 브로커로 메시지 발행
    publish.single("sensor/log", message, hostname="mosquitto", client_id="filebeat_mqtt", protocol=publish.MQTTv311)

# 주기적으로 MQTT 메시지 발행
while True:
    publish_sensor_data()
    print("Data published.")
    time.sleep(10) # 10초 간격으로 데이터 발행
