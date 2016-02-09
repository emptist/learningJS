import sys
import io
import tushare as ts
import json

# http://stackoverflow.com/questions/16549332/python-3-how-to-specify-stdin-encoding
# input_stream = io.TextIOWrapper(sys.stdin.buffer, encoding='utf-8')

for message in sys.stdin:
    # handle message sent from node
    print(message.decode('utf-8'))
    print(message)
