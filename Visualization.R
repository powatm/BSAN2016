library(gdata)
parks<-read.xls(file.choose(),stringsAsFactors=FALSE,sheet=1)
subways<-read.xls(file.choose(),stringsAsFactors=FALSE,sheet=1)
thefts<-read.xls(file.choose(),stringsAsFactors=FALSE,sheet=1)
taxis<-taxidata
bikes<-rbind(bikedata,`201601.citibike.tripdata`)

bikes$tripduration<-bikes$tripduration/60
bikes<-bikes[which(bikes$tripduration<24),]
boxplot(bikes$tripduration, main="Trip Duration (minutes)") #only of trips less than one day long

mod1<-lm(bikes$start.station.latitude~bikes$tripduration+bikes$birth.year+bikes$gender)
summary(mod1)
plot(resid(mod1))


mod2<-lm(bikes$start.station.longitude~bikes$tripduration+bikes$birth.year+bikes$gender)
summary(mod2)
plot(resid(mod2))

pcadata<-data.frame(bikes$start.station.latitude,bikes$tripduration,bikes$birth.year,bikes$gender)
pcadata<-na.omit(pcadata)
pca = prcomp(pcadata[-1], scale. = TRUE)
summary(pcadata[-1])
summary(pca)
screeplot(pca, type="lines")
pca_model<-lm(formula = (pcadata$bikes.start.station.latitude) ~ pca$x[, 1]+pca$x[,2])

summary(predict(pca_model))
summary((pcadata$bikes.start.station.latitude))
plot(resid(pca_model))
abline(0,0, col="red")
summary(pca_model)
plot(predictions, pcadata$bikes.start.station.latitude)
abline(0,1, col="red")

theta <- seq(0,2*pi,length.out = 100)
circle <- data.frame(x = cos(theta), y = sin(theta))
p <- ggplot(circle,aes(x,y)) + geom_path()
loadings <- data.frame(pca$rotation, 
                       .names = row.names(pca$rotation))
p + geom_text(data=loadings, 
              mapping=aes(x = PC1, y = PC2, label = .names, colour = .names)) +
  coord_fixed(ratio=1) +
  labs(x = "PC1", y = "PC2")
