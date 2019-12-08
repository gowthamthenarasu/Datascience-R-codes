#Cars
mlr<-lm(MPG~HP+VOL+SP+WT,data=Cars)
summary(mlr)
regclass::VIF(mlr)
MASS::stepAIC(mlr,direction = "both")
