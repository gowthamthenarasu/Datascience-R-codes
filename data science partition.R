acc<-c()
for(i in 1:500)
{
  print(i)
  ##Data Partition
  inTraininglocal<-createDataPartition(iris$Species,p=.85,list = F)
  training1<-iris[inTraininglocal,]
  testing<-iris[-inTraininglocal,]
  #Model building 
  fittree <- C5.0(training1$Species~., data=training1)
  #Predicting
  pred<-predict.C5.0(fittree,testing[,-5])
  a<-table(testing$Species,pred)
  #Accuracy
  acc<-c(acc,sum(diag(a))/sum(a))
}
summary(acc)
