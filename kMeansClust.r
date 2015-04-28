 #Performing a transpose of a matrix
 mat3= t(mat2)

set.seed(122)

#Assigning 8 clusters
k=8

#Performaing the Kmeans clusterng technique
kMeans= kmeans(mat3,k)

round(kMeans$centers,digits=3)
    baz   csk     cskvkxip   get  good great  idhunammaseason  just lions  luck match   now
1 0.111   0.778    0.111    0.000 0.000 0.000     0.778       0.000 0.000 0.111 1.111 0.333
2 0.049   1.000    0.000    0.000 0.098 0.049     1.000       0.098 0.000 0.049 0.000 0.024
3 0.127   0.984    1.000    0.079 0.111 0.111     1.000       0.079 0.365 0.063 0.016 0.143
4 0.000   1.000    0.438    0.062 0.062 0.062     1.000       0.000 0.312 0.000 0.062 0.125
5 0.000   0.000    0.000    0.000 0.042 0.000     0.000       0.042 0.000 0.083 0.000 0.083
6 0.000   0.120    0.000    0.200 0.000 0.080     0.000       0.080 0.200 0.040 0.000 0.040
7 0.045   1.000    0.000    0.045 0.227 0.091     1.000       0.000 1.045 0.000 0.091 0.045
8 0.000   0.000    0.000    0.000 0.000 0.000     0.000       0.000 0.500 0.250 0.250 0.000
  overs raina   rcbtweets super  time whistlepodu whistles
1 0.111 0.222     0.000   0.444 0.111       0.889    0.000
2 0.000 0.220     0.146   0.000 0.000       1.024    0.024
3 0.095 0.063     0.000   0.063 0.000       1.000    0.111
4 0.062 0.125     0.000   0.062 1.062       1.000    0.062
5 0.042 0.000     0.083   0.000 0.000       1.000    0.000
6 0.040 0.200     0.120   0.000 0.080       0.000    0.000
7 0.136 0.091     0.045   0.091 0.000       1.000    0.182
8 0.000 0.000     0.000   1.000 0.000       0.500    0.000

# For easier interpretation of the above stats we can use this function below
for(i in 1:k){
     cat(paste("cluster", i , ": ",sep=""))
     s = sort(kMeans$centers[i,], decreasing=T)
      cat(names(s)[1:3], "\n")
     # print the tweets of every cluster
     # print(rdmTweets[which(kMeans$cluster==i)])
}

#RESULT
cluster1: match whistlepodu csk 
cluster2: whistlepodu csk idhunammaseason 
cluster3: cskvkxip idhunammaseason whistlepodu 
cluster4: time csk idhunammaseason 
cluster5: whistlepodu luck now 
cluster6: get lions raina 
cluster7: lions csk idhunammaseason 
cluster8: super lions whistlepodu 
