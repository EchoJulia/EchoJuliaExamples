#!/usr/bin/env julia

function main(args)
    SECOND = 10000000 # 100 nanosecond intervals
    MINUTE = SECOND * 60
    HOUR = MINUTE * 60
    i = 0
    for line in eachline(stdin)
        fields = split(line,"\t")
        j = parse(UInt64, fields[1])
        if j - i > HOUR
            i = j
            println(line)
        end
    end
    
end


main(ARGS)
