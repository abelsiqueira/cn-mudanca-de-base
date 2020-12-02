"""
    valor(σ, mantissa, b, E)

Calcula o valor de um número em forma de ponto flutuante

    σ × 0.(a₁a₂…aₖ) × bᴱ,

onde
- `σ` é o sinal do número, e deve ser `-1` ou `1`;
- `b` é a base e deve ser um inteiro tal que 2 ≤ b ≤ 16;
- `E` é o expoente e deve ser inteiro -10 ≤ E ≤ 10;
- `mantissa` é o vetor com elementos inteiros `aᵢ` tal que 0 ≤ aᵢ ≤ b - 1.

Lembre-se que a definição desse número é

    x = σ × bᴱ × ∑ᵢ aᵢ × b⁻ⁱ

Exemplos:
- `valor(1, [1, 1], 2, 3)` corresponde a `(0.11)₂ × 2³ = (0.5 + 0.25) × 8 = 6.0`.
"""
function valor(σ::Int, mantissa::Vector{Int}, b::Int, E::Int)
    x = 0.0
    return x
end

"""
    σ, mantissa, b, E = converte(x, b)

Converte o número `x` para a forma de ponto flutuante na base `b`.

- `x` deve ser inteiro entre -50000 e 50000;
- `b` deve ser inteiro entre 2 e 16.

Exemplos:
- `converte(6, 2)` deve retornar `1, [1, 1], 2, 3`.
"""
function converte(x::Int, b::Int)
    if x < 0
        return -1, Int[], 2, 0
    end
    mantissa = Int[]
    return return 1, Int[], 2, 0
end