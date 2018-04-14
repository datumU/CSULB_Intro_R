####################################################################################
### Linear Regression- Shell code from slides
####################################################################################
## Standard Normal Distribution
str(dnorm) # normal pdf
dnorm()

x <- seq(from = -3, to = 3, by = 0.05)
y <- 


str(rnorm) # generate random number from normal dist


str(pnorm) # normal CDF
 # Pr[X <= 0] = ?


##  One-Sample T-Test (Create Data)
set.seed(123)
oneSampData <- rnorm(100, mean = 0, sd = 1)



##  One-Sample T-Test ($H_0: \mu = 0$)
oneSampTest.0 <- t.test(oneSampData) 



## Load Data
prestige <- read.csv(file = here::here("data", "prestige_v2.csv"),
                     row.names=1)
str(prestige)
head(prestige)


## Another look at the scatterplot matrix
library(car)
scatterplotMatrix(prestige[,c("prestige","education","income","women")])


## Linear Regression - Fit the Model
myReg <- lm()


##  Linear Regression - Summary Contents
summary(myReg)


##  Linear Regression - Confidence Intervals
?confint
confint(myReg, parm='income', level=0.95)


##  Linear Regression - Adding Variables
boxplot(prestige ~ type, data = Prestige, col = "grey",
main = "Distribution of Prestige Score by Types",
xlab = "Occupation Types", ylab = "Prestige Score")

mod <- update()


##  Linear Regression - Comparing Models
formula(myReg)
formula(mod)



##  Linear Regression - Relevel a Factor
levels(prestige$type)
prestige$type <- 

mod <- update(myReg, ~ . + type)
summary(mod)


## Linear Regression - Stepwise Regression
null <- lm()  # most basic model, intercept only
full <- lm()  # saturated model, all predictors
step(null, scope=list(lower=null, upper=full), direction='forward')


##  Linear Regression - Diagnostics
par(mfrow = c(2, 2), oma = c(0, 0, 2, 0))
plot(myReg)


##  Linear Regression - Prediction
newData <- data.frame(education=13.2, income=12000, women=12)

