from random import Random
from abc import ABC, abstractmethod

class InitState(ABC):
    _RANDOM_GENERATOR: Random = Random()
    
    @abstractmethod
    def get_name(self):
        pass
    
    @abstractmethod
    def get_values(self):
        pass