mlr<-lm(MPG~HP+VOL+SP+WT,data=Cars)
summary(mlr)
pairs(Cars)
#Regression model and summary()
model.car<-lm(MPG~HP+VOL+SP+WT,data=Cars)
summary(model.car)
#Diagonstic plots
#residuals(plots,QQ-plos,STD.Resister)
plot(model.car)
#Residuals vs Regressors
car::residualPlots(model.car)
#Added Variable
car::avPlots(model.car)
#QQ plots of sudentized resisduals
car::qqPlot(model.car)
#Deletion Diagonostic
influence.measures(model.car)
car::influenceIndexPlot(model.car)



