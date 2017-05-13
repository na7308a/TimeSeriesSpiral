# TO GENERATE YOUR OWN TWEETS, COPY THIS FILE TO 'my_access.R' AND PUT IN YOUR PASSWORDS

consumer_key <- "encdvn1PZFZ14i9ebwPLYETC1"
consumer_secret <-"Ol15nVqraIKNCGoUU6xVAFa4Fif1pX6quch8lc7lkaH3cOqWLm"
access_token <-"4468075523-V3c54nHEPBVfTySxjA5ueCsPVE1FxTohwIy6KWo"
access_secret <-"PLgcDR3mOpI2GH4X4e8usQA4Vi8A6FBPFZToKhPMozr1O"

library(twitteR)
setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)