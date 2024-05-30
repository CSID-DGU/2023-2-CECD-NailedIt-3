from core.model.init_state import InitState

class HighConductivityState(InitState):
    def get_name(self):
        return "이상 상태(전도 높음)"
    
    def get_values(self):
        return {
            "temperature": 20.0 + InitState._RANDOM_GENERATOR.uniform(-1.0, 0.9),
            "DO": 7.0 + InitState._RANDOM_GENERATOR.uniform(-1.0, 0.9),
            "conductivity": 2100.0 + InitState._RANDOM_GENERATOR.uniform(-50.0, 49.0),
            "pH": 7.5 + InitState._RANDOM_GENERATOR.uniform(-1.0, 0.9)
        }