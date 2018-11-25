install.packages("twitteR")
library(twitteR)
library(rtweet)

##Access token
access_token = "36934417-OBOUgi8Pku5JGuFD7hX97EtXNyqez3V3ElXShOR"
access_secret = "5FIzBv6moy9HjeASUPGwLGZpB3I9HIFX1t8SoqPs"
consumer_key = "UV9jObYyf7sjDW33BdDvz5"
consumer_secret = "zC9P9XxR0n1jWQQDbH66ZCNqMdn3nckZHa7keCMOPrGUx1y"
#Access token with twitteR
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


##Using userTimeline
gitlab <- userTimeline('gitlabstatus', n = 200, includeRts = FALSE)
github <- userTimeline('githubstatus', n = 200, includeRts = FALSE)
travis <- userTimeline('traviscistatus', n = 200, includeRts = FALSE)

head(github)

##Using rwteet
create_token(
  access_token = "369387-OBOUgi8Pku5JGuFD7hX97EtXNyqez3V3ElXShOR",
  access_secret = "5FIzlM6moy9yVHjeASUPGwLGZpB3I9HIFX1t8SoqPs",
  consumer_key = "UV9jOf7srQ7jDW33BdDvz5",
  consumer_secret = "zC9PxR0ntru1jWQQDbH66ZCNqMdn3nckZHa7keCMOPrGUx1y"
)



##Using ##get_timeline 
git.lab <- get_timeline('@gitlabstatus', n = 200, include_rts = FALSE)
git.hub <- get_timeline('@githubstatus', n = 200, include_rts = FALSE)
tavis.new <- get_timeline('@traviscistatus', n = 200, include_rts = FALSE)


## Collecting relevant column
library(tidyverse)
git_lab_status <- git.lab %>%
  select(user_id, created_at, screen_name, text, reply_to_user_id, reply_to_screen_name,description, name)
git_hub_status <- git.hub %>%
  select(user_id, created_at, screen_name, text, reply_to_user_id, reply_to_screen_name,description, name)
travis_status <- tavis.status %>%
  select(user_id, created_at, screen_name, text, reply_to_user_id, reply_to_screen_name,description, name)

##Finding and removing data that's not required. Creating a uniques tweet of only the hashtags
gitlab_status <- git_lab_status[!complete.cases(git_lab_status$reply_to_user_id), ]

##travistatus
travis_status <- travis_status %>%
  select(text, user_id, screen_name, description, created_at)
##Gitlab status
gitlab_status <- gitlab_status %>%
  select(text, user_id, screen_name, description, created_at)
##Github status
github_status <- github_status %>%
  select(text, user_id, screen_name, description, created_at)

##Removing https, http, symbols and brackets, using regular expressions.
travis_text <- travis_status$text
gitlab_text <- gitlab_status$text
github_text <- github_status$text


##Starting cleaning the data 
library(stringr)
##Github status
github_status$text <- gsub("http.*","", github_status$text)
github_status$text <- gsub("https.*","", github_status$text)
github_status$text <- gsub("#.","", github_status$text)
github_status$text <- gsub("@*","", github_status$text)
github_status$text <- gsub("\n","", github_status$text)
github_status$text <- gsub("\"","", github_status$text)
github_status$text <- gsub("/","", github_status$text)

##Gitlab status
gitlab_status$text <- gsub("http.*", "", gitlab_status$text)
gitlab_status$text <- gsub("https.*", "", gitlab_status$text)
gitlab_status$text <- gsub("#.", "", gitlab_status$text)
gitlab_status$text <- gsub("@.*", "", gitlab_status$text)
gitlab_status$text <- gsub("\n", "", gitlab_status$text)
gitlab_status$text <- gsub("\"", "", gitlab_status$text)
gitlab_status$text <- gsub("/", "", gitlab_status$text)

##Travis labs
travis_status$text <- gsub("http.*", "", travis_status$text)
travis_status$text <- gsub("https.*", "", travis_status$text)
travis_status$text <- gsub("#.", "", travis_status$text)
travis_status$text <- gsub("@.", "", travis_status$text)
travis_status$text <- gsub("\n", "", travis_status$text)
travis_status$text <- gsub("\"", "", travis_status$text)


####
write.csv(gitlab_status, "C:/Users/Dennis/Documents/eHA/gitlab_status.csv")
write.csv(travis_status, "C:/Users/Dennis/Documents/eHA/travis_status.csv")
write.csv(github_status, "C:/Users/Dennis/Documents/eHA/github_status.csv")





























