import paho.mqtt.publish as publish
import random
import time

# MQTT 브로커 정보 설정
mqtt_broker = "your_mqtt_broker_address"
mqtt_port = 1883
mqtt_topic = "log"

# 무작위 값 생성 함수
def generate_random_data():
    timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
    #id = random.randint(1, 3)
    pH = round(random.uniform(6.5, 8.5), 2)
    dissolved_oxygen = round(random.uniform(7.0, 9.0), 2)
    salinity = round(random.uniform(0.3, 0.4), 2)
    turbidity = round(random.uniform(5.0, 10.0), 2)
    ammonia = round(random.uniform(0.0, 0.1), 2)
    
    pH2 = round(random.uniform(6.5, 8.5), 2)
    dissolved_oxygen2 = round(random.uniform(7.0, 9.0), 2)
    salinity2 = round(random.uniform(0.3, 0.4), 2)
    turbidity2 = round(random.uniform(5.0, 10.0), 2)
    ammonia2 = round(random.uniform(0.0, 0.1), 2)
    
    pH3 = round(random.uniform(6.5, 8.5), 2)
    dissolved_oxygen3 = round(random.uniform(7.0, 9.0), 2)
    salinity3 = round(random.uniform(0.3, 0.4), 2)
    turbidity3 = round(random.uniform(5.0, 10.0), 2)
    ammonia3 = round(random.uniform(0.0, 0.1), 2)

    message = f"timestamp: {timestamp}, id: 1, pH: {pH}, DO(PPM): {dissolved_oxygen}, salinity(%): {salinity}, turbidity(NTU): {turbidity}, ammonia(mg/L): {ammonia}"
    message2 = f"timestamp: {timestamp}, id: 2, pH: {pH2}, DO(PPM): {dissolved_oxygen2}, salinity(%): {salinity2}, turbidity(NTU): {turbidity2}, ammonia(mg/L): {ammonia2}"
    message3 = f"timestamp: {timestamp}, id: 3, pH: {pH3}, DO(PPM): {dissolved_oxygen3}, salinity(%): {salinity3}, turbidity(NTU): {turbidity3}, ammonia(mg/L): {ammonia3}"
    publish_mqtt_message(message)
    publish_mqtt_message(message2)
    publish_mqtt_message(message3)
    print("Published:", message)
    print("Published2:", message2)
    print("Published3:", message3)
    

# MQTT 메시지 발행 함수
def publish_mqtt_message(message):
    publish.single(mqtt_topic, message, port=mqtt_port)

# 메인 루프
if __name__ == "__main__":
    try:
        while True:
            generate_random_data()
            
            time.sleep(10)  # 5초마다 메시지 전송
    except KeyboardInterrupt:
        print("Exiting...")
