#!/usr/bin/env julia

# For loading Simrad EK60 RAW files
using SimradEK60
using SimradEK60TestData

# For plotting echograms
using EchogramPyPlot

# For tweaking echograms
using PyPlot
using LaTeXStrings

# Load the pings from a sample Simrad EK60 RAW file.
filename = EK60_SAMPLE
ps = SimradEK60.load(filename)

# Select only the 120 kHz pings
ps120 = [p for p in ps if p.frequency == 120000]

# Calculate volume backscatter
Sv120 = Sv(ps120)

# Range / depth
_R = R(ps120)

# Plot an echogram
echogram(Sv120, range = maximum(_R), cmap=EK500, vmin=-95, vmax=-50)

# Add a labelled colour bar
cb = plt[:colorbar]()
cb[:set_label](L"$S_v$ dB re 1 m$^{-1}$")

# Label the axes
xlabel("Pings")
ylabel("Range / m")

# Save the echogram
savefig("example.png")

# Display the echogram
show()


