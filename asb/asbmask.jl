#!/usr/bin/env julia

using SimradEK60
using EchogramPyPlot
using PyPlot
using AliasedSeabed
using LaTeXStrings


function outputname(filename, suffix)
    rootname, ext = splitext(basename(filename))
    return "$rootname$suffix"
end

function process(filenames, freq)
    ps = pings(filenames)
    ps = [p for p in ps if p.frequency == freq]
    _Sv = Sv(ps)
    _R = R(ps)
    ntheta = alongshipangle(ps) # Split beam angle
    nphi = athwartshipangle(ps)

    # Mask top 10m
    _Sv[_R .< 10] .= -999
    
    mask = blackwell_asbmask(_Sv, ntheta, nphi)

    fig, axes = subplots(4,1, figsize=(6.5,8.5))

    ax = subplot(4,1,1)

    echogram(_Sv, cmap=EK500, range = maximum(_R), vmin=-95, vmax=-50)
    cb = plt[:colorbar]()
    cb[:set_label](L"$S_v$ dB re 1 m$^{-1}$")
    ylabel("Range / m")

    ax = subplot(4,1,2)

    echogram(ntheta, cmap=EK500, range = maximum(_R))
    cb = plt[:colorbar]()
    cb[:set_label]("Along. Angle")
    ylabel("Range / m")

    ax = subplot(4,1,3)

    echogram(nphi, cmap=EK500, range = maximum(_R))
    cb = plt[:colorbar]()
    cb[:set_label]("Athwart. Angle")
    ylabel("Range / m")
    
    ax = subplot(4,1,4)
   
    echogram(Int.(mask), range = maximum(_R), cmap=BW)
    cb = plt[:colorbar](ticks=[0,1])
    
    ylabel("Range / m")

    # ax = subplot(3,1,3)

    # echogram(Svmasked,  range = maximum(_R), cmap=EK500, vmin=-95, vmax=-50)
    # cb = plt[:colorbar]()
    # cb[:set_label](L"$S_v$ dB re 1 m$^{-1}$")
    # xlabel("Pings")
    # ylabel("Range / m")


    out = outputname(filenames[1],"-asb$freq.png")

    @info("Saving $out")
    savefig(out)
    
end

function main(args)

    freq = parse(Int, args[1])
    filenames = args[2:end]

    process(filenames, freq)
    
    show()

end


main(ARGS)
