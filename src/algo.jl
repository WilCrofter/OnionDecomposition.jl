#= Reference:
 Hébert-Dufresne, L. et al. Multi-scale structure and topological anomaly detection via a new network statistic: The onion decomposition. Sci. Rep. 6, 31708; doi: 10.1038/srep31708 (2016)
=#

typealias AdjMatrix{T<:Real} Union{Matrix{T},SparseMatrixCSC{T,Int}}

""" function OD{T}(A::AdjMatrix{T})

Performs an onion decomposition of the given adjacency matrix.
"""
function OD{T}(A::AdjMatrix{T})
    
end
