library(twitteR)

Tweets = userTimeline("Chingakutty",n=200)

#To print the tweets all together with a soft wrap, run the following code.

for (i in 1:150){
	cat(paste("[[",i,"]]",sep=""))
	writeLines(strwrap(Tweets[[i]]$getText(),width=73))
}

#Building a data frame to store all the tweets from the users timeline
dataFrame <- do.call("rbind",lapply(Tweets,as.data.frame))

library(NLP)
library(tm)
library(RWeka)

#Creating a corpus consisting of collection of documents.
corpus= Corpus(VectorSource(dataFrame$text))

#Converting the words in the corpus to a lowercase and including lazy= TRUE argument to avoid an execution error.
corpus=tm_map(corpus, content_transformer(tolower),lazy=TRUE)

#Removing punctuation from the corpus.
corpus=tm_map(corpus, removePunctuation, lazy= TRUE)

#Removing numbers from the corpus
corpus=tm_map(corpus, removeNumbers,lazy=TRUE)

#Creating a function to remove the URL from the corpus.
removeURL=function(x) gsub("http[[:alnum:]]*","",x)
corpus=tm_map(corpus, removeURL,lazy=TRUE)

#Removing all the stopwords from the corpus.
corpus=tm_map(corpus,removeWords, stopwords("english"),lazy=TRUE)

#Stemming the document 
corpus=tm_map(corpus, stemDocument,lazy=TRUE)

corpus=tm_map(corpus,removeWords,c("the","it","and","then"))

#To wrap up the words in the documents, perform this 
for (i in 1:250) {
cat(paste("[[", i, "]] ", sep=""))
 writeLines(strwrap(corpus[[i]], width=73))}

#creating a DocumentTermMatrix
DTM=TermDocumentMatrix(corpus,control=list(wordLenghts=c(1,Inf)))

DTM -- TO view the terms

#Tp view the first six terms starting with csk 

idx = which(dimnames(DTM)$Terms == "csk")

inspect(DTM[idx+(0:15),10:110])

#Setting the wordlength to a minimum length of 1
DTM = TermDocumentMatrix(corpus, control=list(minWordLength=1))

#Finding the frequent terms in the tweets
findFreqTerms(DTM, lowfreq=10)

#Plotting the frequent terms using barplots

 library(ggplot2)

termFreq = rowSums(as.matrix(DTM))
termFreq = subset(termFreq, termFreq>=10)

qplot(names(termFreq), termFreq,col="blue", stat="identity",geom="bar",xlab="Terms used most")+ coord_flip()

#Finding associations for tweets 
findAssocs(DTM, "csk", 0.25)
#Output
                 csk
idhunammaseason 0.90
whistlepodu     0.54
cskvkxip        0.41


findAssocs(DTM, "dhoni", 0.25)
#Output
             dhoni
absolutely    0.40
bat           0.40
clobbered     0.40
expect        0.40
offsidethala  0.40
sheer         0.40
strike        0.40
thala         0.40
wastes        0.40
wins          0.40
wristy        0.40
dream         0.28
elected       0.28
gets          0.28
mark          0.28
massive       0.28
power         0.28






















# TEST code
corpus1= Corpus(VectorSource(dataFrame$text))
corpus1=tm_map(corpus1, content_transformer(tolower),lazy=TRUE)
corpus1=tm_map(corpus1, content_transformer (removePunctuation), lazy= TRUE)
corpus1=tm_map(corpus1, content_transformer (removeNumbers),lazy=TRUE)
corpus=tm_map(corpus1, content_transformer(removeURL),lazy=TRUE)
corpus1= Corpus(VectorSource(dataFrame$text))
corpus1=tm_map(corpus1, content_transformer(tolower),lazy=TRUE)
corpus1=tm_map(corpus1, content_transformer (removePunctuation), lazy= TRUE)
corpus1=tm_map(corpus1, content_transformer (removeNumbers),lazy=TRUE)
corpus1=tm_map(corpus1, content_transformer(removeURL),lazy=TRUE)
corpus1=tm_map(corpus1, content_transformer (stopwords("english")),lazy=TRUE)




