module ParseRxNetwork

using DataStructures, DiffEqBiological

abstract type NetworkFileFormat end

# exported data types
struct RSSANetwork <: NetworkFileFormat end
struct BNGNetwork <: NetworkFileFormat end
struct ParsedReactionNetwork    
    "DiffEqBiological Network"
    rn

    "Initial Conditions"
    u₀

    "Parameters"
    p

    "Dict from short sym in rn.syms to full sym for species name"
    symstonames

    "Dict from lumped species name (symbol) to group of species ids"
    groupstoids
end
ParsedReactionNetwork(rn, u₀; p=nothing, symstonames=nothing, groupstoids=nothing) = ParsedReactionNetwork(rn, u₀, p, symstonames, groupstoids)

export RSSANetwork, BNGNetwork, ParsedReactionNetwork

# parsers
include("parsing_routines_rssafiles.jl")
include("parsing_routines_bngnetworkfiles.jl")

export loadrxnetwork

end # module
