using Test

include("main.jl")

@testset "Testes da função valor" begin
    for σ in [-1, 1]
        @test valor(σ, [0], 2, 3) == 0
        @test valor(σ, [1, 1], 2, 3) ≈ σ * (0.5 + 0.25) * 2.0^3
        @test valor(σ, [1, 1], 2, -4) ≈ σ * (0.5 + 0.25) * 2.0^-4
        @test valor(σ, [1, 2], 3, 2) ≈ σ * (1/3 + 2/9) * 3.0^2
        @test valor(σ, [3, 3], 5, 1) ≈ σ * (3/5 + 3/25) * 5.0
    end

    @test_throws ErrorException("σ deve ser -1 ou 1") valor(rand(Int), [1], 2, 0)
    @test_throws ErrorException("b deve ser ≥ 2 e ≤ 16") valor(1, [1], 0, 0)
    @test_throws ErrorException("b deve ser ≥ 2 e ≤ 16") valor(1, [1], 17, 0)
    @test_throws ErrorException("E deve ser ≥ -10 e ≤ 10") valor(1, [1], 2, -11)
    @test_throws ErrorException("E deve ser ≥ -10 e ≤ 10") valor(1, [1], 2, 11)
    @test_throws ErrorException("mantissa não pode ficar vazia") valor(1, Int[], 2, 0)
end

@testset "Testes da função converte" begin
    for σ in [-1, 1]
        @test converte(5σ, 2) == (σ, [1, 0, 1], 2, 3)
        @test converte(5σ, 3) == (σ, [1, 2], 3, 2)
        @test converte(5σ, 4) == (σ, [1, 1], 4, 2)
    end
    @test converte(256, 7) == (1, [5, 1, 4], 7, 3)
    for b = 4:16
        @test converte(b^2 + 2b + 3, b) == (1, [1, 2, 3], b, 3)
    end

    @test_throws ErrorException("b deve ser ≥ 2 e ≤ 16") converte(2, 0)
    @test_throws ErrorException("b deve ser ≥ 2 e ≤ 16") converte(2, 17)
    @test_throws ErrorException("x deve ser ≥ -50000 e ≤ 50000") converte(-50001, 2)
    @test_throws ErrorException("x deve ser ≥ -50000 e ≤ 50000") converte(50001, 2)
end

@testset "Consistência" begin
    for x = -500:500, b = 2:16, σ = [-1, 1]
        @test valor(converte(σ * x, b)...) ≈ σ * x
    end
end