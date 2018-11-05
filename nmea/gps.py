#!/usr/bin/env python3

import sys
import pynmea2

for line in sys.stdin:
    values = line.split("\t")
    msg = pynmea2.parse(values[1])
    if hasattr(msg, 'latitude'):
        print(values[0], "\t", msg.timestamp, "\t",  msg.latitude, "\t", msg.longitude)
