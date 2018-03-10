# Description
This 2-day course provides a brief introduction to the basics of programming and the fundamentals of the R language and its use for data analysis--including exploratory data analysis, linear and logistic regression, variable selection, model diagnostics, and prediction.

Please follow the [Pre-Workshop Instructions](#Instructions) prior to coming to the workshop.


# Syllabus
### DAY 1 - April 13
* **What is Programming?**: we introduce the concept of programming without a computer to get students thinking critically
* **Basics of Programming**: the basics of general programming--including programming languages, data structures, control structures, and functions
* **Fundamentals of R & RStudio**: the basics of the R language--including objects, subsetting, indexing, data input & output, and packages

### DAY 2 - April 27
* **Exploratory Data Analysis**: all the necessary tools to investigate your data before performing any formal modeling--from summary statistics to visualization including plotting histograms, boxplots, and scatterplots
* **Linear Regression**: everything you need to know to begin fitting linear models--from simple t-tests to estimation of regression coefficients, variable selection, model diagnostics, and prediction
* **Logistic Regression**: the basics of generalized linear models (GLMs) with an emphasis on binary response data--we extend the theory and modeling strategies of linear regression


# Schedule
[Introduction to Programming](https://datumu.github.io/CSULB_Intro_R/slides/intro_programming.html)


# <a name="Instructions"></a>Pre-Workshop Instructions
### Step 1: Download and install R
First, visit [The R Project for Statistical Computing](https://www.r-project.org/). Click on `CRAN` under the Download section on the left-hand side of the page. Then, click on any of the nearby websites under the USA section near the bottom of the page. For example, the link from the University of California, Berkley, CA or University of California, Los Angeles, CA are both fine. Download R for your platform (Linux, Mac, or Windows), open the downloaded file and follow the instructions.

### Step 2: Download and install RStudio
RStudio is a set of integrated tools designed to help you be more productive with R. Also, it is far more user-friendly than base R. You will be doing essentially all of your programming in RStudio. To download RStudio, visit the [download page](https://www.rstudio.com/products/rstudio/download/), scroll down to "Installers for Supported Platforms," and click on the appropriate installer for your platform. Finally, open the downloaded file and follow the instructions.

### Step 3: Install required R packages
In R, packages are used to share code. A package bundles together code, data, documentation, and tests. As of February 2018, there were over 12,000 packages available on the Comprehensive R Archive Network, or CRAN. This huge variety of packages is one of the reasons that R is so successful: the chances are that someone has already solved a problem that you’re working on, and you can benefit from their work by downloading their package and using their code.

In this workshop, we will be using three packages-- `BRRR`, `car` and `here`. If everyone attempts to download them at the same time, the wireless internet will become very upset with us and work slowly. Therefore, I suggest installing them before coming to class. There are a few ways to do this (which we will discuss more during the workshop). For now, please download [install_packages.R](https://datumu.github.io/CSULB_Intro_R/R/install_packages.R) and open it in RStudio (`Right click > Open with > RStudio`). Once in RStudio, you should see the following three lines of code:
```r
install.packages("BRRR", dependencies = TRUE)
install.packages("car", dependencies = TRUE)
install.packages("here", dependencies = TRUE)
```
Highlight all of this code (using your cursor, `Ctrl + A` on Windows, or `Cmd + A` on Mac) and click the Run icon (or hit `Ctrl + Enter` on Windows or `Cmd + Enter` on Mac). Additional "dependencies," or other packages necessary to run the three above, will also be installed. This may take a few minutes.


### Step 4: Join the Slack chatroom
We have a chatroom set up at [CSULB-intro-R.slack.com](ADD LINK) for you to have discussions and ask/answer questions that may arise throughout the day.


# Authors
Chris Galbraith (<galbraic@uci.edu>)

Micah Jackson (<gmjackso@uci.edu>)
