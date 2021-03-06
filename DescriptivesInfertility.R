################################
#INTRODUCTION TO COLLABORATIVE RESEARCH
#Assignment1: In-class assignment
#Descriptive Statistics using R databases
#29 February 2016
#Mariam Sanjuch & Roberto Martinez B. Kukutschka
################################

#Packages used:
library(dplyr)
library(rio)
library(ggplot2)
library(vcdExtra)

#Database selection
data(infert)       
names (infert)
#We have decided to work on the "Infertile dataset", which is about the infertility after spontaneous and induced abortion.
#The database includes 248 variables and 8 observations.
  
#I. OVERLOOK OF THE DATASET
head(infert)
tail(infert)

#Type of data object and it's dimensions
class(infert)                   #Its a "data.frame"

#two ways to the numbers of rows
nrow(infert)                    #Number of rows=248  
length(infert[ ,1]) 
#two ways to the numbers of columns
ncol(infert)                  #Number of columns=8  
length(infert)

str(infert)                 #Overview of the data
identify(infert)

#Summarising the data
sapply(infert, is.numeric)   #The variable "education" is not numeric
summary(infert)

#Checking out the missing values
sapply(infert, function(x) sum(is.na(x)))   #No missing values

#.Descriptives for the Numeric Variables
sapply(infert[,c(2:8)], range) %>% round(digits=2) 
sapply(infert[,c(2:8)], mean) %>% round(digits=2) 
sapply(infert[,c(2:8)], median) %>% round(digits=2)
sapply(infert[,c(2:8)], sd) %>% round(digits=2)
#The range, mean, median and standard deviation for all the variables are not accurate since most of the variables are dichotomous/catagorical.

#Calculating the mean of numeric variables
mean(infert$age)   #Mean of age variable at the infertile dataset is 31.50403

hist.default(infert$age, breaks=30)    #Not normally distributed
hist.default(infert$induced, breaks=30)

table(infert$age)
table(infert$induced)      #143 women with no induced abortion, 68 women with one induced abortion and 37 women with two or more induced abortion.
table(infert$spontaneous)  #141 women with no spontaneous abortion, 71 women with one spontaneous abortion and 36 women with two or more spontaneous abortion.
table(infert$induced, infert$spontaneous)
table(infert$induced, infert$education)      #With more level of education, induced abortion is lower
table(infert$spontaneous, infert$education)  #With more level of education, spontaneous abortion is lower

#Changing age from numeric to catagorical variable
infert$agecat1<-cut(infert$age, c(21,26,31,36,41))
table(infert$agecat1)  #21-26=39 women, 26-31=90 women, 31-36=66 women and 36-41=38 women

#Catagorical Variable with Percentage calculation
table(infert$spontaneous, infert$agecat1) 
table1<- table(infert$spontaneous, infert$agecat1)
prop.table(table1,2)
#The highest spontaneous abortion is among women with age (36-41) with 21% & (26-31) 15%.


#############Thank you!#############

