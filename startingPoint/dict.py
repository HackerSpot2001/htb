#!/bin/python3

import requests
import itertools

list = 'abcdefghijklmnopqrstuvwxyz1234567890'

shit = itertools.permutations(list, 2)

urls = [a+b for (a, b) in shit]

f = open("urls.txt", "a")

for url in urls:
    f.write(urls[urls.index(url)] + "\n")

