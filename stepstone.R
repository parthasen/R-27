
# Input
require(XML)

url <- "http://www.stepstone.de/5/ergebnisliste.html?an=facets&of=0&co=2692&stf=detailedSearch&li=25&fxe=true&fxa=true&thr=-1&ke=business%20intelligence&suid=2e577843-c49f-4167-8149-28c177603845"

# Need manual copy of Links into getHTML links
links <- getHTMLLinks(url)

# links herausfiltern nach "Stellenangebote" -> Muster nach Stellenangebote ist immer gleich
links <- links[grep("stellenangebote", links)]

ph <- "http://www.stepstone.de"

final <- paste(ph, links)

final <- gsub("[[:space:]]", "", final)

# generate number of sequences
sq <- seq(1,length(final), by=2)

# remove all generic company profiles
final <- final[-sq]

# creating empty list
source <- list()

# Processing test

for(i in 1:length(final)) 
{
source[[i]] <- readLines(final[i], encoding="UTF-8")
num <- grep("iframe", source[[i]])
source[[i]] <- source[[i]][num[1]:num[2]]

# Sonderzeichen
source[[i]] <- gsub("&auml;", "ä", source[[i]])
source[[i]] <- gsub("&Auml;", "Ä", source[[i]])
source[[i]] <- gsub("&ouml;", "ö", source[[i]])
source[[i]] <- gsub("&Ouml;", "Ö", source[[i]])
source[[i]] <- gsub("&uuml;", "ü", source[[i]])
source[[i]] <- gsub("&Uuml;", "Ü", source[[i]])
source[[i]] <- gsub("&szlig;", "ß", source[[i]])
source[[i]] <- gsub("&amp;", "&", source[[i]])

# Entfernen von HTML Sachen /HTML Editoren
source[[i]] <- gsub("&shy;", "", source[[i]])
source[[i]] <- gsub("&nbsp;", "", source[[i]])
}

# Capgemini only task

for(i in 1:length(source))
{
source[[i]] <- source[[i]][9]
source[[i]] <- gsub("Sie", "", source[[i]]) # Herausfiltern von Sie wegen space
source[[i]] <- gsub("In", "", source[[i]]) # Herausfiltern von Sie wegen space
}