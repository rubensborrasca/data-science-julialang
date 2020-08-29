using Clustering, RDatasets, Plots
pyplot()

df = dataset("cluster","xclara") #Importa o dataset, utilizando a biblioteca RDatasets
data = copy(convert(Array{Float64}, df)') #Converte os dados do dataset no tipo Float64.

initseeds(:rand, data, 3) #Cria as 3 centróides iniciais, aleatoriamente

data_kmeans = kmeans(data,3) #Faz uma divisão em 3 clusters, a partir dos 3 centróides iniciais criados

print("Número de clusters escolhido:")
println(nclusters(data_kmeans)) #conta quantos clusters tem no dataset passado

print("Número de observações registradas em cada cluster:")
println(counts(data_kmeans)) #conta quantas amostras em cada cluster tem

df.group = assignments(data_kmeans) #Cria uma coluna no dataset inicial, só com as classificações entre cluster 1,2 e 3.

#Para plotar figuras usando o terminal do Windows, usa-se o comando "julia -i k-means.jl"
display(scatter(df[df.group .== 1, :V1],df[df.group .== 1, :V2],color="red", label="1"))
display(scatter!(df[df.group .== 2, :V1],df[df.group .== 2, :V2],color="black", label="2"))
display(scatter!(df[df.group .== 3, :V1],df[df.group .== 3, :V2],color="white", label="3"))