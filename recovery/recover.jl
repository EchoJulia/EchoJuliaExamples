#!/usr/bin/env julia

# Some EK60 files can get corrupted, particularly with regard to EOF
# handling where spurious length bytes seem to be appended.

# This script attempts to recover datagrams from corrupted RAW files.

using SimradRaw

function main(args)

    filenames = args

    for filename in filenames

        datagrams = []

        try
            # Read datagrams until we get an exception
            open(filename) do f
                while !eof(f)
                    datagram = readencapsulateddatagram(f, datagramreader=readdatagramblock)
                    push!(datagrams,datagram)
                end
            end
        catch
            println("Recovering $(length(datagrams)) datagrams from $filename ...")

            f, ext = splitext(filename)
            f = basename(f)

            # Write out recovered datagrams
            open("$f-recovered.raw", "w") do f
                for d in datagrams
                    # See https://www.simrad.net/ek60_ref_english/default.htm for spec
                    l = UInt32(length(d))
                    write(f, l)
                    write(f, d)
                    write(f, l)
                end
            end
        end

    end
end

main(ARGS)
