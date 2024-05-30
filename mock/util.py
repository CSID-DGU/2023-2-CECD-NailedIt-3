import asyncio
import logging
import requests
from core.model.init_state import InitState
from context import Context
from datetime import datetime

API_URL = "YOUR_API_URL"

async def save_to_file(context: Context):
    while context.running:
        state: InitState = context.get_state()
        for i in range(1, 4):
            values: dict = state.get_values()
            
            if (state is not Context.PADDING) and (state is not Context.STOPPED):
                timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                
                for key, value in values.items():
                    lower_key = key.lower()
                    
                    json = {
                        "timestamp": timestamp,
                        "id": i,
                        key: value
                    }
                    
                    requests.post(f"{API_URL}/{lower_key}", json=json)
            
            await asyncio.sleep(0.5)

async def check_input(context: Context):
    loop = asyncio.get_event_loop()
    while context.running:
        comment = await loop.run_in_executor(None, input, "Enter a comment (pend, stop, general, temperature-, temperature+, do-, conductivity-, conductivity+, ph-, ph+): ")

        switcher = {
            'pend': Context.PADDING,
            'stop': Context.STOPPED,
            'general': Context.GENERAL,
            'temperature-': Context.LOW_TEMPERATURE,
            'temperature+': Context.HIGH_TEMPERATURE,
            'do-': Context.LOW_DO,
            'conductivity-': Context.LOW_CONDUCTIVITY,
            'conductivity+': Context.HIGH_CONDUCTIVITY,
            'ph-': Context.LOW_PH,
            'ph+': Context.HIGH_PH,
        }
        current_state: InitState = context.get_state()
        next_state: InitState = switcher.get(comment, None)
        
        if next_state is None:
            logging.debug("-" * 50)
            logging.debug("Invalid input. Please try again.")
            logging.debug("-" * 50)
            continue
        
        if next_state is not Context.STOPPED:
            logging.debug("-" * 50)
            logging.debug(f"Change state: {current_state.get_name()} -> {next_state.get_name()}")
            logging.debug("-" * 50)
            context.set_state(next_state)
            await asyncio.sleep(0.1)
        else: 
            logging.debug("System stopped.")
            context.running = False