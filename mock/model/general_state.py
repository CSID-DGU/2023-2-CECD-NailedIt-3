from core.model.init_state import InitState

class GeneralState(InitState):
    def get_name(self):
        return "일반 상태"
    
    def get_values(self):
        return {
            "temperature": 20.0 + InitState._RANDOM_GENERATOR.uniform(-1.0, 0.9),
            "DO": 7.0 + InitState._RANDOM_GENERATOR.uniform(-1.0, 0.9),
            "conductivity": 50.0 + InitState._RANDOM_GENERATOR.uniform(-50.0, 49.0),
            "pH": 7.5 + InitState._RANDOM_GENERATOR.uniform(-1.0, 0.9)
        }