#!/usr/bin/env julia

using SimradRaw
using Filetimes
using Dates

function main(args)
    filenames = args
    for filename in filenames
        ds = collect(datagrams(filename))
        print(filename,"\t")
        print(datetime(SimradRaw.filetime(ds[1].dgheader)), "\t")
        println(datetime(SimradRaw.filetime(ds[end].dgheader)))
        
    end
end

main(ARGS)

