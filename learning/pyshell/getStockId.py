import sys
import io
import tushare as ts
import json

# http://stackoverflow.com/questions/16549332/python-3-how-to-specify-stdin-encoding
# input_stream = io.TextIOWrapper(sys.stdin.buffer, encoding='utf-8')

for line in sys.stdin:
    # handle message sent from node
    # 注意: 去掉最後一個字,因為那是\n之類的
    message= line[:-1]
    if len(message)==6:
        data = ts.get_hist_data(message).head(2).to_json()

        print(data)
    else:
        print(message)
        #print(json.dumps(json.loads(line)))
