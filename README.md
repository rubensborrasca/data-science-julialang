# Usando a linguagem Julia para Data Science

Demonstração de alguns projetos simplificados de Data Science, utilizando a linguagem [Julia Lang](https://julialang.org/).

## Por que Julia?

Julia  é uma linguagem de programação criada para, na teoria, juntar a simplicidade de sintaxe do _Python_ com a rapidez de processamento da linguagem C.

Baseado nesta descrição, fica quase que explícito a sua aplicação em projetos relacionados à _Big Data_. Conjuntos grandes de dados acabam gerando lentidão nos _softwares_ em _Python_, mas também são muito complexos para serem "traduzidos" para C. Entra em ação, então, a linguagem Julia.

## 1º Exemplo: Algoritmo K-Means

_K-Means_ é um algoritmo de classificação, que busca procurar centróides em conjuntos de dados, para agrupá-los em _clusters_. É muito utilizado na indústria, como por exemplo para agrupar emails entre **spam** e **não-spam**; Construir sistemas de recomendação de músicas, dividindo entre **recomendadas** e **não-recomendadas**; Analisando dados de pacientes, para determinar se o seu estado de saúde é **infectado** ou **saudável**, entre outras aplicações.

Para o teste deste algoritmo, foi usada a biblioteca _RDatasets_, que contém alguns conjuntos de dados prontos para uso e estudo. O deste caso, é um simples conjunto de 2 variáveis e 3 _clusters_, criado justamente para melhor estudo e caracterização de algoritmos classificatórios. Os dados estão ilustrados na figura abaixo:

![data_1.png](https://raw.githubusercontent.com/rubensborrasca/data-science-julialang/master/graphs/data_1.png)

Para o algoritmo, o primeiro passo é estabelecer um "chute" inicial de onde estão os centróides (ou centros) dos 3 _clusters_. Após, estes 3 pontos são passados para a função _kmeans_ dentro do programa, que realiza um _fit_, readequando as centróides de acordo com os dados. Então, através da função _assignments_, cria-se uma nova coluna no _dataset_, que indica a qual _cluster_ cada observação do conjunto pertence. Pode-se observar o resultado do algoritmo na figura abaixo:

![k-means.png](https://raw.githubusercontent.com/rubensborrasca/data-science-julialang/master/graphs/k-means.png)

## 2º Exemplo: Principal Component Analysis

A Análise de Componente Principal, ou **PCA** (_Principal Component Analysis_) é um método de redução de dimensionalidade. Isso é útil na abordagem de problemas com alto número de variáveis. 

O algoritmo permite uma redução no número de variáveis do problema, analisando a importância que cada uma destas variáveis têm no resultado final.

Importante salientar que este método não funciona para qualquer problema. Existem casos onde todas as variáveis possuem importância semelhante. Por exemplo, consideremos 2 funções, _f(x,y,z) = x³ + y_ e _g(x,y,z) = x + y + z_. Na função _f_, a variável _z_ nem é relevante para o problema. Excluí-la, portanto, não influenciaria em nada no resultado final. Já na função _g_, por exemplo, talvez excluir qualquer uma das variáveis seja errado, visto que todas possuem o mesmo peso na equação.

Como exemplo de aplicação deste método, utilizei o famoso conjunto de dados _iris_, presente em diversas plataformas na internet. Retirei os dados novamente da biblioteca _RDatasets_, que já possui o conjunto _iris_ instalado dentro dela.

Este conjunto possui 4 variáveis, sendo elas: tamanho da pétala da flor, largura da pétala da flor, tamanho da sépala e largura da sépala.

É interessante reduzir a dimensionalidade do _dataset_ para que possamos visualizar melhor o conjunto de dados. Não conseguimos construir um gráfico utilizando 4 variáveis, mas 2 sim. Então procurei reduzir a dimensionalidade deste problema de 4 para 2.

Utilizando a função _fit_, e passando como entrada o _dataset_, o algoritmo extrai as 2 componentes principais. Ao final, ele dá uma noção de quanto do sinal foi perdido reduzindo a dimensionalidade do sistema. No caso deste estudo, preservou-se cerca de 98% do sinal.

Com apenas 2 variáveis, pode-se _plotar_ os dados, como na figura abaixo:

![PCA.png](https://raw.githubusercontent.com/rubensborrasca/data-science-julialang/master/graphs/PCA.png)