from core.model.init_state import InitState

class PenddingState(InitState):
    def get_name(self):
        return "대기 중"
    
    def get_values(self):
        return None