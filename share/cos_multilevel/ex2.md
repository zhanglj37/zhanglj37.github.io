
# 实例2：数据、代码和结果



## 单变量模型在mplus中的实现

18名棒球运动员在1970年赛季的前45次击球的平均击中率(y变量)

```{r}
TITLE:	 Model 4: Explaining variation in the level-2 intercept and slope;
DATA:  FILE IS: C:\ Mplus1\ch3new.dat;
	     Format is 5f8.0, 3f8.2;
VARIABLE:	
        Names are deptid morale satpay female white pctbelow lev1wt lev2wt;
        Usevariables are  morale;
        Cluster is deptid;  !分组变量为deptid
        Between = ; !定义组间变量
        Within =; 

ANALYSIS:	
        Type= Twolevel;   !Twolevel定义两层模型，random定义随机斜率(β1)模型
        Estimator = Bayes;  !定义估计方法
        Biterations = (20000);  !定义模型最小迭代次数为20000次
        Point = Median;  ! 定义点估计报告后验分布的中位数结果
Model:	%Between%
    	morale 
    	%Within%
    	morale 
OUTPUT:	TECH1;
PLOT: TYPE = PLOT2;	!输出各参数的后验分布直方图等

```


```
MODEL RESULTS
                                Posterior  One-Tailed         95% C.I.
                    Estimate       S.D.      P-Value   Lower 2.5%  Upper 2.5%  Significance

Within Level

 Variances
    MORALE            33.312       0.413      0.000      32.511      34.124      *

Between Level

 Means
    MORALE            26.429       0.194      0.000      26.046      26.813      *

 Variances
    MORALE             5.506       0.684      0.000       4.361       7.041      *
```

## 单变量模型在rjags中的实现

## 导入数据 & 设定模型
```{r}
varnames <- c("deptid", "morale", "satpay", "female", "white", "pctbelow", "lev1wt","lev2wt")
data <- read.table(file="ch3new.dat")
data[,3:6] <- scale(data[,3:6])
colnames(data) = varnames


library(rjags)
# 需要先下载JAGS软件 http://mcmc-jags.sourceforge.net/
library(mcmcplots)


# Define Model
modelstring <- as.character("

model{

for (g in 1:165){
for (i in 1:N[g]){

  y[kk[g]+i] ~ dnorm(u[g], psi)

}
  u[g] ~ dnorm(umu, psiu)

}

# Prior for the mean of thetas
	umu ~ dnorm(0,0.00001)
	##  !!JAGS为了便于程序运行采用精度代替方差，精度=1/方差，因此此处提供无信息先验精度需要设置得较小
	
# Prior for the precision and variance 
	psi ~ dgamma(1,1)
	psiu ~ dgamma(1,1)
	sigma.psi <- 1/psi
	sigma.psiu <- 1/psiu

} # closes the model

") 

# data
temp = read.table("groupsize.txt")
g = 165
n = sum(temp[,1])
jags.data <- list(y = data[,2], N = temp[,1], 
				kk = temp[,2])


entities.to.monitor <- c("umu", "sigma.psi", "sigma.psiu")
```

### 设定MCMC算法初始值及迭代次数等
```{r}
## set initial value
u.inits.1 <- rep(0,g)
umu.inits.1 <- 0
psi.inits.1 <- 0.3
psiu.inits.1 <- 0.3

u.inits.2 <- rep(0.2,g)
umu.inits.2 <- 0
psi.inits.2 <- 0.5
psiu.inits.2 <- 0.5


u.inits.3 <- rep(0.5,g)
umu.inits.3 <- 0
psi.inits.3 <- 0.8
psiu.inits.3 <- 0.8



inits1 <- list(
	u = u.inits.1,
	umu = umu.inits.1,
	psi = psi.inits.1,
	psiu = psiu.inits.1,

    .RNG.name = "base::Mersenne-Twister", 
    .RNG.seed = 10
)

inits2 <- list(
	u = u.inits.2,
	umu = umu.inits.2,
	psi = psi.inits.2,
	psiu = psiu.inits.2,

    .RNG.name = "base::Mersenne-Twister", 
    .RNG.seed = 20
)

## inits
inits3 <- list(
	u = u.inits.3,
	umu = umu.inits.3,
	psi = psi.inits.3,
	psiu = psiu.inits.3,

    .RNG.name = "base::Mersenne-Twister", 
    .RNG.seed = 30
)

inits <- list(inits1, inits2, inits3)

# Choose features of MCMC --------
#   the number of chains
#   the number of iterations to burn-in, 
#	  the number of iterations to thin by,
#	  the total number of iterations 
n.chains = 3
n.burnin = 0
n.thin = 1
n.iters.total.per.chain =  10000
n.burnin = 5000
n.iters.per.chain.after.burnin = n.iters.total.per.chain - n.burnin
```

