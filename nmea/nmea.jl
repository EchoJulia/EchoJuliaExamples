#!/usr/bin/env julia

using SimradRaw

# Prints the NMEA strings for one or more RAW files.

function main(args)
    for datagram in datagrams(args, handleexceptions=true)
        if typeof(datagram) == SimradRaw.TextDatagram && datagram.dgheader.datagramtype == "NME0"
            println(datagram.text)
            flush(stdout)
        end
    end
end

main(ARGS)
