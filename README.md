# R: Statistics 
Instructor: Rebecca Bergee, PhD

Last Updated: January 9, 2025

---
*Note: This workshop is designed to teach common statistical analyses in R/RStudio including frequency tables, descriptive statistics, chi-square, correlation, linear regression, t-tests and analysis of variance with post hoc tests. It is recommended that you have a working knowledge of R/RStudio as a prerequisiste to this workshop.*

---

## Preparing Your Computer

If you plan to following along and use the workshop files on your local machine, follow these steps:

1.  Install R from <http://www.r-project.org> and install RStudio from <http://www.rstudio.com>

2.  Download and save the workshop files in a single location on your machine

3.  Install these add-on packages before running the code

```{r, eval=F, echo=T}
install.packages("readxl")
install.packages("stats")
install.packages("dplyr")
install.packages("jmv")
install.packages("vcd")
install.packages("car")
install.packages("ggplot2")
install.packages("emmeans")
install.packages("multcomp")
install.packages("lme4")
install.packages("lmerTest")
```
---
## Workspace Setup and Review

The working directory is the first place your program looks for files. Therefore, you need to set the working directory of the file(s) using the location of the file(s) on your local machine. You can either set the directory using code (example below) or manually set the directory by following the menu: "Session" \> "Set Working Directory" \> "Choose Directory..."

```{r, eval=F, echo=T}
setwd('C:/Users/rbergee/Workshops/r statistics') 
```

You can check that the working directory was set correctly using: 
```{r, eval=F}
getwd() 
```
***Note**: File paths may differ by software and/or operating system. Thus, pay attention to backslashes versus forward slashes when inserting a path.*


