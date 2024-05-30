from core.model.init_state import InitState

class StoppedState(InitState):
    def get_name(self):
        return "종료"
    
    def get_values(self):
        return None