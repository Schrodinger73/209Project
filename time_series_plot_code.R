suicide <- read.csv("suicide_cleaned.csv")

library(dplyr)

# Plotting all the time series plots
suicide.2 <- suicide %>% group_by(country.year) %>% summarise(suicide.tot.normal = (sum(suicides_no)/sum(population))*1e6 , year = year[1], country = country[1])

suicides <- split(suicide.2 , suicide.2$country)

unique(suicide$country)
summary(suicide)
time <- ts(data = suicides$Albania$suicide.tot.normal , start = min(suicides$Albania$year) , end = max(suicides$Albania$year))
time_series_plots <- c()

## all ts plots are stored by country name in time_series_plots object, save with write() if needed

for(i in unique(suicide$country)){
  
  data <- suicides[[i]]
  time <- ts(data = data$suicide.tot.normal , start = min(data$year) , end = max(data$year))
  plot.ts(time , xlab = "Year", ylab = "Suicide Rate Scaled" , main = i)
  plt <- recordPlot()
  time_series_plots[[i]] <- plt
  
}








