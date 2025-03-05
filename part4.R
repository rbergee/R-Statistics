
# Part IV: t-tests & Analysis of Variance (ANOVA) -----------------------

#load libraries & data
library("car") 
library("ggplot2") 
library("emmeans") 
library("multcomp") 
library("lme4") 
library("lmerTest")
data(mtcars)

## Comparing Two Groups -------------------------------------------------

# load data & drop trt2
data(PlantGrowth)
plant <- subset(PlantGrowth, group != 'trt2')

# verify assumptions
hist(plant$weight)
shapiro.test(plant$weight)
leveneTest(weight ~ group, data=plant)
boxplot(plant$weight, plant$group)

# perform t-Test
t.test(weight~group, data=plant, var.equal=TRUE)

# non-parametric option
wilcox.test(weight~group, data=plant)

# create paired data
data <- data.frame(ID = c(rep(1:20)),
                   score1 = c(84 ,82, 78, 76, 92, 94, 90, 85, 71, 95,
                              84, 97, 98, 80, 90, 88, 95, 90, 96, 89),
                   score2 = c(84, 88, 88, 90, 92, 93, 91, 85, 80, 93,
                              97, 100, 93, 91, 92, 89, 94, 83, 92, 95))

# define differences & verify assumptions
differences <- data$score1 - data$score2 
hist(differences) 
shapiro.test(differences)

# perform paired t-Test
t.test(data$score1, data$score2, paired = TRUE)

# non-parametric option
wilcox.test(data$score1, data$score2, paired = TRUE)

## Comparing More Than Two Groups ---------------------------------------

# set contrasts for ANOVA
options(contrasts=c("contr.sum", "contr.poly"))

# reload data
data(PlantGrowth)

# create data set
plant <- PlantGrowth

# classify variables
plant$weight <- as.numeric(plant$weight)
plant$group <- as.factor(plant$group)

# relevel groups
plant$group <- relevel(plant$group, ref='ctrl')

# define model
model <- lm(weight~group, data=plant)

# verify assumptions
shapiro.test(summary(model)$residuals)
leveneTest(summary(model)$residuals, group=as.factor(plant$group))

# run F-Test, ANOVA Table
Anova(model, type=3)

# post-hoc comparisons
emm1<- emmeans(model, pairwise~group)

# Tukey's Test
contrast(emm1, method='pairwise', adjust='tukey')
cld(emm1, Letters=LETTERS)

# Dunnett's Test
contrast(emm1, method='dunnett')

#Comparing Multiple Factors ---------------------------------------------

# two-way ANOVA model example
model <- lm(mpg ~ vs*am, data=mtcars)

# verify assumptions
shapiro.test(summary(model)$residuals)
leveneTest(summary(model)$residuals, group=as.factor(mtcars$vs):as.factor(mtcars$am))

# ANOVA table
Anova(model, type=3)

# post-hoc comparisons
emm1<- emmeans(model, pairwise~vs:am)
contrast(emm1, method='pairwise', adjust='tukey')
