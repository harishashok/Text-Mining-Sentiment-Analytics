
library(RColorBrewer)

library(wordcloud)

mat=as.matrix(DTM)

wordFreq=sort(rowSums(mat),decreasing=TRUE)

set.seed(375)

grayLevels=gray((wordFreq+10)/(max(wordFreq)+10))

wordcloud(words= names(wordFreq), freq=wordFreq,min.freq=4,random.order=F,colors=grayLevels)



#ALTERNATIVE

m <- as.matrix(DTM)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)

pal <- brewer.pal(9, "BuGn")
pal <- pal[-(1:2)]

wordcloud(d$word,d$freq, scale=c(8,.3),min.freq=2,max.words=4000, random.order=F, rot.per=.15)
