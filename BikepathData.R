bike_routes <- read.csv("~/Downloads/nyc_bike_routes_2015.csv")
View(nyc_bike_routes_2015)

install.packages('plyr')

library(plyr)
y = count(bike_routes, 'TOSTREET')
x = count(bike_routes, 'FROMSTREET')
write.csv(y, file = "bikeroutecount.csv")
write.csv(x, file = "bikeroutecount2.csv")


#taxi data
#library("ff")
#x<- read.csv.ffdf(file="~/Downloads/trip_data_1.csv", header=TRUE, VERBOSE=TRUE, first.rows=10000, next.rows=50000, colClasses=NA)

taxi_df <- read.csv(file="~/Downloads/trip_data_1.csv",nrows=1000000)
View(taxi_df)

theft_df <- read.csv(file="~/Downloads/Thefts2015.csv",nrows=1000000)
View(theft_df)

#bikes <- c("Bike", "Bicycle")
selectedRows <- theft_df[grep('(Bike|Bicycle)', theft_df$Complaint.Type), ]
View(selectedRows)
#grepl("Blocked Driveway", theft_df$Complaint.Type)

