#!/usr/bin/env julia

using SimradEK60
using PyPlot

include("asbfigure.jl")

function outputname(filename, suffix)
    rootname, ext = splitext(basename(filename))
    return "$rootname$suffix"
end

function main(args)

    freq = parse(Int, args[1])
    filenames = args[2:end]

    out = outputname(filenames[1],"-asb$freq.png")

    if isfile(out)
        @info("Skipping $out")
    else
        ps = pings(filenames)
        ps = [p for p in ps if p.frequency == freq]
        _Sv = Sv(ps)
        _R = R(ps)
        ntheta = alongshipangle(ps) # Split beam angle
        nphi = athwartshipangle(ps)

        asbfigure(_Sv, ntheta, nphi,_R)

        @info("Saving $out")
        savefig(out)

    end
    
    #show()

end


main(ARGS)
