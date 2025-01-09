# Part III: Linear Regression ----------------------------------------------

# load libraries
library("car")
library("ggplot2")

## Load & Prepare Data ----------------------------------------------------

# reload the data
mtcars <- read.csv('mtcars.csv')

# define continuous variables
mtcars$mpg <- as.numeric(mtcars$mpg)
mtcars$cyl <- as.numeric(mtcars$cyl)
mtcars$disp <- as.numeric(mtcars$disp)
mtcars$hp <- as.numeric(mtcars$hp)
mtcars$drat <- as.numeric(mtcars$drat)
mtcars$wt <- as.numeric(mtcars$wt)
mtcars$qsec <- as.numeric(mtcars$qsec)
mtcars$gear <- as.numeric(mtcars$gear)
mtcars$carb <- as.numeric(mtcars$carb)

# define categorical variables
mtcars$vs <- as.factor(mtcars$vs)
mtcars$am <- as.factor(mtcars$am)

# save changes into new data set
mtcars_data <- mtcars

## Model Building ---------------------------------------------------------
model_1 <- lm(mpg ~ wt + hp + disp + vs, data=mtcars_data)

## Verify Assumptions -----------------------------------------------------

# 1: Linearity 
#store predicted values 
mtcars_data$preds <- predict(model_1)

#Regression Plot
ggplot(mtcars_data, aes(x=preds, y=mpg)) +
  geom_point(shape=1, size=3) +    # Use hollow circles
  geom_smooth(method=lm,   # Add linear regression line
              se=FALSE)    # Add shaded confidence region

#2: Independent Observations
# refer to supplementary material

#3: No Multicollinearity

# Variance Inflation Factor (>10 or >5)
vif(model_1)

# Which variable should I drop?
cor(mtcars$mpg, mtcars$wt, method='pearson')
cor(mtcars$mpg, mtcars$disp, method='pearson')

# save reduced model
model_2 <- lm(mpg ~ wt + hp + vs, data=mtcars_data)

#4: Homoscedasticity of Residuals

# store residuals
mtcars_data$resid <- resid(model_2)

# store predicted values 
mtcars_data$preds <- predict(model_2)

# store standardized residuals 
mtcars_data$stdresid <- rstandard(model_2)

# Resdiual Vs Predicted values with center line at zero
ggplot(mtcars_data, aes(x=preds, y=resid)) +
  geom_point(shape=1, size=3) +    # Use hollow circles
  geom_hline(aes(yintercept=0))

# StdResdiual Vs Predicted values with center line at zero
ggplot(mtcars_data, aes(x=preds, y=stdresid)) +
  geom_point(shape=1, size=3) +    # Use hollow circles
  geom_hline(aes(yintercept=0))

# diagnostic plots
infIndexPlot(model_2, grid=FALSE)

# DFBETAs - find influential observations
dfbetas <- dfbetas(model_2, grid=FALSE) 
n <- nrow(mtcars)
thresh <- 2/sqrt(n)
which.max(dfbetas > thresh)[1]

# remove influential observation *** NEED PRACTICAL REASONING ***
mtcars_reduced <- subset(mtcars_data, X != 20)
model_2 <- lm(mpg ~ wt + hp + vs, data=mtcars_reduced)

#5: Normally Distributed Residuals

#store residuals
mtcars_reduced$resid <- resid(model_2)

#Shapiro-Wilk test
shapiro.test(mtcars_reduced$resid)

#Q-Q plot with line
qqnorm(mtcars_reduced$resid)
qqline(mtcars_reduced$resid)

## Model Results ----------------------------------------------------------

# model summary
summary(model_2)

# fit statistics
AIC(model_2)
BIC(model_2)

# extract coefficients
summary(model_2)$coefficients

## Alternative Modeling Options -------------------------------------------

#model with interaction
model_3 <- lm(mpg ~ wt*hp, data=mtcars_data)
summary(model_3)
