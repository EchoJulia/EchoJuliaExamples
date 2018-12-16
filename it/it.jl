#!/usr/bin/env julia

# Figure out the ping interval $I_T$

using SimradEK60
using Statistics

function main(args)
    filename = args[1]

    ps = SimradEK60.load(filename)

    # Select only the 38 kHz pings
    ft38 = [filetime(p) for p in ps if p.frequency == 38000]

    # calculate inter ping time
    it38 = [ft38[x] - ft38[x-1] for x in 2:length(ft38)]

    println("Ping interval = ", mean(it38) / 10000000, "s")
end

main(ARGS)
