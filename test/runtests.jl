using ReactionNetworkImporter, Test

@time begin
    @time @testset "BNG Repressilator Test" begin include("test_repressilator_odes.jl") end
end