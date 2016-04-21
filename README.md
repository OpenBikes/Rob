# Rob
:rainbow: R SDK for the OpenBikes API

# Functionalities

## Retrieve latest geoJSON of a city

```r
get_latest_city_geojson('Toulouse')
```

## Retrieve stations names of a city

```r
get_station_names('Paris')
```

## Retrieve cities of a data provider

```r
get_cities_by_provider('jcdecaux')
```

## Retrieve cities of a country

```r
get_cities_by_country('France')
```

## Retrieve center of a city

```r
get_city_center('Toulouse')
```

## Retrieve the update time for a city

```r
get_city_update('Toulouse')

```
## Retrieve the update time for a city

```r
get_prediction('Toulouse', '00003 - POMME', 1524176165)
```

## Plot city stations

![toulouse_stations](http://i.imgur.com/5Gqfu7N.gif)

```r
plot_city_stations('Toulouse')
```
