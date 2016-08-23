#= Reference:
 Hébert-Dufresne, L. et al. Multi-scale structure and topological anomaly detection via a new network statistic: The onion decomposition. Sci. Rep. 6, 31708; doi: 10.1038/srep31708 (2016)
=#

typealias AdjMatrix{T<:Real} Union{Matrix{T},SparseMatrixCSC{T,Int}}

""" function OD{T}(A::AdjMatrix{T})

Performs an onion decomposition of the given adjacency matrix.
"""
function OD{T}(A::AdjMatrix{T})
    m, n = size(A)
    m == n || error("Adjacency matrix must be square")
    A == A' || error("Adjaceny matrix must be symmetric")
    V = collect(1:m)
    Vidx = trues(m)
    Lidx = trues(m)
    corelist = zeros(Int,m)
    layerlist = zeros(Int,m)
    core = layer = 1
    while any(Vidx)
        corelist[Vidx] = core
        # Recursively remove nodes of degree <= core, recalculating degrees,
        # until there are none left, then increment core and repeat.
        while any(Lidx)
            Lidx = deepcopy(Vidx)
            Lidx &= sum(A[Lidx,Lidx],2) .<= core
            layerlist[Lidx] = layer
            Vidx &= Lidx
            layer += 1
        end
        core += 1
    end
end
