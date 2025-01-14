
# Part V: Mixed Model ANOVA -----------------------------------------------

# load libraries
library(lmerTest)
library(emmeans)
library(multcomp)
library(lme4)
library(car)

# Repeated Measures -------------------------------------------------------

# create data
data <- data.frame(ID = c(rep(1:20, 3)),                     
                   score = c(74 ,72, 68, 66, 82, 74, 80, 65, 51, 75,
                             64, 77, 78, 70, 80, 78, 85, 80, 86, 79,
                             84 ,82, 78, 76, 92, 94, 90, 85, 71, 95,
                             84, 97, 98, 80, 90, 88, 95, 90, 96, 89,
                             84, 88, 88, 90, 92, 93, 91, 85, 80, 93,
                             97, 100, 93, 91, 92, 89, 94, 83, 92, 95),
                   group = c(rep('pretest', 20), rep('midterm', 20), rep('final', 20)))

# set contrasts for ANOVA
options(contrasts=c("contr.sum", "contr.poly"))

# define categorical variables
data$group<-as.factor(data$group)
data$ID<-as.factor(data$ID)

# define continuous variables
data$score<-as.numeric(data$score)

# build model
rm_model <- lmer(score ~ group + (1|ID), data=data)

# verify assumptions
shapiro.test(summary(rm_model)$residuals)
leveneTest(summary(rm_model)$residuals, group=as.factor(data$group))

# ANOVA Table
anova(rm_model, type=3)

#post-hoc comparisons
emm1<- emmeans(rm_model, pairwise~group)

# Tukey's Test
contrast(emm1, method='pairwise', adjust='tukey')
cld(emm1, Letters=LETTERS)
