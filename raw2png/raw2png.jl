#!/usr/bin/env julia

# Export RAW files as a series of PNG echograms at full resolution.

# For loading Simrad EK60 RAW files
using SimradEK60

# For plotting echograms
using EchogramImages
using Images

function outputname(filename, suffix)
    rootname, ext = splitext(basename(filename))
    return "$rootname$suffix"
end

filenames = ["/home/reb/Dropbox/phd/bitbucket/fb-paper/supplementary/jech/D20160729-T122726.raw"]
function main(args)

    filenames = args[1:end]
    
    ps = collect(SimradEK60.pings(filenames))

    frequencies = unique([p.frequency for p in ps])

    for frequency in frequencies

        psf = [p for p in ps if p.frequency == frequency]

        img = imagesc(Sv(psf),vmin=-95,vmax=-50,size=nothing)
        out = outputname(filenames[1],"-Sv$frequency.png")
        @info("Writing $out ...")
        Images.save(out,img)
        
        img = imagesc(alongshipangle(psf),size=nothing)
        out = outputname(filenames[1],"-ntheta$frequency.png")
        @info("Writing $out ...")
        Images.save(out,img)
        
        img = imagesc(athwartshipangle(psf),size=nothing)
        out = outputname(filenames[1],"-nphi$frequency.png")
        @info("Writing $out ...")
        Images.save(out,img)
        
    end

end

main(ARGS)
