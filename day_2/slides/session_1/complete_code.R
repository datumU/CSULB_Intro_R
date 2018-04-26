####################################################################################
### Exploratory Data Analysis - Minimal and complete code from slides 
### Author: Chris Galbraith, Micah Jackson
####################################################################################

install.packages('vioplot', dependencies=TRUE)
library(vioplot)

## Data Frame Review
myDF <- data.frame(names=c('Albert', 'Bianca', 'Cat'), height=c(71, 57, 64), female=c(0,1,1))


## str()
str(mean)
str(matrix)
str(sample)


## str()
str(myDF)

prestige <- read.table(file = here::here("data", "prestige_v2.csv"), 
                       sep=",", 
                       header=TRUE, 
                       row.names=1)
str(prestige)


## 5 number summary
summary(prestige)


## boxplots
boxplot(prestige$prestige)
boxplot(prestige$prestige, horizontal=TRUE)
boxplot(prestige$prestige, horizontal=TRUE, xlab='Prestige Scores')


## Histograms
hist(prestige$prestige)
hist(prestige$prestige, freq = FALSE)
hist(prestige$prestige, freq = FALSE, 
  col = "grey")
hist(prestige$prestige, freq = FALSE, 
     col = "grey",
     main = "Histogram of Prestige Score",
     xlab = "Prestige Score")


## Histogram with overlaid density 
hist(prestige$prestige, freq=FALSE, col = "grey", main = "", xlab = "Prestige Score", ylim=c(0,0.022))
lines(density(prestige$prestige, bw='nrd0'), col = "red", lwd = 2)
lines(density(prestige$prestige, bw='SJ'), col = "green", lwd = 2)
lines(density(prestige$prestige, bw=0.5), col = "blue", lwd = 2)
lines(density(prestige$prestige, bw=5), col = "purple", lwd = 2)


## Violin Plots
vioplot(prestige$prestige)
vioplot(prestige$prestige, horizontal=TRUE, col='dodgerblue2',
  names='Prestige Scores')


## Overlay histograms
pp <- prestige$prestige
hist(pp[prestige$type=='bc'], breaks=10, main='Histograms of Prestige Scores by Job Type',
  xlab='Prestige Scores', col='dodgerblue2')
hist(pp[prestige$type=='wc'], breaks=10, col='green')
hist(pp[prestige$type=='prof'], breaks=10, col='purple')

hist(pp[prestige$type=='bc'], breaks=10, main='Histograms of Prestige Scores by Job Type',
  xlab='Prestige Scores', col=adjustcolor('dodgerblue2',.4), xlim=c(0,100))
hist(pp[prestige$type=='wc'], breaks=10, col=adjustcolor('green', .4), add=TRUE)
hist(pp[prestige$type=='prof'], breaks=10, col=adjustcolor('purple', .4), add=TRUE)


## Adding lines
abline(v=mean(pp[prestige$type=='bc']), lwd=2, col='dodgerblue2')
abline(v=mean(pp[prestige$type=='wc']), lwd=2, col='green')
abline(v=mean(pp[prestige$type=='prof']), lwd=2, col='purple')


## Adding legends
legend("topright", legend = c("BC", "WC", "PROF"),
  col = c("dodgerblue2", "green", "purple"), lty = 1, lwd = 2, bty = "n")


## Grouped Violin plots
vioplot(pp[prestige$type=='bc'], pp[prestige$type=='wc'], pp[prestige$type=='prof'],
  horizontal=TRUE, names=c('BC', 'WC', 'PROF'))

## Scatterplots
plot(x = prestige$education, y = prestige$prestige, pch = 20,
  main = "Prestige Score by Education",
  xlab = "Avg. Years of Education", ylab = "Prestige Score")


## Scatterplots, contd.
abline(reg = lm(prestige ~ education, data = prestige),
  col = "green", lwd = 2)  # linear regression

lines(lowess(x = prestige$education, y = prestige$prestige),
  col = "red", lwd = 2)  # smoother

legend("topleft", legend = c("Regression Line", "Smoother"),
  col = c("green", "red"), lwd = c(2,2), lty = 1, bty = "n")


## Scatterplot Matrices
library(car)
scatterplotMatrix( prestige[ ,c("prestige","education","income","women")] )
