student <- read.table("mat_2.txt",sep="\t",header=FALSE)
IV<-(student[,1:10]) 
IV1=scale(IV,FALSE,FALSE) ## 不对自变量进行标准化处理

## 十重交叉验证
install.packages(‘glmnet’)
library(glmnet)
set.seed(1222)  ## 设定随机数种子，保证每次运行十重交叉验证的结果一样
Lambda=cv.glmnet(IV1,student[,11]) 

## lasso回归结果
coef(Lambda, s=Lambda$lambda.1se) 

## 绘图
plot(Lambda)  ## 横坐标为lambda，纵坐标为均方误差MSE
savePlot(filename = "lambda", type ="png", device = dev.cur(),
         restoreConsole = TRUE)
         
RegCoef=glmnet(IV1,student[,11],family = "gaussian",alpha = 1)          
plot(RegCoef, xvar="lambda",ylim=c(-1.5,1.5), lwd=1.8 )  
## 横坐标为lambda，纵坐标为系数估计值
abline(v=log(Lambda$lambda.1se))
abline(v=log(Lambda$lambda.min))
savePlot(filename = "loglambda", type ="png", device = dev.cur(),
         restoreConsole = TRUE)


## 采用covTest包计算p值
library('devtools')
install_github('cran/covTest')
## coveTest 软件包目前无法从CRAN上下载，因此采用devtools软件包从github上下载
library(covTest)

IV<-student[,1:10] 
df=nrow(IV)-1 
IV2=scale(IV,TRUE,TRUE)/sqrt(df)   ## 标准化自变量

LarsCoef=lars(IV2,student[,11]) 
covTest(LarsCoef,IV2,student[,11]) ## 计算p值
