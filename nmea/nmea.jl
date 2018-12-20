#!/usr/bin/env julia

using SimradRaw
using Filetimes
using Dates

# Exports NMEA strings from one or more RAW files to text files named
# by date - e.g. `2013-01-16.nmea` These can be loaded into Google
# Earth to determine cruise track.

function main(args)
    currentfilename = ""
    f = nothing
    for datagram in datagrams(args)
        if typeof(datagram) == SimradRaw.TextDatagram && datagram.dgheader.datagramtype == "NME0"
            d = Date(datetime(SimradRaw.filetime(datagram.dgheader)))
            filename = "$d.nmea"
            if currentfilename == filename
                write(f, datagram.text, "\n")
            else
                if currentfilename != ""
                    close(f)
                end
                f = open(filename, "w")
                currentfilename = filename
            end
        end
    end
    close(f)
end

main(ARGS)

