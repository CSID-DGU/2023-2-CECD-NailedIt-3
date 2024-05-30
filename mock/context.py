from model.pendding_state import PenddingState
from model.stopped_state import StoppedState
from model.general_state import GeneralState
from model.low_temperature_state import LowTemperatureState
from model.high_temperature_state import HighTemperatureState
from model.low_do_state import LowDOState
from model.low_conductivity_state import LowConductivityState
from model.high_conductivity_state import HighConductivityState
from model.low_ph_state import LowPHState
from model.high_ph_state import HighPHState

class Context:
    PADDING = PenddingState()
    GENERAL = GeneralState()
    LOW_TEMPERATURE = LowTemperatureState()
    HIGH_TEMPERATURE = HighTemperatureState()
    LOW_DO = LowDOState()
    LOW_CONDUCTIVITY = LowConductivityState()
    HIGH_CONDUCTIVITY = HighConductivityState()
    LOW_PH = LowPHState()
    HIGH_PH = HighPHState()
    STOPPED = StoppedState()
    
    def __init__(self):
        self.state = Context.PADDING
        self.running = True

    def set_state(self, state):
        self.state = state

    def get_state(self):
        return self.state