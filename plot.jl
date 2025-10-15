using DelimitedFiles
using Plots
using DataFrames
using CSV

data = DelimitedFiles.readdlm("data.txt", ' ')
time = data[1:17]
distance = data[18:end]
holes = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]


distanceMeters = @. round((distance + 11.9) / 100, digits=2)

table = DataFrame(Furos = holes, Distância = distanceMeters, Tempo = time)

CSV.write("dados1.csv", table)

p = plot(distanceMeters, time,
    title = "Periodo X Distância",

    xlabel = "Distância do centro de massa (m)",
    ylabel = "Periodo (s)",

    marker = :circle,
    markersize = 5,
    markerstrokecolor = :blue,

    linewidth = 3,
    label = false,
    
)

savefig(p, "graph/grafico1.png")


# menor valor do periodo é 0,14s, exatamente quando ele exatamente na outra extremidade do pêndulo