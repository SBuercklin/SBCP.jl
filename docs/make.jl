push!(LOAD_PATH, joinpath(@__FILE, "../src/"))
using Documenter, SBCP

makedocs(sitename="SBCP.jl")
