#!/bin/python3

import requests
import itertools

list = 'abcdefghijklmnopqrstuvwxyz1234567890'

shit = itertools.permutations(list, 2)

urls = [a+b for (a, b) in shit]

successes = []

for url in urls:
    point = "http://" + urls[urls.index(url)] + ".thetoppers.htb"
    try:
        rcode = requests.get(point)
        if rcode.status_code == 200:
            successes += point
        else:
            pass
    except:
        pass

print(successes)

