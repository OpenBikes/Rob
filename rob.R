require(jsonlite)

get_latest_city_geojson <- function(city) {
  # Retrieve latest geoJSON of a city
  url <- paste('http://openbikes.co/api/geojson/', city, sep='')
  res <- fromJSON(url)
  return(res)
}

get_station_names <- function(city) {
  # Retrieve stations names of a city
  url <- paste('http://openbikes.co/api/stations/', city, sep='')
  res <- fromJSON(url)
  return(res)
}

get_cities_by_provider <- function(provider) {
  # Retrieve cities of a data provider
  url <- paste('http://openbikes.co/api/providers/', provider, sep='')
  res <- fromJSON(url)
  return(res)
}

get_cities_by_country <- function(country) {
  # Retrieve cities of a country
  url <- paste('http://openbikes.co/api/countries/', country, sep='')
  res <- fromJSON(url)
  return(res)
}

get_city_center <- function(city) {
  # Retrieve center of a city
  url <- paste('http://openbikes.co/api/centers/', city, sep='')
  res <- fromJSON(url)
  return(res)
}

get_city_update <- function(city) {
  # Retrieve the update time for a city
  url <- paste('http://openbikes.co/api/updates/', city, sep='')
  res <- fromJSON(url)
  return(res)
}

get_prediction <- function(city, station, timestamp) {
  # Retrieve the update time for a city
  station <- gsub(" ", "%20", station)
  url <- sprintf('http://openbikes.co/api/prediction/%s/%s/%d', city, station, timestamp)
  print(url)
  res <- fromJSON(url)
  return(res)
}

get_latest_city_geojson('Toulouse')
get_station_names('Paris')
get_cities_by_provider('jcdecaux')
get_cities_by_country('France')
get_city_center('Toulouse')
get_city_update('Toulouse')
get_prediction('Toulouse', '00003 - POMME', 1524176165)

