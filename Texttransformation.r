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

#
