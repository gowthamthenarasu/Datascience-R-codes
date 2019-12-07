NewspaperData

mymodel<-lm(sunday~daily,data=NewspaperData)
summary(mymodel)

pred<-predict(mymodel,newdata = data.frame(daily=350))
pred
