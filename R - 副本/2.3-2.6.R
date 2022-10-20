#2.3数据矩阵及R表示
#2.3.1创建一个向量
x1<-c(171,175,159,155,152,158,154,164,168,166,159,164)
x2<-c(57,64,41,38,35,44,41,51,57,49,47,46)
#向量长度 length
length(x1)
length(x2)
#数据的类型
mode(x1)
mode(x2)

#R语言生成连续数列及自定义数列
a<-1:12
a
b<-c(1,3,6,4,9)
b

#2.3.2创建一个矩阵
a<-c(1,2,3,4,5,6)
#生成2*3的矩阵A
A<-matrix(a,2,3,byrow = T)
A
#生成3*2的矩阵B
B<-matrix(a,3,2)
B
#利用X1数据来创建矩阵
#生成3*4的矩阵
matrix(x1,3,4)
#生成4*3的矩阵
matrix(x1,4,3)
#生成4*3的矩阵，并按行排列
matrix(x1,4,3,byrow = T)


#2.3.3矩阵转置
#求矩阵A的转置矩阵
t(A)

#2.3.4矩阵加减法
#矩阵加法
A+B#报错，因为矩阵不相同
A[,1:2]+B[1:2,]
#矩阵减法
A[,2:3]-B[2:3,]

#2.3.5矩阵乘法
#乘法符号为%*%
C=A%*%B
C
D=B%*%A
D

#2.3.6矩阵的对角运算
#应用diag函数来取方阵的对角元素，并且可以产生K阶单位矩阵
#获取矩阵D的对角元素
diag(D)
#创建3阶单位矩阵
I<-diag(3)
I

#2.3.7矩阵求逆
#矩阵求逆可以用函数solve,求逆的时候要求矩阵为单位矩阵
solve(C)

#2.3.8矩阵的特征值与特征向量
#矩阵的特征值与特征向量求解可以调用eigen函数
D.e<-eigen(D,symmetric = T)
D.e
#求原始矩阵
D.e$vectors%*%diag(D.e$values)%*%t(D.e$vectors)

#2.3.9矩阵的奇异值分解（了解）
#奇异值分解可以调用函数svd
A<-matrix(1:18,3,6)
A.s<-svd(A)
A.s

#2.3.10 矩阵维度
#矩阵的维数可以用dim函数获取
dim(A)
#矩阵的行数可以用nrow函数获取
nrow(A)
#矩阵的列数可以用ncol函数获取
ncol(A)

#2.3.11矩阵求和运算
#矩阵求和可以用sum函数
sum(A)
#矩阵按行求和可以用rowSums函数
rowSums(A)
#矩阵按列求和可以用colSums函数
colSums(A)

#2.3.12矩阵均值运算
#对矩阵A求矩阵
mean(A)
#矩阵按行求平均可以用rowMeans函数
rowMeans(A)
#矩阵按行求平均可以用colMeans函数
colMeans(A)

#2.4数据框及R表示
#2.4.1生成数据框
X<-data.frame(x1,x2)
X

#赋予数据框列新名称
Y<-data.frame("身高"=x1,"体重"=x2)
Y

#2.4.2 数据框的组成
#按行合并可以调用rbind函数
a1<-rbind(x1,x2)
a1
#按列合并可以调用cbind函数
a2<-cbind(x1,x2)
a2
#按行显示。head默认显示前6行的数据，tail默认显示最后6行的数据
head(X)
tail(X)

#2.4.3数据框的应用
#apply函数应用
#apply按行求和 等同于rowSums
Xr<-apply(X,1,sum)
Xr
#apply按列求和 等同于colSums
Xc<-apply(X,2,sum)
Xc
#apply按行求平均 等同于rowMeans
Xa<-apply(X,1,mean)
Xa
#apply按列求平均 等同于colMeans
Xb<-apply(X,2,mean)
Xb
#将Xr和X列合并
cbind(X,"行合计"=Xr)
#将Xc和X行合并
rbind(X,"列合计"=Xc)


#2.5多元数据的R调用
#2.5.1从剪切板读取数据
#用read.table来读取剪切板的内用，clipboard为剪切板header=T表示读取第一行为标题行
d2.1<-read.table("clipboard",header = T)
d2.1
head(d2.1)
#2.5.2从文本文件读取
#将身高体重存在test.csv文件中并读取
write.csv(X,file = "test1.csv")
read.csv("test1.csv")
write.csv(X,file = "test2.csv",row.names = F)#不包括行名
read.csv("test2.csv")

#2.5.3从excel中读取文件
#首先加载openxls的包，然后再用read.xlsx来读取数据
install.packages("openxlsx")
library(openxlsx)
#设置工作目录
setwd("C:/Users/Administrator/Desktop/R")
d2.1=read.xlsx("mvstats5.xlsx","d2.1")
tail(d2.1)

#2.6多源数据简单R分析
#2.6.1定量变量分析
#直方图可以调用hist函数
hist(x1)
#研究身高和体重的关系，绘制散点图，调用plot函数
plot(x1,x2)

#2.6.2定性变量的分析
d2.1=read.xlsx("mvstats5.xlsx","d2.1")
attach(d2.1)
table(年龄)
barplot(table(年龄),col=1:7)
pie(table(投资结果))
#双因素分析
table(年龄,性别)
#以性别分组的年龄条图
barplot(table(年龄,性别),beside = T,col=1:7)
#以年龄分组的性别条图
barplot(table(性别,年龄),beside = T,col=3:4)
#三因素分析
#超过三个要素以上，调用选择ftable函数
#以年龄，性别排列的投资结果频数三位列联表
ftable(年龄,性别,投资结果)

#以性别、年龄排列的投资结果频数三位列联表
ftable(性别,年龄,投资结果)

#以性别、投资结果排列的年龄频数三位列联表
ft<-ftable(性别,投资结果,年龄)
rowSums(ft)
#apply(ft,1,sum)
colSums(ft)
#apply(ft,2,sum)
sum(ft)

