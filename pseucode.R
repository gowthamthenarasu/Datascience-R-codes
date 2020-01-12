install.packages("caret", dependencies = TRUE)
install.packages("randomForest")

library("caret")
library("randomForest")
model<-randomForest(iris$Species~.,data=iris,ntree=1000)


#Importance of the variable - Lower gini
print(model)
#Extract a single treee from a forest
#split var which  variable was used to split the node
#0 if the node  is terinal
#split point e=where  the best split is see detail for 
print(importance(model))

getTree(model)

pred<-predict(model,iris[,-5])

table(pred,iris$Species)

