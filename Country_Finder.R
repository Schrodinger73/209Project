library(maps)

# Function to find the country of a city
find_country <- function(city_name) {
  # Load city to country mapping dataset
  data(world.cities)
  
  # Find the country of the city
  country <- world.cities$country[world.cities$name == city_name]
  
  if (length(country) > 0) {
    return(country)
  } else {
    return("Country not found")
  }
}

save(find_country, file = "country_finder.Rdata")