### 运行模型
```{r}
# Initialize the model
# Write out the model to a file
model.file.name <- "MLM2_model1.txt"
write(x=modelstring, file=paste0(model.file.name), append=FALSE)

jags.model.initialized <- jags.model(file=model.file.name,
                                data=jags.data,
                                n.chains=n.chains,
                                inits=inits)
								
jags.model.fitted <- coda.samples(
  jags.model.initialized,
  variable.names=entities.to.monitor,
  n.iter=n.iters.total.per.chain,
  progress.bar="gui"
)


# Define the draws from MCMC
draws.from.mcmc <- jags.model.fitted


# Define the names of parameters to use for convergence assessment
parameters.for.convergence <- entities.to.monitor


# Select the iterations to investigate
draws.to.analyze <- window(draws.from.mcmc,
                           start=n.burnin+1)


# Combine chains 
draws.to.analyze.as.one.list <- as.mcmc(do.call(rbind,draws.to.analyze)) 

coda.options(combine.stats=TRUE, combine.plots=TRUE)
# Extract the summary statistics
#   Usual
#   Percentiles
#   Later, HPD
summary.stats <- summary(draws.to.analyze)


# Numerically summarize the results
probability.for.HPD=.95
HPD.interval <- HPDinterval(draws.to.analyze.as.one.list, prob=probability.for.HPD)


# Organize and write out numerical summaries
summary.statistics <- cbind(
  summary.stats$statistics, 
  matrix(HPD.interval, ncol=2)
 )

colnames(summary.statistics) <- c(
  colnames(summary(jags.model.fitted)$statistics),
  c("95% HPD lower", "95% HPD Upper")
)



write.table(summary.statistics,"summary_model1.txt")

```
       
	   
### 结果
```{r}
                Mean        SD    Naive SE Time-series SE 95% HPD lower
sigma.psi  33.306586 0.4110150 0.003355923    0.003451017     32.535797
sigma.psiu  5.403783 0.6696105 0.005467347    0.006560731      4.177738
umu        26.428779 0.1903632 0.001554309    0.001702034     26.055863
           95% HPD Upper
sigma.psi      34.135397
sigma.psiu      6.755166
umu            26.806662
```

### 后验分布图，及每条MCMC链的运行结果，可以检验模型是否收敛
```{r}
library(mcmcplots)
# Plot the results
mcmcplot(
  mcmcout = draws.to.analyze,
  filename = "MCMCoutput_model1"
)
```   
[后验分布图](ex2/model1/MCMCoutput_model1.html)



## 假设模型在rjags中的实现

![公式](file = "https://zhanglj37.github.io/share/cos-multilevel/model.PNG")


