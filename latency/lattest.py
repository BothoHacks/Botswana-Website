# import requests
# t = requests.get("http://apply.bothohacks.org").elapsed.total_seconds()

# import urllib
# nf = urllib.urlopen(url)
# start = time.time()
# page = nf.read()
# end = time.time()
# nf.close()
# print(end-start)

import urllib.request
import time

start = time.time()
with urllib.request.urlopen("http://apply.bothohacks.org") as url:
    s = url.read()
    end = time.time()
    print(end-start)
