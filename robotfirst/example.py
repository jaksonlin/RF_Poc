# encoding utf-8
class Connection(object):
    def __init__(self, host, port):
        self.host = host
        self.port = int(port)

    def send(self, msg):
        print(msg)