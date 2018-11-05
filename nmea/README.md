# NMEA and GPS from RAW files

`nmea.jl` can be used to extract NMEA sentences from RAW files, for
example:

```
/nmea.jl ../data/*.raw > nmea.txt
```

`gps.py` can be used to convert NMEA to GPS (At the time of writing,
Julia does not havve a sufficient NMEA library to achieve this).

```
./gps.py < nmea.txt > gps.txt
```

You can then use a program like [QGIS](https://www.qgis.org/en/site/)
to visualise the track on a map.
