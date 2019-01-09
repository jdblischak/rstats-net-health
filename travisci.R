# Query and assess the Twitter account @traviscistatus

# Functions --------------------------------------------------------------------

# Download latest tweet from @traviscistatus
get_tweet_travisci <- function() {
  tweet <- rtweet::get_timeline('traviscistatus', n = 1)
  stopifnot(nrow(tweet) == 1)
  text <- tweet[, "text"]
  return(text)
}

# Analyze text from @traviscistatus account to determine status
get_status_travisci <- function(text) {
  stopifnot(is.character(text), length(text) == 1)
  if (__) {
    return("success")
  } else if (___) {
    return("warning")
  } else if (___) {
    return("danger")
  } else {
    return(NA_character_)
  }
}

# Tests ------------------------------------------------------------------------

# Using actual tweets (see New_twitter_data/travis_status.csv)

# Resolved -> success
identical(get_status_travisci("[status] Resolved: This incident has been resolved."),
          "success")
identical(get_status_travisci("[status] Resolved: The issue has been resolved."),
          "success")
# Monitoring -> warning
identical(get_status_travisci("[status] Monitoring: We have caught up with the container build back log. "),
          "warning")
identical(get_status_travisci("[status] Monitoring: The backlog has cleared. We are monitoring the situation. "),
          "warning")
# Investigating -> danger
identical(get_status_travisci("[status] Investigating: We are continuing to investigate this issue."),
          "danger")
identical(get_status_travisci("[status] Investigating: We are seeing a significantly lower number of build requests from GitHub on both"),
          "danger")
# Identified -> danger
identical(get_status_travisci("[status] Identified: We have identified the source of status update delays and are working on a fix."),
          "danger")
identical(get_status_travisci("[status] Identified: The issue has been identified and a fix is being implemented."),
          "danger")
# Unclear -> NA_character_
identical(get_status_travisci("non standard message"), NA_character_)
identical(get_status_travisci("unclear what the status is"), NA_character_)
