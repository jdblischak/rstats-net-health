install.packages("rtweet")

library(rtweet)

##Access  token
create_token(
  access_token = "xxxxxx",
  access_secret = "xxxxx",
  consumer_key = "xxxxx",
  consumer_secret = "xxxxx"
)

##Search tweets
gitstatus <- search_tweets("@githubstatus", n = 1500, include_rts = FALSE)
travicistatus <- search_tweets("@traviscistatus", n = 1500, include_rts = TRUE)
gitlabstatus <- search_tweets("@gitlabstatus", n = 1500)

##Cleaning the data
library(tidyverse)
colnames(gitstatus) ## getting the name of the column
gitstatus <- gitstatus %>%
  select(text, name, location, description) %>%
  glimpse()
travicistatus <- travicistatus %>%
  select(text, name, location, description) %>%
  glimpse()
gitlabstatus <- gitlabstatus %>%
  select(text, name, location, description) %>%
  glimpse

##Write in csv file
write.csv(gitlabstatus, "C:/Users/Dennis/Documents/eHA/gitlabstatus.csv")
write.csv(travicistatus, "C:/Users/Dennis/Documents/eHA/travicistatus.csv")
write.csv(gitstatus, "C:/Users/Dennis/Documents/eHA/gitstatus.csv")












