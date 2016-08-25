using Base.Test
using OnionDecomposition

M=OnionDecomposition

@test M.OD(M.fig1()) == M.fig1_OD()

