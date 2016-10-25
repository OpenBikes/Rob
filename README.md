# OBR
:ghost: R SDK for the OpenBikes API

# Updating to the latest version of OBR

1. Install the release version of `devtools` from CRAN with `install.packages("devtools")`

2. Follow the instructions below

* **Mac and Linux**

```r
require('devtools')
devtools::install_github("OpenBikes/obr")
library('obr')
```

# Functionalities

| **Function**              | **API Endpoint**                                          | **Description**                                                   |
|---------------------------|-----------------------------------------------------------|-------------------------------------------------------------------|
| `get_latest_geojson`    	| `GET /geojson/<string:city_slug>`                        		| Return the latest geojson file of a city.                      	|
| `get_countries`         	| `GET /countries`                                         		| Return the list of countries.                                  	|
| `get_metrics`           	| `GET /metrics`                                           		| Returns latest metrics.                                        	|
| `get_cities`            	| `GET /cities`                                            		| Return the list of cities.                                     	|
| `get_stations`          	| `GET /stations`                                          		| Return the list of stations.                                   	|
| `get_providers`         	| `GET /providers`                                         		| Return the list of providers                                   	|
| `get_updates`           	| `GET /updates`                                           		| Return the list of latest updates for each city.               	|
| `get_forecast`          	| `POST /forecast`                                         		| Return a forecast for a station at a given time.               	|
| `get_filtered_stations` 	| `POST /filtered_stations`                                		| Return filtered stations.                                      	|
| `get_closest_city`      	| `GET /closest_city/<float:latitude>/<float:longitude>`    	| Return the closest city for a given latitude and longitude.    	|
| `get_closest_station`   	| `GET /closest_station/<float:latitude>/<float:longitude>` 	| Return the closest station for a given latitude and longitude. 	|

# Usage

## Get some API metrics

```r
metrics <- get_metrics()
```

## Retrieve latest geoJSON of a city

```r
geojson <- get_latest_geojson(city="toulouse")
```

## Retrieve stations names of a city

```r
stations <- get_stations(city_slug="toulouse")
```

## Retrieve cities of a data provider

```r
cities <- get_cities(provider="jcdecaux")
```

## Retrieve cities of a country

```r
cities <- get_cities(country="France")
```

## Retrieve a data provider of a country

```r
providers <- get_providers(country="France")
```


## Retrieve countries covered by a data provider

```r
countries <- get_countries(provider="keolis")
```

## Retrieve the update time for a city

```r
updates <- get_updates(city_slug="Toulouse")

```
## Making forecast

```r
forecast <- get_forecast(city_slug='toulouse', station_slug="00003-pomme", kind="bikes", moment="1477398413.144025")
```

## Retrieve closest city
```r
closest_city <- get_closest_city(43.556982, 1.466525)
```

## Retrieve closest station
```r
closest_station <- get_closest_station(43.556982, 1.466525)
```