library(countries)
Five <- read.csv("Happiness/2015.csv")
Six <- read.csv("Happiness/2016.csv")
Seven <- read.csv("Happiness/2017.csv")
Eight <- read.csv("Happiness/2018.csv")
Nine <- read.csv("Happiness/2019.csv")
colnames(Eight)[c(1, 2, 3, 4, 6)] <- c("Happiness.Rank", "Country", "Happiness.Score", "Economy..GDP.per.Capita.", "Health..Life.Expectancy.")
colnames(Nine)[c(1, 2, 3, 4, 6)] <- c("Happiness.Rank", "Country", "Happiness.Score", "Economy..GDP.per.Capita.", "Health..Life.Expectancy.")
#rbind(Five[c("Happiness.Rank", "Happiness.Score", "Economy..GDP.per.Capita.", "Health..Life.Expectancy.")], Six[c("Happiness.Rank", "Happiness.Score", "Economy..GDP.per.Capita.", "Health..Life.Expectancy.")], Seven[c("Happiness.Rank", "Happiness.Score", "Economy..GDP.per.Capita.", "Health..Life.Expectancy.")], Eight[c("Overall.rank", "Score", "GDP.per.capita", "Healthy.life.expectancy")], Nine[c("Overall.rank", "Score", "GDP.per.capita", "Healthy.life.expectancy")])
D <- rbind(Five[c("Country", "Happiness.Rank", "Happiness.Score", "Economy..GDP.per.Capita.", "Health..Life.Expectancy.")], Six[c("Country", "Happiness.Rank", "Happiness.Score", "Economy..GDP.per.Capita.", "Health..Life.Expectancy.")], Seven[c("Country", "Happiness.Rank", "Happiness.Score", "Economy..GDP.per.Capita.", "Health..Life.Expectancy.")], Eight[c("Country", "Happiness.Rank", "Happiness.Score", "Economy..GDP.per.Capita.", "Health..Life.Expectancy.")], Nine[c("Country", "Happiness.Rank", "Happiness.Score", "Economy..GDP.per.Capita.", "Health..Life.Expectancy.")])


Year <- c(numeric(length(Five$"Happiness.Rank")) + 2015, numeric(length(Six$"Happiness.Rank")) + 2016, numeric(length(Seven$"Happiness.Rank")) + 2017, numeric(length(Eight$"Happiness.Rank")) + 2018, numeric(length(Nine$"Happiness.Rank")) + 2019)
D <- cbind(Year, D)
D <- D[!D$Country %in% c("North Cyprus", "Kosovo", "Somaliland region", "Somaliland Region", "Northern Cyprus"),]

v <- country_info(countries = D$Country, fields = "continents")
Continent <- v$continents
D$Continent <- Continent
write.csv(D, "Happiness_cleaned.csv")
D
boxplot(Happiness.Score ~ Continent, data = D)
