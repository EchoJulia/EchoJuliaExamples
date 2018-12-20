#!/usr/bin/env julia

# For each frequency, show the power - mean, min, max for each of the
# pings

using SimradEK60
using Statistics

function main(args)
    filename = args[1]

    ps = SimradEK60.load(filename)

    fs = unique([p.frequency for p in ps])

    for f in fs
        pwr = [p.transmitpower for p in ps if p.frequency == f]
        println(f, "\t", mean(pwr), "\t", minimum(pwr), "\t", maximum(pwr))
    end
end

main(ARGS)
