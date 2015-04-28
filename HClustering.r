
#Sparse terms have to be reomved so that the cluster is not populated with words
DTM1=removeSparseTerms(DTM,sparse=0.95)

mat2=as.matrix(DTM1)

#The distance between the terms is calculated using the dist()
distMat=dist(scale(mat2))

fit=hclust(distMat,method="ward")
The "ward" method has been renamed to "ward.D"; note new "ward.D2"
fit=hclust(distMat,method="ward.D2")

#Plotting the cluster
plot(fit)

rect.hclust(fit,k=10)
(groups=cutree(fit,k=10))
#OUTPUT
          baz             csk        cskvkxip             get            good 
              1               2               3               4               1 
          great idhunammaseason            just           lions            luck 
              1               2               4               5               6 
          match             now           overs           raina       rcbtweets 
              7               8               1               9               6 
          super            time     whistlepodu        whistles 
              7               8              10               1 



#ClusterPLOT.png output for cluster
