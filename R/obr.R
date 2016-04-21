install.packages('jsonlite')
install.packages('leaflet')
library('jsonlite')
library('leaflet')

get_latest_city_geojson <- function(city, dataframe=FALSE) {
  # Retrieve latest geoJSON of a city
  api_url <- paste('http://openbikes.co/api/geojson/', city, sep='')
  res <- fromJSON(api_url, simplifyVector = TRUE)
  if (dataframe) {
    features = as.data.frame(cbind(unlist(res$features$geometry$coordinates), unlist(res$features$geometry$type), unlist(res$features$properties$address), 
                                   unlist(res$features$properties$bikes), unlist(res$features$properties$lat), unlist(res$features$properties$lon),
                                   unlist(res$features$properties$name), unlist(res$features$properties$stands), unlist(res$features$properties$update),
                                   unlist(res$features$properties$status), unlist(res$features$properties$type)))
    colnames(features) = c('coordinates', 'type', 'address', 'bikes', 'lat', 'lon', 'name', 
                           'stands', 'update', 'type')
    return(features)
  } else {
      return(res)
    }
}

get_station_names <- function(city) {
  # Retrieve stations names of a city
  api_url <- paste('http://openbikes.co/api/stations/', city, sep='')
  res <- fromJSON(api_url)
  return(res)
}

get_cities_by_provider <- function(provider) {
  # Retrieve cities of a data provider
  api_url <- paste('http://openbikes.co/api/providers/', provider, sep='')
  res <- fromJSON(api_url)
  return(res)
}

get_cities_by_country <- function(country) {
  # Retrieve cities of a country
  api_url <- paste('http://openbikes.co/api/countries/', country, sep='')
  res <- fromJSON(api_url)
  return(res)
}

get_city_center <- function(city) {
  # Retrieve center of a city
  api_url <- paste('http://openbikes.co/api/centers/', city, sep='')
  res <- fromJSON(api_url)
  return(res)
}

get_city_update <- function(city) {
  # Retrieve the update time for a city
  api_url <- paste('http://openbikes.co/api/updates/', city, sep='')
  res <- fromJSON(api_url)
  return(res)
}

get_prediction <- function(city, station, timestamp) {
  # Retrieve the update time for a city
  station <- gsub(" ", "%20", station)
  api_url <- sprintf('http://openbikes.co/api/prediction/%s/%s/%d', city, station, timestamp)
  print(api_url)
  res <- fromJSON(api_url)
  return(res)
}

plot_city_stations <- function(city) {
  bikes_icon = makeIcon("bike_icon.png", iconWidth=20, iconHeight=13)
  center <- get_city_center(city)
  stations = get_latest_city_geojson(city, dataframe=TRUE)
  leaflet(data = stations) %>% setView(lng = center$center[2], lat = center$center[1], zoom = 12) %>% addTiles() %>%
    addMarkers(~lon, ~lat, icon=bikes_icon, popup = ~as.character(sprintf('<i>Stations</i> : <b>%s</b> <br> <i>Bikes</i> : %d <br> <i>Stands</i> : %d', name, bikes, stands)))
}
