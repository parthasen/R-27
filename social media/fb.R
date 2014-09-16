
# Initialize Rfacebook
require(Rfacebook)

# Temporary token generated from https://developers.facebook.com/tools/explorer 
token <- "CAACEdEose0cBAPMgq9tgeCJGQx18Bq0Ctrp6Aq4dRECCLuJRlXf64XbZBPnd4e11JzBZAA3WGDc7uWJadO7bI3ZBT1popmRMhztQZC7obtuDI9K1LXg0hwQRuYw6ocPZBR6JEE15H3ROid7ZAEbtEqMwGsbg4aAgYU7Hy8Mb3cruKxgPWSRC84GpOy0ZCCrhHl2zFCUUYzwZCWL5zWlmo8jh"

# infos about myself
me <- getUsers("datitran", token, private_info = TRUE)

# get my friends
my_friends <- getFriends(token, simplify = TRUE)

# looking how much male and female
my_friends_info <- getUsers(my_friends$id, token, private_info = TRUE)
table(my_friends_info$gender)  # gender

table(substr(my_friends_info$locale, 1, 2))  # language

table(substr(my_friends_info$locale, 4, 5))  # country

table(my_friends_info$relationship_status)["It's complicated"]  # relationship status

# get mutual friends
mat <- getNetwork(token, format = "adj.matrix")

# get page
page <- getPage("wespeakanalytics", token, n = 5000)

text <- page$message

# accounts
# wespeakanalytics
# deloitte
# KPMG
# pwcfanpage
# steriamummertconsulting
# Capgemini
# IBMbigdataanalytics
# tsystems.international
# Atos

# EY
# 195665063800329

