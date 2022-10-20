## 多元数据的基本统计分析##
library(openxlsx)
setwd("C:/Users/Administrator/Desktop/R")
Case2<-read.xlsx('mvcase5.xlsx','Case2');head(Case2)
summary(Case2)
T1<-table(Case2$地区);T1
barplot(T1,col = 1:4)
f<-hist(Case2$月收入);f
boxplot(月收入 ~ 性别,Case2)
t.test(月收入 ~ 性别,Case2)
T2<-table(Case2$性别,Case2$观点);T2
barplot(T2,beside = T,horiz = T,col = 1:2)
T3<-ftable(Case2$性别,Case2$教育程度,Case2$观点);T3
barplot(T3,beside = T,col = 1:3)
T4<-ftable(Case2$教育程度,Case2$性别,Case2$观点);T4
barplot(T4,beside = T,col = 1:3)
