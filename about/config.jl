#!/usr/bin/env julia

using SimradRaw
using Filetimes
using Dates

# Given a RAW file, provide some basic information about the echo
# sounder configuration.

function main(args)
    filename = args[1]

    for d in datagrams(filename)
        if typeof(d) == SimradRaw.ConfigurationDatagram
            println("surveyname : ", d.configurationheader.surveyname)
            println("transectname : ", d.configurationheader.transectname)
            println("soundername : ", d.configurationheader.soundername)
            println("version : ", d.configurationheader.version)
            println("transducercount : ", d.configurationheader.transducercount)

            for transducer in d.configurationtransducers
                println("channelid : ", transducer.channelid)
                println("\tfrequency : ", transducer.frequency)
                println("\tgain : ", transducer.gain)
                println("\tbeamwidthalongship : ",transducer.beamwidthalongship)
                println("\tbeamwidthathwartship : ",transducer.beamwidthathwartship)
            end
            
        end
    end
    
end

main(ARGS)

