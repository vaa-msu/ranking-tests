# 2020.02.17, Антонюк В.А.

M(P) = [Int(sign(P[i]-P[j])) for i=1:length(P), j=1:length(P)]


function TrueIndices!(P::Vector{T}) where T<:Int
    i = length(P)-1
    while i > 0
        Curr = P[i]
        for j = i+1:length(P)
            P[j] += (Curr<=P[j])
        end
        i -= 1
    end
end


function HeuristicIterations!(R::Matrix{T}) where T<:Int
    @assert size(R)[1] == size(R)[2]
    Alt = Vector{T}()
    while !isempty(R)
        Size = size(R)[1]
        (RMin,Pos) = findmin([sum(R[i,:]) for i=1:Size])
        push!(Alt, Pos)
        R = reshape([R[i,j] for i=1:Size, j=1:Size
                              if i!=Pos && j!=Pos],(Size-1,Size-1))
    end
    TrueIndices!(Alt)
    return Alt
end


function OptimizeRanking!(P::Vector{T}, R::Matrix{T}) where T<:Int
    N = size(P)[1]
    @assert size(R)[1] == size(R)[2] == N
    k = N-1
    while k > 0
        if R[P[k],P[k+1]] > R[P[k+1],P[k]]    # 2020.04.01
            P[k], P[k+1] = P[k+1], P[k]
            k -= 1         # 2020.04.01
        end
        k -= 1
    end
    return P
end

﻿# 2020.02.27, Антонюк В.А.

# 2020.03.07
#using LinearAlgebra
@static if VERSION >= v"0.7" using LinearAlgebra end
#

function HeuristicIterations(R::Matrix{T}) where T<:Int
    @assert size(R)[1] == size(R)[2]
    (N, _), TMax = size(R), typemax(T)
    E, Dropped = ones(T, N), Vector{T}()
    while length(Dropped) < N
        V = [(E[k]==0 ? TMax : R[k,:]⋅E) for k = 1:N]
        (_, Pos) = findmin(V)
        E[Pos] = 0
        push!(Dropped, Pos)
    end
    return Dropped
end

