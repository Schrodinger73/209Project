library(countries)
suicide <- read.csv("suicide.csv")
v <- country_info(countries = suicide$country, fields = "continents")
continent <- v$continents
suicide$continent <- continent
write.csv(suicide, file = "suicide.csv")