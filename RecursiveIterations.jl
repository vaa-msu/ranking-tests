# 2020.04.01, Антонюк В.А.

include("HeuristicAlgorithm.jl")

function UpperSum(A::Array{Int,2})
    S,(H,W) = 0, size(A)
    @assert W == H
    for i=1:H, j=i+1:W  S += A[i,j] end
    return S
end

ReOrder(M::Matrix{Int}, V::Vector{Int}) = [M[i,j] for i ∈ V, j ∈ V]

function RecursiveIteration!(ScoreMatrix::Matrix{Int}, ToDrop=Vector{Int}())
    (H,W) = size(ScoreMatrix)
    @assert W == H
    TrueDropped = copy(ToDrop)
    TrueIndices!(TrueDropped)
    if length(TrueDropped) < H
        Summed = zeros(Int, H-length(TrueDropped))
        Dropped = 0
        for i = 1:H
            i ∈ TrueDropped && continue
            Dropped += 1
            for j = 1:W
                j ∈ TrueDropped && continue
                Summed[Dropped] += ScoreMatrix[i,j]
            end    
        end
        (Val,Idx) = findmin(Summed)
        while Idx != nothing
            push!(ToDrop,Idx)
            if length(ToDrop) < H
                RecursiveIteration!(ScoreMatrix, ToDrop)
            else
                Dropped = copy(ToDrop)
                TrueIndices!(Dropped)
                LoopCount = 0              
                while true
                    LoopCount += 1
                    OldDropped = copy(Dropped)
                    print("$Dropped : ")
                    print(UpperSum(ReOrder(ScoreMatrix, Dropped)))
                    OptimizeRanking!(Dropped,ScoreMatrix)
                    LoopCount < 100 || break
                    Dropped != OldDropped || break
                    print(" -> ")
                end
                println("\n")
            end
            pop!(ToDrop)
            Idx = findnext(x->x==Val, Summed, Idx+1)
        end
    end    
end

