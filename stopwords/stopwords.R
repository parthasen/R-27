library(XML)

#stopw <- readLines("data/stopwords.txt")
#stopw <- stopw[stopw != ""]

# URL of interest: 
url <- "http://dev.mysql.com/doc/refman/5.5/en/fulltext-stopwords.html" 

# get all the tables 
table <- readHTMLTable(url) 

# here need "mps.tabs[[1]]" otherwise get a mistake in unlust
table <- table[[1]]

stopwords <- as.character(unlist(table))

stopwords <- stopwords[stopwords != ""]