####################################################################################
### EXERCISE 1 Solutions
### Author: Chris Galbraith, Micah Jackson 
####################################################################################

### Part A: Data Input
auto <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data-original")
names(auto) <- c("mpg", "cyl", "disp", "hp", "weight", "acc", "model.yr", "origin", "name")

auto$cyl <- factor(auto$cyl)
auto$name <- as(auto$name, "character")

head(auto)
head(auto, n=10)


### Part B - String Manipulation

diesel.index <- grep("diesel", auto$name)
diesel.index

auto$diesel <- 0 # creates new column of all 0s
auto$diesel[diesel.index] <- 1 # assigns 1s to all autos with diesel in the name

auto$diesel <- as.factor(auto$diesel)

str(auto)

save(auto, file=here::here("data", "auto_mpg_v2.Rda"))
?save


### Part C

summary(auto)


### Part D

hist(auto$mpg, freq=FALSE, col = "grey", main = "Histogram of MPG", xlab = "MPG")

hist(auto$mpg, freq=FALSE, col = "grey", main = "Histogram of MPG", xlab = "MPG")
lines(density(auto$mpg, na.rm=TRUE), col=adjustcolor("red", .5))

hist(auto$mpg, freq=FALSE, col = "grey", main = "Histogram of MPG", xlab = "MPG")
lines(density(auto$mpg, na.rm=TRUE), col=adjustcolor("red", .5), main="Densities of Samp1 and Samp2", xlab="")
abline(v = median(auto$mpg, na.rm=TRUE), col = "red", lwd = 2, lty=2)


### Part E

# Several options for getting this answer. 
summary(auto)
# or 
summary(auto$cyl)
# or
unique(auto$cyl)

cylCounts <- table(auto$cyl)

boxplot(mpg ~ cyl, data = auto, col = ifelse(cylCounts < 5, 'red', 'blue'),
main = "Distribution of MPG by Number of Cylinders",
xlab = "Cylinders", ylab = "MPG")



### Part F

library(car)
scatterplotMatrix( auto[, c("mpg", "cyl", "disp", "hp", "weight", "acc", "model.yr")] )

