#!/usr/bin/env python3

import sys
import pynmea2

for line in sys.stdin:
    try:
        msg = pynmea2.parse(line)
        if hasattr(msg, 'latitude'):
            print(msg.timestamp, '\t',  msg.latitude, '\t', msg.longitude, '\n')
    except pynmea2.nmea.SentenceTypeError:
        pass
            
