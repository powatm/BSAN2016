bike_routes <- read.csv("~/Downloads/nyc_bike_routes_2015.csv")
View(nyc_bike_routes_2015)

install.packages('plyr')

library(plyr)
y = count(bike_routes, 'TOSTREET')
x = count(bike_routes, 'FROMSTREET')
write.csv(y, file = "bikeroutecount.csv")
write.csv(x, file = "bikeroutecount2.csv")
