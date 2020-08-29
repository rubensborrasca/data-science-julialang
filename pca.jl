using MultivariateStats, RDatasets, Plots
pyplot()

df = dataset("datasets","iris") #Importa o dataset utilizado, chamado de iris.

input = convert(Matrix,df[:,1:4])' #Converte o dataset em uma matriz com 4 colunas.

n_dim = 2

M = fit(PCA, input, maxoutdim=n_dim) #Cria um modelo PCA de n_dim dimensões

i_transform = MultivariateStats.transform(M, input) #Cria um vetor e aloca as 2 componentes principais extraídas da PCA

display(scatter(i_transform'[1:50,1],i_transform'[1:50,2], color="black", label="Setosa"))
display(scatter!(i_transform'[50:100,1],i_transform'[50:100,2], color="white", label="Versicolor"))
display(scatter!(i_transform'[100:150,1],i_transform'[100:150,2], color="red", label="Virginica"))