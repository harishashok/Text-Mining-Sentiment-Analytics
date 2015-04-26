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

corpus= Corpus(VectorSource(dataFrame$text))

