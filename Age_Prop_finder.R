library(rvest)
html <- read_html("https://en.wikipedia.org/wiki/List_of_countries_by_age_structure")
dat.table <- html%>%html_table()
country.table <- dat.table[[1]]
write.csv(country.table, "Age_Proportions.csv")