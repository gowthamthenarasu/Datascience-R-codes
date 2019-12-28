-3/5*(log2(3/5)-2)/5*(log2(2/5))
-3/4*(log2(3/4))-1/4*(log2(1/4))
data("iris")
#########33333
library(caret)
library(C50)

inTraininglocal<-createDataPartition(iris$Species,p=.75,list = F)
training<-iris[inTraininglocal,]
testing<-iris[-inTraininglocal,]
#Model Building
model<-C5.0(training$Species~.,data = training) #Trials- Boosting parameter

#Generate the model summary
summary(model)
#Predict for test data set
pred<-predict.C5.0(model,testing[,-5])
a<-table(testing$Species,pred)
sum(diag(a))/sum(a)
################
data("iris")
#install.packages("caret")
#install.packages("C50")
library(caret)
library(C50)

inTraininglocal<-createDataPartition(iris$Species,p=.75,list = F)
training<-iris[inTraininglocal,]
testing<-iris[-inTraininglocal,]
#Model Building
model<-C5.0(training$Species~.,data = training,trials=1000) #Trials- Boosting parameter

#Generate the model summary
summary(model)
#Predict for test data set
pred<-predict.C5.0(model,testing[,-5])
a<-table(testing$Species,pred)
sum(diag(a))/sum(a)




