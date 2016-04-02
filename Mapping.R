library(ggplot2)
library(ggmap)
library(gdata)
dat<-read.xls(file.choose(),stringsAsFactors=FALSE,sheet=1)

# getting the map
mapgilbert <- get_map(location = c(lon = mean(dat$lat), lat = mean(dat$long)), zoom = 4,
                      maptype = "satellite", scale = 2)

# plotting the map with some points on it
ggmap(mapgilbert) +
  geom_point(data = df, aes(x = dat$long, y = dat$lat, fill = "red", alpha = 0.8), size = 5, shape = 21) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE)