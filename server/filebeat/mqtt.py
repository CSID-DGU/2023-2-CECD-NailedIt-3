import paho.mqtt.client as mqtt

def on_message(client, userdata, message):
    print("Received message:", message.payload.decode())

client = mqtt.Client()
client.on_message = on_message
client.connect("mosquitto", 1883)
client.subscribe("log")
client.loop_forever()
