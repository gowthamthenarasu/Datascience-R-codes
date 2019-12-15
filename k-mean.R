install.packages("plyr")
library(plyr)
x <-  runif(50) # generating 50 random numbers from uniform distribution(0,1)
y <-  runif(50) # generating 50 random numbers 
data <- cbind(x,y) 
plot(data)
km <- kmeans(data,7) #kmeans clustering - 4 clusters; k ~ sqrt(n/2)
km$centers
km$cluster
####################
install.packages("animation")
library(animation)
windows()
km <- kmeans.ani(data, 7)
###################
wss<-c()
for(i in 2:15) wss[i]<-sum(kmeans(data,centers = i)$withinss)
plot(1:15,wss,type = "b", xlab = "No of clusters",ylab = "Avg distance")
