# encoding utf-8
from example import Connection

class MyLibrary:

    def __init__(self, host, port=80):
        self._conn = Connection(host, int(port))
        self.rs = {}
        self.rs['a']="1"
        with open(r'd:/test.txt', 'a') as f:
            f.write("Init MyLibrary\n")

    def my_test_writer(self, line):
        with open(r'd:/test.txt', 'a') as f:
            f.write(f"{line}\n")
            
    def send_message(self, message):
        self._conn.send(message)

    def get_a_dict(self):
        
        self.rs['b']=self._conn
        return self.rs

    def get_conn(self):
        return self._conn

    def my_lib_setup(self):
        self.my_test_writer("my_setup call")
        self.rs['c']="50000"
        return "Oh, Hello"

    def my_lib_teardown(self):
        self.my_test_writer("my_tear_down call")
        return "Bye!"

    def my_setup_new(self):
        self.my_test_writer("my_setup_new call")
        self.rs['d']=2000
        return "Hello World"

    def my_teardown_new(self):
        self.my_test_writer("my_teardown_new call")
        return "Byebye!"


