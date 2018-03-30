library(ISLR)
data("Hitters")



library(caret)


Hitters <- Hitters[!is.na(Hitters$Salary),]

#inTrain <- createDataPartition(y=Hitters$Salary,                             p=0.75, list=FALSE)
#training <- Hitters[inTrain,]
#testing <- Hitters[-inTrain,]

featurePlot(x=training[,c("Hits","Years","HmRun","Runs")],
            y = training$Salary,
            plot="pairs")


modFit <- train(Salary ~ Years + Hits ,method="glm",data=Hitters)



modFit2 <- lm(Salary ~ Years + Hits, data=Hitters)

modFit3 <- train(Salary ~ Years + Hits ,method="glm", preProcess=c("center","scale"),data=Hitters)


pred <- predict(modFit)
sqrt(sum((pred - Hitters$Salary)^2))/260

pred <- predict(modFit2)
sqrt(sum((pred - Hitters$Salary)^2))/260

pred <- predict(modFit3)
sqrt(sum((pred - Hitters$Salary)^2))/260


plot(pred - Hitters$Salary)

##################

library(ggplot2)
ggplot(data=Hitters, aes(x=Hits, y=Salary, colour=Years)) +geom_point()

a <- predict(modFit2, newdata= data.frame(Years = 1, Hits = 66))