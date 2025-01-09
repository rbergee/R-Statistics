
# Part I: Descriptive Statistics -----------------------------------------

#load libraries & data
library(jmv)
data(mtcars)

## Data Types ------------------------------------------------------------

# data structure
str(mtcars)

# variable class
class(mtcars$wt)

# logical argument for data type
is.numeric(mtcars$wt)

## Summary Statistics-----------------------------------------------------

# summary function 
summary(mtcars$mpg)

# extract first element of summary
summary(mtcars$mpg)[1]

# manual calculation
min(mtcars$mpg)

# define a variable x
x <- mtcars$mpg

# other manual calculations
sd(x)
var(x)
sd(x)/sqrt(length(x))

## Missing Data ----------------------------------------------------------

# create vector with missing data
x <- c(2, NA, 3, 4, 5, 6, 7, 8)

# summary function
summary(x)

# find missing value
is.na(x)

# count number of missing values
sum(is.na(x))

## Descriptive & Frequency Tables ----------------------------------------

# tabular form of summary statistics
descriptives(mtcars, vars=vars(mpg, cyl, disp, wt))

# defining engine shape as a factor
mtcars$vs <- as.factor(mtcars$vs)

# frequency table
descriptives(mtcars, vs, freq=TRUE)

# option for renaming values, then setting factor
data(mtcars)
mtcars$vs[mtcars$vs == 0] <- 'V-shaped'
mtcars$vs[mtcars$vs == 1] <- 'straight'
mtcars$vs <- as.factor(mtcars$vs)

# frequency table
descriptives(mtcars, vs, freq=TRUE)
