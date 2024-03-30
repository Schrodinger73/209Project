library(dplyr)
dat <- read.csv("data.csv")
load("country_finder.Rdata")
countries <- numeric(length(dat$City))
for (i in 1:length(dat$City)) {
  countries[i] <- find_country(dat$City[i])
}
dat$Countries <- countries
dat <- dat %>% filter(Countries != "Country not found")
write.csv(dat, "data_cleaned.csv")
