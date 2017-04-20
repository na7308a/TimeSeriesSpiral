##### EDIT SEARCH PARAMETERS BELOW
search_term <- "mongodb"
language <- "en"
sample_size <- 500
##### EDIT SEARCH PARAMETERS ABOVE

source('my_access.R')

# NEXT 4 LINES LOAD LIBRARIES OF FUNCTIONS
library(twitteR)
library(tm)
library(wordcloud)
library(RColorBrewer)

####### EDIT THE NEXT LINE TO SPECIFY SEARCH
tweets_raw = searchTwitter(search_term, n=sample_size, lang=language)
####### EDIT THE PREVIOUS LINE TO SPECIFY SEARCH

# NEXT TWO LINES REMOVES META-DATA THEN CONVERTS DATA TO A NEEDED FORMAT
tweets_text = sapply(tweets_raw, function(x) x$getText())
tweets_corpus = Corpus(VectorSource(tweets_text))

# NEXT LINE REMOVES SPECIAL CHARACTERS AVAILABLE IN OTHER LANGUAGES
tweets_transformed1 <- tm_map(tweets_corpus, 
                               content_transformer(function(x) iconv(x, to="UTF-8")))
# NEXT LINE CONVERTS EVERYTHING TO LOWER CASE
tweets_transformed2 <- tm_map(tweets_transformed1,
                              content_transformer(tolower))
# NEXT LINE REMOVES PUNCTUATION
tweets_transformed3 <- tm_map(tweets_transformed2,
                              removePunctuation)
# NEXT LINE REMOVES "STOPWORDS" LIKE "THE", "AN", "IS", "BE", ETC.
tweets_transformed4 <- tm_map(tweets_transformed3,
                              function(x) removeWords(x,stopwords()))
# NEXT LINE DRAWS WORD CLOUD
wordcloud(tweets_transformed4)
