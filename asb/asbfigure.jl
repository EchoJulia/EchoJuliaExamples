# asbfigure.jl
#
# Shows an echogram and corresponding aliased seabed mask.

using EchogramPyPlot
using PyPlot
using AliasedSeabed
using LaTeXStrings

function asbfigure(Sv, ntheta, nphi, R)

    # Mask top 10m
    Sv[R .< 10] .= -999

    mask = blackwell_asbmask(Sv, ntheta, nphi)

    fig, axes = subplots(4,1, figsize=(6.5,8.5))

    # Sv echogram
    ax = subplot(4,1,1)
    echogram(Sv, cmap=EK500, range = maximum(R), vmin=-95, vmax=-50)
    cb = plt[:colorbar]()
    cb[:set_label](L"$S_v$ dB re 1 m$^{-1}$")
    ylabel("Range / m")

    # ntheta echogram
    ax = subplot(4,1,2)
    echogram(ntheta, cmap=EK500, range = maximum(R))
    cb = plt[:colorbar]()
    cb[:set_label]("Along. Angle")
    ylabel("Range / m")

    # nphi echogram
    ax = subplot(4,1,3)
    echogram(nphi, cmap=EK500, range = maximum(R))
    cb = plt[:colorbar]()
    cb[:set_label]("Athwart. Angle")
    ylabel("Range / m")

    # Aliased seabed mask
    ax = subplot(4,1,4)
    echogram(Int.(mask), range = maximum(R), cmap=BW)
    cb = plt[:colorbar](ticks=[0,1])
    ylabel("Range / m")

    return fig
    
end


