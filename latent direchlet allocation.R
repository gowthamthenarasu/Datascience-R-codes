install.packages("tm")
library(tm)
library(devtools)

slam_url <- "https://cran.r-project.org/src/contrib/Archive/slam/slam_0.1-37.tar.gz"
install_url(slam_url)

install.packages("slam")
library(slam)

install.packages("topicmodels")
library(topicmodels)

x <- readLines("C:\\Users\\acer\\Desktop\\modi.txt")
mydata.corpus <- Corpus(VectorSource(x))
mydata.corpus <- tm_map(mydata.corpus, removePunctuation)
my_stopwords <- c(stopwords('english'),"brothers", "sisters", "the", "due", "are", "not", "for", "this", "and",  "that", "there", "new", "near", "beyond", "time", "from", "been", "both", "than",  "has","now", "until", "all", "use", "two", "ave", "blvd", "east", "between", "end", "have", "avenue", "before",    "just", "mac", "being",  "when","levels","remaining","based", "still", "off", "over", "only", "north", "past", "twin", "while","then")

mydata.corpus <- tm_map(mydata.corpus, removeWords, my_stopwords)

mydata.corpus <- tm_map(mydata.corpus, removeNumbers)

mydata.corpus <- tm_map(mydata.corpus, stripWhitespace)

## build a term-document matrix
mydata.tdm3 <- TermDocumentMatrix(mydata.corpus)
mydata.tdm3

# dtm <- as.DocumentTermMatrix(mydata.dtm3)
# dtm <- DocumentTermMatrix(mydata.corpus)
dtm <- t(mydata.tdm3)

#Display dtm
inspect(dtm)

rowTotals <- apply(dtm, 1, sum)
dtm.new   <- dtm[rowTotals > 0, ]

lda <- LDA(dtm.new, 5) # find 10 topics
term <- terms(lda, 20) # first 10 terms of every topic
term

