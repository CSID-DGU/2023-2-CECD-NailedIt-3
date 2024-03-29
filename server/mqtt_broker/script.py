import paho.mqtt.publish as publish
import time

def publish_sensor_data(timestamp, ph, dissolved_oxygen, salinity, turbidity, ammonia):
    # 메시지 구성
    message = f"timestamp: {timestamp}, pH: {ph}, DO(PPM): {dissolved_oxygen}, salinity(%): {salinity}, turbidity(NTU): {turbidity}, ammonia(mg/L): {ammonia}"
    # Mosquitto 브로커로 메시지 발행
    publish.single("log", message, hostname="mosquitto", client_id="filebeat_mqtt")

# 예시 데이터
timestamp = "2024-03-19 12:01:43"
ph = 7.61
dissolved_oxygen = 8.01
salinity = 0.6
turbidity = 14.65
ammonia = 2.0

# MQTT 메시지 발행
publish_sensor_data(timestamp, ph, dissolved_oxygen, salinity, turbidity, ammonia)