### 代码
```{r}
varnames <- c("deptid", "morale", "satpay", "female", "white", "pctbelow", "lev1wt","lev2wt")
data <- read.table(file="ch3new.dat")
#data <- scale(data)
data[,3:6] <- scale(data[,3:6],center = TRUE,scale=F)
colnames(data) = varnames

## 设定模型


library(rjags)
# 需要先下载JAGS软件 http://mcmc-jags.sourceforge.net/
library(mcmcplots)


# Define Model
modelstring <- as.character("

model{

for (g in 1:165){
for (i in 1:N[g]){

  y[kk[g]+i] ~ dnorm(u[kk[g]+i], psi)
  
  u[kk[g]+i] <- beta0[g] + beta1[g]*satpay[kk[g]+i] + beta2*female[kk[g]+i] + beta3*white[kk[g]+i]

}
  beta0[g] ~ dnorm(ubeta0[g], psibeta0)
  ubeta0[g] <- gamma0*pctbelow[kk[g]+1] + mu0
  
  beta1[g] ~ dnorm(ubeta1[g], psibeta1)
  ubeta1[g] <- gamma1*pctbelow[kk[g]+1] + mu1
  
}


# Prior for the mean of thetas
	beta2 ~ dnorm(0,0.00001)
	beta3 ~ dnorm(0,0.00001)
	gamma0 ~ dnorm(0,0.00001)
	gamma1 ~ dnorm(0,0.00001)
	mu0 ~ dnorm(0,0.00001)
	mu1 ~ dnorm(0,0.00001)
	

# Prior for the precision and variance 
	psi ~ dgamma(1,1)
	psibeta0 ~ dgamma(1,1)
	psibeta1 ~ dgamma(1,1)
	sigma.psi <- 1/psi
	sigma.psibeta0 <- 1/psibeta0
	sigma.psibeta1 <- 1/psibeta1



} # closes the model


") 

# data
temp = read.table("groupsize.txt")
g = 165
n = sum(temp[,1])
jags.data <- list(y = data[,2], N = temp[,1], 
				kk = temp[,2], 
				satpay = data[,3], female = data[,4], white = data[,5], pctbelow = data[,6])


entities.to.monitor <- c("beta2", "beta3", "gamma0", "gamma1",  "mu0",
				"mu1","sigma.psi", "sigma.psibeta0", "sigma.psibeta1")


## 设定MCMC算法初始值及迭代次数等


## set initial value
beta0.inits.1 <- rep(0,g)
beta1.inits.1 <- rep(0,g)
beta2.inits.1 <- 0
beta3.inits.1 <- 0
gamma0.inits.1 <- 0
gamma1.inits.1 <- 0
mu0.inits.1 <- 0
mu1.inits.1 <- 0
psi.inits.1 <- 0.3
psibeta0.inits.1 <- 0.3
psibeta1.inits.1 <- 0.3


beta0.inits.2 <- rep(0.2,g)
beta1.inits.2 <- rep(0.2,g)
beta2.inits.2 <- 0.2
beta3.inits.2 <- 0.2
gamma0.inits.2 <- 0.2
gamma1.inits.2 <- 0.2
mu0.inits.2 <- 0.2
mu1.inits.2 <- 0.2
psi.inits.2 <- 0.5
psibeta0.inits.2 <- 0.5
psibeta1.inits.2 <- 0.5


beta0.inits.3 <- rep(0.3,g)
beta1.inits.3 <- rep(0.3,g)
beta2.inits.3 <- 0.3
beta3.inits.3 <- 0.3
gamma0.inits.3 <- 0.3
gamma1.inits.3 <- 0.3
mu0.inits.3 <- 0.3
mu1.inits.3 <- 0.3
psi.inits.3 <- 0.8
psibeta0.inits.3 <- 0.8
psibeta1.inits.3 <- 0.8



inits1 <- list(
	beta0 = beta0.inits.1,
	beta1 = beta1.inits.1,
	beta2 = beta2.inits.1,
	beta3 = beta3.inits.1,
	gamma0 = gamma0.inits.1,
	gamma1 = gamma1.inits.1,
	mu0 = mu0.inits.1,
	mu1 = mu1.inits.1,
	psi = psi.inits.1,
	psibeta0 = psibeta0.inits.1,
	psibeta1 = psibeta1.inits.1,

    .RNG.name = "base::Mersenne-Twister", 
    .RNG.seed = 10
)

inits2 <- list(
	beta0 = beta0.inits.2,
	beta1 = beta1.inits.2,
	beta2 = beta2.inits.2,
	beta3 = beta3.inits.2,
	gamma0 = gamma0.inits.2,
	gamma1 = gamma1.inits.2,
	mu0 = mu0.inits.2,
	mu1 = mu1.inits.2,
	psi = psi.inits.2,
	psibeta0 = psibeta0.inits.2,
	psibeta1 = psibeta1.inits.2,

    .RNG.name = "base::Mersenne-Twister", 
    .RNG.seed = 20
)

## inits
inits3 <- list(
	beta0 = beta0.inits.3,
	beta1 = beta1.inits.3,
	beta2 = beta2.inits.3,
	beta3 = beta3.inits.3,
	gamma0 = gamma0.inits.3,
	gamma1 = gamma1.inits.3,
	mu0 = mu0.inits.3,
	mu1 = mu1.inits.3,
	psi = psi.inits.3,
	psibeta0 = psibeta0.inits.3,
	psibeta1 = psibeta1.inits.3,
    .RNG.name = "base::Mersenne-Twister", 
    .RNG.seed = 30
)

inits <- list(inits1, inits2, inits3)

# Choose features of MCMC --------
#   the number of chains
#   the number of iterations to burn-in, 
#	  the number of iterations to thin by,
#	  the total number of iterations 
n.chains = 3
n.burnin = 0
n.thin = 1
n.iters.total.per.chain =  20000
n.burnin = 5000
n.iters.per.chain.after.burnin = n.iters.total.per.chain - n.burnin



## 运行模型


# Initialize the model
# Write out the model to a file
model.file.name <- "MLM2.txt"
write(x=modelstring, file=paste0(model.file.name), append=FALSE)

jags.model.initialized <- jags.model(file=model.file.name,
                                data=jags.data,
                                n.chains=n.chains,
                                inits=inits)
								
jags.model.fitted <- coda.samples(
  jags.model.initialized,
  variable.names=entities.to.monitor,
  n.iter=n.iters.total.per.chain,
  progress.bar="gui"
)


# Define the draws from MCMC
draws.from.mcmc <- jags.model.fitted


# Define the names of parameters to use for convergence assessment
parameters.for.convergence <- entities.to.monitor


# Select the iterations to investigate
draws.to.analyze <- window(draws.from.mcmc,
                           start=n.burnin+1)


# Combine chains 
draws.to.analyze.as.one.list <- as.mcmc(do.call(rbind,draws.to.analyze)) 

coda.options(combine.stats=TRUE, combine.plots=TRUE)
# Extract the summary statistics
#   Usual
#   Percentiles
#   Later, HPD
summary.stats <- summary(draws.to.analyze)


# Numerically summarize the results
probability.for.HPD=.95
HPD.interval <- HPDinterval(draws.to.analyze.as.one.list, prob=probability.for.HPD)


# Organize and write out numerical summaries
summary.statistics <- cbind(
  summary.stats$statistics, 
  matrix(HPD.interval, ncol=2)
 )

colnames(summary.statistics) <- c(
  colnames(summary(jags.model.fitted)$statistics),
  c("95% HPD lower", "95% HPD Upper")
)



write.table(summary.statistics,"summary.txt")

library(mcmcplots)
# Plot the results
mcmcplot(
  mcmcout = draws.to.analyze,
  filename = "MCMCoutput"
)

```

### 结果
```{r}
                       Mean          SD     Naive SE Time-series SE 95% HPD lower 95% HPD Upper
beta2           0.009085682 0.074093966 3.492823e-04   3.611701e-04  -0.136651645   0.153880271
beta3           0.905934469 0.078113294 3.682296e-04   4.163965e-04   0.753560122   1.059000079
gamma0         -0.026639403 0.007078300 3.336742e-05   3.954912e-05  -0.040663578  -0.012720804
gamma1          0.001172734 0.001208740 5.698054e-06   8.662830e-06  -0.001190107   0.003548654
mu0            26.368838822 0.112729075 5.314100e-04   6.316542e-04  26.151635336  26.595102817
mu1             1.193413952 0.019639551 9.258173e-05   1.428183e-04   1.154657311   1.231756464
sigma.psi      17.420318119 0.217577381 1.025670e-03   1.038069e-03  16.995462346  17.847033090
sigma.psibeta0  1.744403230 0.231330078 1.090500e-03   1.482352e-03   1.307833922   2.199548489
sigma.psibeta1  0.038485610 0.005508411 2.596690e-05   3.976334e-05   0.028012146   0.049201418
```
### 后验分布图

[后验分布图](ex2/model2/MCMCoutput.html)
