####################################################################################
### EXERCISE 2 Solutions
### Author: Chris Galbraith
####################################################################################
### PART A ###
# A.1
load(here::here("data", "auto_mpg_v2.Rda"))

# A.2
linFit <- lm(mpg ~ hp, data=auto)
summary(linFit)

# A.3 
par(mfrow=c(2,2))
plot(linFit)


### PART B ###
# B.1 
quadFit <- update(linFit, ~ . + I(hp^2), data=auto)
summary(quadFit)

# B.2
par(mfrow=c(2,2))
plot(quadFit)

# B.3
anova(linFit, quadFit)

# B.4
par(mfrow=c(1,1))
plot(auto$hp, auto$mpg, pch=20, xlab="Horsepower", ylab="MPG")
abline(reg = linFit, col="red", lwd=2)
curve(predict(quadFit, data.frame(hp=x)), add=TRUE, col="blue", lwd=2)
legend("topright", legend=c("Linear Model", "Quadratic Model"), col=c("red","blue"), lty=1, lwd=2, bty="n")


### PART C ### 
# C.1
modelC1 <- lm(mpg ~ weight + model.yr, data=auto)
summary(modelC1)
par(mfrow=c(2,2)); plot(modelC1)
auto[c(330, 334, 333), ]  # look at potential outliers... top 3 mpg values
auto[52, c("mpg", "weight", "model.yr")]  # look at leverage point... heaviest vehicle

modelC2 <- lm(mpg ~ weight + I(weight^2) + model.yr, data=auto)
summary(modelC2)
par(mfrow=c(2,2)); plot(modelC2)
auto[c(330, 334, 396), c("mpg", "weight", "model.yr")]  # look at potential outliers... top 3 mpg values

anova(modelC1, modelC2)

finalModel <- lm(mpg ~ weight + I(weight^2) + model.yr + diesel, data=auto)
summary(finalModel)
par(mfrow=c(2,2)); plot(finalModel)
auto[c(330, 403, 119), ]  # look at potential outliers...
par(mfrow=c(1,1)); plot(auto$weight, auto$mpg, pch=20, xlab="Weight (lbs)", ylab="MPG", col=auto$diesel)

anova(modelC2, finalModel)

# C.2
missing.mpg <- auto[is.na(auto$mpg), ]
cbind(missing.mpg, fit=predict(finalModel, newdata = missing.mpg))
