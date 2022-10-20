setwd("C:/Users/Administrator/Desktop/R")
library(openxlsx)
date<-read.xlsx('2004年广东省各市高新技术产品情况.xlsx','date',rowNames = T);head(date)
summary(date)
boxplot(date)
rm<-apply(date,1,mean);rm
barplot(rm,las = 3)
cm<-apply(Case3,2,mean);cm
barplot(cm,horiz = T)
stars(date,key.loc = c(8,2))
stars(date,draw.segments = T,key.loc = c(8,2))
library(aplpack)
faces(date)