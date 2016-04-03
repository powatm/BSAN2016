library(ggplot2)
library(ggmap)
library(gdata)
dat<-normal[which(normal$Score<.3),]
dat<-dat[sample(1:nrow(dat), 50,replace=FALSE),]
mapgilbert <- get_map(location = c(mean(dat$Long), mean(dat$Lat)), zoom = 13,
                      maptype = "satellite", scale = 1)

# plotting the map with some points on it
ggmap(mapgilbert) +
  geom_point(data = dat, aes(x = dat$Long, y = dat$Lat, fill = "red", alpha = 0.8), size = 5, shape = 21) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE)

library(rgdal)         # for readOGR(...)
library(ggplot2)
library(RColorBrewer)  # for brewer.pal(...)

sample <- data.frame(Longitude=dat$dropoff_longitude,
                     Latitude =dat$dropoff_latitude)
setwd("C:/Users/powat/Documents/GitHub/BSAN2016")
library(ggmap)
mymap <- get_map(location = "New York", maptype = "roadmap", zoom=12)
ggmap(mymap, extent = "device") + geom_density2d(data = dat, aes(x = Longitude, y = Latitude), size = 0.3) + 
  stat_density2d(data = dat, 
                 aes(x = Longitude, y = Latitude, fill = ..level.., alpha = ..level..), size = 0.01, 
                 bins = 16, geom = "polygon") + scale_fill_gradient(low = "green", high = "red") + 
  scale_alpha(range = c(0, 0.3), guide = FALSE)
