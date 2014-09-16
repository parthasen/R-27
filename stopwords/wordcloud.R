accenture <- readLines("data/accenture.txt")
accenture <- paste(accenture, collapse = " ")
accenture <- gsub("Big Data", "bigdata", accenture)
accenture <- gsub("big data", "bigdata", accenture)
accenture <- gsub("Supply Chain", "supplychain", accenture)
accenture <- gsub("supply chain", "supplychain", accenture)
accenture <- gsub("real-time", "realtime", accenture)
accenture <- gsub("Real-Time", "realtime", accenture)
accenture <- gsub("real time", "realtime", accenture)

library(tm)

doc.vec <- VectorSource(accenture)
doc.corpus <- Corpus(doc.vec)

doc.corpus <- tm_map(doc.corpus, tolower)
# Remove puncuation
doc.corpus <- tm_map(doc.corpus, removePunctuation)
# Remove numbers
doc.corpus <- tm_map(doc.corpus, removeNumbers)
# Remove common English stopwords
my_words <- c("many", "one", "may", "make", "next", "example", "percent", "expanded", "just", "use", "will","can", "now", "new", "need","also", "way"
	,"decisions","create", "way", "using", "large", "every", "time")

doc.corpus <- tm_map(doc.corpus, removeWords, c(stopwords("en"),my_words))

library(SnowballC)

doc.corpus <- tm_map(doc.corpus, stemDocument)

# All of the transformations have resulted in a lot of whitespace, which is then removed

doc.corpus <- tm_map(doc.corpus, stripWhitespace)

# Now we are done with the text processing
# Need to turn our corpus into a Term Document Matrix (TDM) which
# reflects the number of times each word in the corpus is found in each of the document
# e.g. if rabbit, rabbit means rabbit: 2

# Transformation into plaintextdocument as tdm wouldnt work due to lowercase ??? look again why

doc.corpus <- tm_map(doc.corpus, PlainTextDocument)

# Now turn it into TDM

TDM <- TermDocumentMatrix(doc.corpus)

findFreqTerms(TDM, 100)

library(wordcloud)

# define tdm as matrix
m = as.matrix(TDM)
# get word counts in decreasing order
word_freqs = sort(rowSums(m), decreasing=TRUE) 
# create a data frame with words and their frequencies
dm = data.frame(word=names(word_freqs), freq=word_freqs)

wordcloud(dm$word, dm$freq, random.order=FALSE, colors=brewer.pal(8, "Dark2"), max.words=50)


library("slam")
head(sort(col_sums(TDM), decreasing = TRUE))
