library('jsonlite')
library('httr')


BASE_URL <- "http://api.openbikes.co/"

get_latest_geojson <- function(city) {
  url <- paste(BASE_URL, "geojson/", city, sep='')
  res <- fromJSON(url)
  return (res)
}

# res <- get_latest_geojson("toulouse")

get_countries <- function(provider) {
  url <- paste(BASE_URL, "countries/", sep='')
  res <- fromJSON(url)
  return (res)
}

res <- get_countries()
