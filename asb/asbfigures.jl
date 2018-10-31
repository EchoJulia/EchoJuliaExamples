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

    for filename in filenames

        out = outputname(filename,"-asb$freq.png")

        if isfile(out)
            @info("Skipping $out")
        else
            try
                ps = pings(filename)
                ps = [p for p in ps if p.frequency == freq]
                _Sv = Sv(ps)
                _R = R(ps)
                ntheta = alongshipangle(ps) # Split beam angle
                nphi = athwartshipangle(ps)

                fig = asbfigure(_Sv, ntheta, nphi,_R)

                @info("Saving $out")
                savefig(out)
                close(fig)
            catch
                @warn("Problems with $filename")
            end
        end
    end
    
end


main(ARGS)
