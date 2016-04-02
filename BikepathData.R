bike_routes <- read.csv("~/Downloads/nyc_bike_routes_2015.csv")
View(nyc_bike_routes_2015)

install.packages('plyr')

library(plyr)
y = count(bike_routes, 'TOSTREET')
write.csv(y, file = "bikeroutecount.csv")