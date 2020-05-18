class MyScopedLib:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def __init__(self):
        self._counter = 0

    def get_global_count(self):
        return self._counter
        
    def bump_global_count(self):
        self._counter += 1

    def clear_global_counter(self):
        self._counter = 0
