library('rjson')
library('jsonlite')
library('httr')


BASE_URL <- "http://api.openbikes.co"

# TODO: Turn API errors into R errors
# TODO: Automatic way to include all function kwargs to endpoint args

snake_case <- function(text) {
  return (sub(pattern = "\\.", replacement = "_", x = text, ignore.case = T))
}

get_latest_geojson <- function(city=NULL) {
  # Return the latest geojson file of a city.
  
  if (is.null(city)) {
    stop('No city name supplied.')
  }
  url <- sprintf("%s/geojson/%s", BASE_URL, city)
  
  response <- jsonlite::fromJSON(url, flatten=TRUE)
  colnames(response$features) <- snake_case(colnames(response$features))
  return (response)
}

get_countries <- function(provider=NULL) {
  # Return the list of countries.
  
  url <- sprintf("%s/countries", BASE_URL)
  
  if (!is.null(provider)) {
    url <- sprintf("%s?provider=%s", url, provider)
  }
  
  response <- GET(url)
  if (http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  
  return (unlist(jsonlite::fromJSON(content(response, "text"), simplifyVector = FALSE)))
}

get_providers <- function(country=NULL) {
  # Return the list of providers.
  
  url <- sprintf("%s/providers", BASE_URL)
  
  if (!is.null(country)) {
    url <- sprintf("%s?country=%s", url, country)
  }
  
  response <- GET(url)
  if (http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  
  return (unlist(jsonlite::fromJSON(content(response, "text"), simplifyVector = FALSE)))
}

get_metrics <- function() {
  # Returns latest metrics.
  
  url <- sprintf("%s/metrics", BASE_URL)
  
  response <- GET(url)
  if (http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  
  return (jsonlite::fromJSON(content(response, "text"), simplifyVector = FALSE))
}

get_cities <- function(slug=NULL, country=NULL, provider=NULL, predictable=NULL, active=NULL) {
  # Return the list of cities.
  
  url <- sprintf("%s/cities", BASE_URL)
  print(as.list(match.call()))
  
  if (!is.null(slug)) {
    url <- paste(url, "?slug=", slug, sep='')
  }
  if (!is.null(country)) {
    url <- paste(url, "?country=", country, sep='')
  }
  if (!is.null(provider)) {
    url <- paste(url, "?provider=", provider, sep='')
  }
  if (!is.null(predictable)) {
    url <- paste(url, "?predictable=", predictable, sep='')
  }
  if (!is.null(active)) {
    url <- paste(url, "?active=", active, sep='')
  }
  
  response <- GET(url)
  if (http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  
  return (jsonlite::fromJSON(content(response, "text"), flatten=TRUE))
}

get_updates <- function(city_slug=NULL) {
  # Return the list of latest updates for each city.
  
  url <- sprintf("%s/updates", BASE_URL)
  
  if (!is.null(city_slug)) {
    url <- sprintf("%s?city_slug=", city_slug)
  }
  
  response <- GET(url)
  if (http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  
  return (jsonlite::fromJSON(content(response, "text"), flatten=TRUE))
}

get_stations <- function(slug=NULL, city_slug=NULL) {
  # Return the list of stations.
  
  url <- sprintf("%s/stations", BASE_URL)
  
  if (!is.null(slug)) {
    url <- paste(url, "?slug=", slug, sep='')
  }
  if (!is.null(city_slug)) {
    url <- paste(url, "?city_slug=", city_slug, sep='')
  }
  
  response <- GET(url)
  
  if (http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  
  return (jsonlite::fromJSON(content(response, "text"), flatten=TRUE))
}

get_forecast <- function(city_slug=NULL, station_slug=NULL, kind=NULL, moment=NULL) {
  # Return a forecast for a station at a given time.
  
  # FIX: POST JSON data
  url <- sprintf("%s/forecast", BASE_URL)
  
  body <- jsonlite::toJSON(list(city_slug=city_slug, station_slug=station_slug, kind=kind, moment=moment))
  print(typeof(body))
  
  response <- POST(url, body=body, encode="json")
  print(response)
  if (http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  
  return (jsonlite::fromJSON(content(response, "text"), flatten=TRUE)) 
}

get_closest_city <- function(latitude=NULL, longitude=NULL) {
  # Return the closest city for a given latitude and longitude.
  
  if (is.null(latitude) | is.null(longitude)) {
    stop("latitude and longitude are required.", call. = FALSE)
  }
  url <- sprintf("%s/closest_city/%s/%s", BASE_URL, latitude, longitude)
  
  response <- GET(url)
  
  if (http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  
  return(jsonlite::fromJSON(content(response, "text"), flatten=TRUE))
}

get_closest_station <- function(latitude=NULL, longitude=NULL) {
  # Return the closest station for a given latitude and longitude.
  
  if (is.null(latitude) | is.null(longitude)) {
    stop("latitude and longitude are required.", call. = FALSE)
  }
  url <- sprintf("%s/closest_station/%s/%s", BASE_URL, latitude, longitude)
  
  response <- GET(url)
  
  if (http_type(response) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  
  return(jsonlite::fromJSON(content(response, "text"), flatten=TRUE))
}


geojson <- get_latest_geojson(city="toulouse")
countries <- get_countries(provider="keolis")
providers <- get_providers(country="France")
metrics <- get_metrics()
updates <- get_updates()
cities <- get_cities(country="France")
stations <- get_stations(city_slug="toulouse", slug="00189-muret-boutinon")
closest_city <- get_closest_city(43.556982, 1.466525)
closest_station <- get_closest_station(43.556982, 1.466525)
forecast <- get_forecast(city_slug='toulouse', station_slug="00003-pomme", kind="bikes", moment="1477398413.144025")

