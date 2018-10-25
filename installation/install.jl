#!/usr/bin/env julia

# EchoJulia package install script

using Pkg

# Useful packages
Pkg.add("LaTeXStrings")
Pkg.add(PackageSpec(url="https://github.com/JuliaPy/PyPlot.jl.git", rev="master"))
Pkg.add(PackageSpec(url="https://github.com/JuliaImages/ImageFiltering.jl.git", rev="master"))

# EchoJulia packages
Pkg.add(PackageSpec(url="https://github.com/EchoJulia/SimradRaw.jl.git", rev="master"))
Pkg.add(PackageSpec(url="https://github.com/EchoJulia/Filetimes.jl.git", rev="master"))
Pkg.add(PackageSpec(url="https://github.com/EchoJulia/SimradEK60.jl.git", rev="master"))
Pkg.add(PackageSpec(url="https://github.com/EchoJulia/SimradEK60TestData.jl.git", rev="master"))
Pkg.add(PackageSpec(url="https://github.com/EchoJulia/EchogramPyPlot.jl.git", rev="master"))
Pkg.add(PackageSpec(url="https://github.com/EchoJulia/EchogramUtils.jl.git", rev="master"))
Pkg.add(PackageSpec(url="https://github.com/EchoJulia/EchogramProcessing.jl.git", rev="master"))
Pkg.add(PackageSpec(url="https://github.com/EchoJulia/EchoMetrics.jl.git", rev="master"))
Pkg.add(PackageSpec(url="https://github.com/EchoJulia/AliasedSeabed.jl.git", rev="master"))
Pkg.add(PackageSpec(url="https://github.com/EchoJulia/TrueSeabed.jl.git", rev="master"))
Pkg.add(PackageSpec(url="https://github.com/EchoJulia/EchoviewEvr.jl.git", rev="master"))
Pkg.add(PackageSpec(url="https://github.com/EchoJulia/EchoviewEcs.jl.git", rev="master"))
Pkg.add(PackageSpec(url="https://github.com/EchoJulia/EchogramImages.jl.git", rev="master"))

