# Query and assess the GitHub API

# Functions --------------------------------------------------------------------

# Query the status of the GitHub API
# https://status.github.com/api
# https://status.github.com/api/status.json
query_github_api <- function() {
  request <- httr::GET("https://status.github.com/api/status.json")
  response <- httr::content(request)
  return(response$status)
}

# Determine the status of GitHub based on result of API query
get_status_github <- function(text) {
  stopifnot(is.character(text), length(text) == 1)
  if (text == "good") {
    return("success")
  } else if (text == "minor") {
    return("warning")
  } else if (text == "major") {
    return("danger")
  } else {
    return(NA_character_)
  }
}

# Tests ------------------------------------------------------------------------

identical(get_status_github("good"), "success")
identical(get_status_github("minor"), "warning")
identical(get_status_github("major"), "danger")
identical(get_status_github("nonsense"), NA_character_)
