####################################################################################
### EXERCISE 1 Solutions
### Author: Chris Galbraith 
####################################################################################
### PART A - Data Input ###
# A.2
auto <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data-original")

# A.3
names(auto) <- c("mpg", "cyl", "disp", "hp", "weight", "acc", "model.yr", "origin", "name")

# A.4
auto$cyl <- factor(auto$cyl)
auto$name <- as(auto$name, "character")

# A.5
head(auto)


### PART B - Missing Values ###
# B.1
missing <- which(is.na(auto), arr.ind = TRUE)
missing

# B.2
auto[missing[,1], ]


### PART C - Sorting ###
# C.1
sort.index <- order(auto$mpg, decreasing = TRUE, na.last = NA)
auto.sorted <- auto[sort.index, ]

# C.2
head(auto.sorted, 5)

# C.3
tail(auto.sorted, 5)


### PART D - String Manipulation ###
# D.1
diesel.index <- grep("diesel", auto$name)
diesel.index

# D.2 
auto$diesel <- 0
auto$diesel[diesel.index] <- 1

# D.3
auto$diesel <- factor(auto$diesel)

# D.4
str(auto)

# D.5
save(auto, file=here::here("data", "auto_mpg_v2.Rda"))


####################################################################################
### EXERCISE 2 Solutions
### Author: Chris Galbraith
####################################################################################
### PART A ###
# A.1
load(here::here("data", "auto_mpg_v2.Rda"))

# A.2
summary(auto)

### PART B ###
# B.1
hist(auto$mpg, col = "grey", freq=FALSE, main = "Histogram of MPG", xlab = "MPG")

# B.2
lines(density(auto$mpg, na.rm=TRUE), col="red")

# B.3
abline(v = median(auto$mpg, na.rm=TRUE), col = "red", lwd = 2, lty=2)

### PART C ###
boxplot(mpg ~ cyl, data = auto, col = "grey",
        main = "Distribution of MPG by Number of Cylinders",
        xlab = "Cylinders", ylab = "MPG")

### PART D ###
library(car)
scatterplotMatrix(auto[,c("mpg", "cyl", "disp", "hp", "weight", "acc", "model.yr")])

