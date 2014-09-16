library(XML)

#stopw <- readLines("data/stopwords.txt")
#stopw <- stopw[stopw != ""]

# URL of interest: 
url <- "http://www.ranks.nl/stopwords/german" 

# get all the tables 
table <- readHTMLTable(url) 

# here need "mps.tabs[[1]]" otherwise get a mistake in unlust
table <- table[[1]]

stopwords <- as.character(unlist(table))

stopwords <- stopwords[stopwords != ""]

# Deutsche Stopwörter
link <- readLines("http://www.webseiten.leicht.info/stopwords-deutsch.txt")

link <- link[-(1:10)]

link <- gsub("'", "", link)

link <- link[-(1002:length(link))]

stopwords <- link

stopwords <- stopwords[stopwords != ""]

# Andere Deutsche Stopwörter #  genutzt für Steria Mummert
link <- readLines("http://download.staticfloat.com/stopwords.php", encoding="UTF-8")

link <- gsub("\"", "", link)
link <- gsub("$stopwords[de][] = ", "", link, fixed = "TRUE")
link <- gsub(";", "", link, fixed = "TRUE")

link <- link[-(1:6)]

stopwords <- link

stopwords <- stopwords[stopwords != ""]