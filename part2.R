
# Part II: Contingency Tables, Chi-Square Test & Correlations ------------

# load libraries & data
library(jmv)
library(vcd)
data(mtcars)
data(Arthritis)

## Contingency Tables (aka cross tabulations) ----------------------------

# create contingency table
table(Arthritis$Treatment, Arthritis$Improved)

## Chi-Square Test -------------------------------------------------------

# R built-in
chisq.test(Arthritis$Treatment, Arthritis$Improved)

# jmv library
contTables(Arthritis, Treatment, Improved)

## Correlations ----------------------------------------------------------

# visual lead for correlations
pairs(mtcars[c('mpg', 'disp', 'hp', 'drat', 'wt', 'qsec')])

# verify assumptions
hist(mtcars$mpg)
shapiro.test(mtcars$mpg)

hist(mtcars$wt)
shapiro.test(mtcars$wt)

# correlation function
cor(mtcars$mpg, mtcars$wt, method='pearson')

# correlation test
cor.test(mtcars$mpg, mtcars$wt, method='pearson')
