# R: Statistics 
Instructor: Rebecca Bergee, PhD

Last Updated: March 3, 2025

---
*Note: This workshop is designed to teach common statistical analyses in R/RStudio including frequency tables, descriptive statistics, chi-square, correlation, linear regression, t-tests and analysis of variance with post hoc tests. It is recommended that you have a working knowledge of R/RStudio as a prerequisiste to this workshop.*

---

## Preparing Your Computer

If you plan to following along and use the workshop files on your local machine, follow these steps:

1.  Install R from <http://www.r-project.org> and install RStudio from <https://posit.co/download/rstudio-desktop/>

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
## Workspace Setup

The working directory is the first place your program looks for files. Therefore, you need to set the working directory of the file(s) using the location of the file(s) on your local machine. You can either set the directory manually (see image below) or using code (see example code below).

![image](https://github.com/user-attachments/assets/6b888257-74ae-41dd-a3b2-a46471839e4d)

```{r, eval=F}
setwd('C:/Users/rbergee/Workshops/r statistics') 
```

You can check that the working directory was set correctly using: 
```{r, eval=F}
getwd() 
```
***Note**: File paths may differ by software and/or operating system. Thus, pay attention to backslashes versus forward slashes when inserting a path.*

---
## Loading Libraries

A package is a collection of R functions and code. Libraries are the storage containers for a package. To use a library, you need to first download and install the package (see above), then load the library. To load the libraries for this workshop run the following lines of code (these will be provided in the scripts as well):

```{r, eval=F}
library("readxl")
library("stats")
library("dplyr")
library("jmv")
library("vcd")
library("car")
library("ggplot2")
library("emmeans")
library("multcomp")
library("lme4")
library("lmerTest")
```

--- 
## Importing & Printing Data

**Data Structure Tips:**

1.  Use a single row for each case or observation

2.  Use a column for each variable or measure

3.  R data sets are always rectangular

4.  Always use an ID number to trace bad values back to written records

5.  If measures are repeated across time, ID number *must* match subjects

**File Formats:**

| Software               | Extension |
|:-----------------------|:----------|
| Excel 2010             | XLSX      |
| Excel 2003-2007        | XLS       |
| SPSS                   | SAV       |
| Delimited File         | DLM       |
| Comma Separated Values | CSV       |
| JMP                    | JMP       |

Import an excel file using the `readxl` library:

```{r}
mtcars <- read_excel('mtcars.xlsx')
```

Import a csv file:

```{r, eval=F, echo=T}
mtcars <- read.csv('mtcars.csv')
```

Load R built-in data set:

```{r, eval=F, echo=T}
data(mtcars)
```

You can view your data by double-clicking the name of the data set in the "Environment" in the upper right section of RStudio. You can print the data using `print()` or print the first few rows using `head()` as so:

```{r}
head(mtcars, n=10)
```

***Note**: Do not print or open large data sets (\>1000 rows). Consider specifying the number of rows instead.*

---
This information is for the workshop being held March 6, 2025 at 10AM ET available to those registered as a student, faculty or staff member of the University of Tennessee, Knoxville.
