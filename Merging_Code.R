
happiness <- read.csv("Happiness_cleaned.csv")
suicides <- read.csv("suicide_cleaned.csv")


#Adding up suicide numbers and normalizing, filtering out years
suicides <- suicides[suicides$year %in% c(2015,2016),]
suicide.2 <- suicides %>% group_by(country.year) %>% summarise(suicide.tot.normal = (sum(suicides_no)/sum(population))*1e6 , year = year[1], country = country[1])
happiness <- happiness[happiness$Year %in% c(2015,2016),]

happiness['Country.Year'] = paste(happiness$Country, happiness$Year, sep= "")
suicide.2 <- as.data.frame(suicide.2)
rownames(happiness) <- as.index(happiness$Country.Year)
rownames(suicide.2) <- suicide.2$country.year

Happiness_Suicides <- merge(happiness , suicide.2 , by = "row.names")

#including only relevant features
Happiness_Suicides <- Happiness_Suicides[,c('Row.names','Happiness.Rank','Happiness.Score','Economy..GDP.per.Capita.', 'Health..Life.Expectancy.' , 'suicide.tot.normal','Year',"Country" ,"continent")]
rownames(Happiness_Suicides) <- Happiness_Suicides[,1]
Happiness_Suicides <- Happiness_Suicides[,-1]


#Saving final
write.csv(Happiness_Suicides , file = "Happiness_Suicides.csv")
