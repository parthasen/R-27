#Twitter OAuth

#install.packages(c("devtools", "rjson", "bit64", "httr"))
 
#RESTART R session!
 
#library(devtools)
#install_github("twitteR", username="geoffjentry")

# Require twitterR package
library(twitteR)

# Intialize libraries
library(tm)
library(wordcloud)
library(SnowballC)
library(RColorBrewer)

# OAuth identification
api_key <- "95xZ9sphleYNxiQQZMJBfAtT3"
 
api_secret <- "ozj87Am2cFZxwzd0YBfhKNqOc1K2EnFAxn2P8QassMAY6m4lFI"
 
access_token <- "2154980634-IgmljvP7AAXLbud0xywgUPCrOOtW7pYSdHQ9jdu"
 
access_token_secret <- "fheYXLQjerxcwneDM7hfuOubpmt8TroOSwADI2pJKcglj"
 
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
