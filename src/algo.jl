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
    Vidx = fill(true,m)
    Lidx = fill(true,m)
    corelist = zeros(Int,m)
    layerlist = zeros(Int,m)
    core = layer = 1
    while any(Vidx)
        corelist[Vidx] = core
        # Recursively remove nodes of degree <= core, recalculating degrees,
        # until there are none left, then increment core and repeat.
        #
        while true
            # Initialize layer indices to those of all remaining vertices
            Lidx[1:m] = Vidx[1:m] # modifies Lidx in place
            # Reduce layer indices to those of all vertices with
            # degree <= core in the current subgraph
            Lidx[Vidx] &= (sum(A[Vidx,Vidx],2) .<= core)
            # If such vertices exist
            if any(Lidx)
                # Assign the current layer to them.
                layerlist[Lidx] = layer
                # Remove them from the graph
                Vidx[Lidx] = false
                layer += 1
            else
                break;
            end
        end
        core += 1
    end
    return corelist, layerlist
end
