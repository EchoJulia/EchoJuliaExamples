# NMEA and GPS from RAW files

`nmea.jl` can be used to extract NMEA sentences from RAW files, for
example:

```
/nmea.jl ../data/*.raw
```

`gps.py` can be used to convert NMEA to GPS (At the time of writing,
Julia does not havve a sufficient NMEA library to achieve this).

```
./gps.py < 2013-01-02.nmea > gps.txt
```

`thin.jl` can be used to prune the number of data points, to say,
hourly GPS.

You can then use a program like [QGIS](https://www.qgis.org/en/site/)
to visualise the track on a map. Import delimited text layer. The
Quick Map Services plugin provides a reasonable base map.

Google Earth desktop supports loading of *.nmea files.
