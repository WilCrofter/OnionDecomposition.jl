#= Reference:
 Hébert-Dufresne, L. et al. Multi-scale structure and topological anomaly detection via a new network statistic: The onion decomposition. Sci. Rep. 6, 31708; doi: 10.1038/srep31708 (2016)
=#

""" fig1()
(Sparse) adjacency matrix for the graph of Figure 1 in the reference, specifically:

     10--9--11        12-----      16
         |            |     |      |
1--2--3--4--5--6------7-----8------15
                      |    / \     |
                      ----13-14    17
"""
function fig1()
    # v0[i] and v1[i] define an adjacency (edge)
    v0 = [1, 2, 3, 4, 9, 9, 4, 5, 6, 7, 7,13, 7, 8, 8, 8, 8,15,15]
    v1 = [2, 3, 4, 9,10,11, 5, 6, 7,12,13,14, 8,12,13,14,15,16,17]
    # Since the graph is undirected, v1[i] and v0[i] are also adjacent
    return sparse(vcat(v0,v1), vcat(v1,v0), ones(Int,length(v0)+length(v1)))
end

function fig1_OD()
    tmp  =   [1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16,17]
    cores =  [1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 2, 2, 2, 1, 1, 1]
    layers = [1, 2, 3, 4, 5, 6, 8, 8, 2, 1, 1, 7, 8, 7, 2, 1, 1]
    return cores, layers
end
