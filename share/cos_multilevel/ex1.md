
# 实例1：数据、代码和结果



[数据](multilevel.csv)来源于Jackman(2009)

## 数据

18名棒球运动员在1970年赛季的前45次击球的平均击中率(y变量)

```{r}
main.folder <-  getwd()
R.folder <- paste0(main.folder, "R/")
data.folder <- paste0(main.folder, "Data/")
jags.folder <- paste0(main.folder, "jags/")
model.folder <- paste0(jags.folder, "MLM Batting Averages/")
data <- read.csv(file=paste0(data.folder, "multilevel.csv"), header=TRUE)
```

```{r}
head(data)
```
<pre><code>##               name  team league     y
## 1 Roberto Clemente Pitts     NL 0.400
## 2   Frank Robinson  Balt     AL 0.378
## 3     Frank Howard  Wash     AL 0.356
## 4    Jay Johnstone   Cal     AL 0.333
## 5        Ken Berry   Chi     AL 0.311
## 6      Jim Spencer   Cal     AL 0.311</code></pre>

## 设定模型

```{r}
library(rjags)
# 需要先下载JAGS软件 http://mcmc-jags.sourceforge.net/
library(mcmcplots)

# Define Model
modelstring <- as.character("

model{


for (i in 1:n){

  # Normal model for the data
  y[i] ~ dnorm(theta[i], tau.e)
  
  # Hierarchical model on thetas
  theta[i] ~ dnorm(mu.theta, tau.theta)
  
  # JAGS为了便于程序运行采用精度(tau.e, tau.theta)代替方差，精度=1/方差
}


# Precision of the data
sigma.squared.e <- .004332
tau.e <- 1/sigma.squared.e

# Prior for the mean of thetas
mu.theta ~ dnorm(mu.mu.theta, tau.mu.theta)
mu.mu.theta <- .225
sigma.squared.mu.theta <- 0.00140625
tau.mu.theta <- 1/sigma.squared.mu.theta


# Prior for the precision and variance of thetas
# The between variation
nu.theta <- 14
sigma.squared.theta.0 <- .005
alpha <- nu.theta/2
beta <- nu.theta*sigma.squared.theta.0/2
tau.theta ~ dgamma(alpha, beta)
sigma.squared.theta <- 1/tau.theta

} # closes the model


") 

# data
y = data$y
n <- length(y)
jags.data <- list("y"=y, "n"=n)


entities.to.monitor <- c("theta", "mu.theta", "sigma.squared.theta")
```

## 设定MCMC算法初始值及迭代次数等

```{r}
## set initial value
theta.inits.1 <- runif(n,0,.1)
mu.theta.inits.1 <- .5
tau.theta.inits.1 <- 10

theta.inits.2 <- runif(n,.3,.4)
mu.theta.inits.2 <- .25
tau.theta.inits.2 <- 5

theta.inits.3 <- runif(n,.2,.3)
mu.theta.inits.3 <- .1
tau.theta.inits.3 <- 2


inits1 <- list(
  theta=theta.inits.1, 
  mu.theta=mu.theta.inits.1, 
  tau.theta=tau.theta.inits.1,
  .RNG.name = "base::Mersenne-Twister", 
  .RNG.seed = 10
)

inits2 <- list(
  theta=theta.inits.2, 
  mu.theta=mu.theta.inits.2, 
  tau.theta=tau.theta.inits.2,
  .RNG.name = "base::Mersenne-Twister", 
  .RNG.seed = 20
)

inits3 <- list(
  theta=theta.inits.3, 
  mu.theta=mu.theta.inits.3, 
  tau.theta=tau.theta.inits.3,
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
n.iters.total.per.chain = 21000
n.burnin=1000
n.iters.per.chain.after.burnin = n.iters.total.per.chain - n.burnin

```

## 运行模型

```{r}
# Initialize the model
# Write out the model to a file
model.file.name <- "MLM Batting Averages.txt"
write(x=modelstring, file=paste0(model.folder, model.file.name), append=FALSE)

jags.model.initialized <- jags.model(file=paste0(model.folder, model.file.name),
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
```

## 输出结果

```{r}
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
  summary.stats$quantiles, 
  matrix(HPD.interval, ncol=2)
)

colnames(summary.statistics) <- c(
  colnames(summary(jags.model.fitted)$statistics),
  colnames(summary(jags.model.fitted)$quantiles),
  c("95% HPD lower", "95% HPD Upper")
)

summary.statistics

```

<pre><code>##                            Mean          SD     Naive SE Time-series SE
## mu.theta            0.255173762 0.018922207 7.724959e-05   1.225250e-04
## sigma.squared.theta 0.004346767 0.001400844 5.718920e-06   7.858640e-06
## theta[1]            0.326399568 0.048106909 1.963956e-04   2.191328e-04
## theta[2]            0.315170010 0.047757021 1.949672e-04   2.115384e-04
## theta[3]            0.304353921 0.047339075 1.932610e-04   2.101726e-04
## theta[4]            0.293276482 0.047602936 1.943382e-04   2.114944e-04
## theta[5]            0.282663406 0.047071749 1.921696e-04   2.053742e-04
## theta[6]            0.282631916 0.047140697 1.924511e-04   2.068589e-04
## theta[7]            0.271846843 0.047256517 1.929239e-04   2.118792e-04
## theta[8]            0.261108151 0.046798861 1.910555e-04   2.017751e-04
## theta[9]            0.249883824 0.046911477 1.915153e-04   2.063737e-04
## theta[10]           0.249485200 0.047062363 1.921313e-04   2.056442e-04
## theta[11]           0.239168438 0.047147751 1.924799e-04   2.056612e-04
## theta[12]           0.239126998 0.047203921 1.927092e-04   2.058761e-04
## theta[13]           0.238920373 0.046917052 1.915381e-04   2.059900e-04
## theta[14]           0.238979978 0.047065016 1.921421e-04   2.076394e-04
## theta[15]           0.239258002 0.046963726 1.917286e-04   2.005167e-04
## theta[16]           0.228538865 0.047199226 1.926900e-04   2.115728e-04
## theta[17]           0.217595623 0.047108632 1.923202e-04   2.068574e-04
## theta[18]           0.206395030 0.047408021 1.935424e-04   2.112943e-04
##                            2.5%         25%         50%        75%
## mu.theta            0.217819920 0.242442404 0.255248715 0.26797996
## sigma.squared.theta 0.002342305 0.003359486 0.004102655 0.00506412
## theta[1]            0.234031792 0.293609635 0.325773725 0.35840285
## theta[2]            0.223355108 0.282846641 0.314444388 0.34662434
## theta[3]            0.212339316 0.272093763 0.304008351 0.33586997
## theta[4]            0.200932857 0.261117311 0.292739767 0.32510540
## theta[5]            0.190862347 0.250882159 0.282354911 0.31396076
## theta[6]            0.191657323 0.250679606 0.281942949 0.31429626
## theta[7]            0.178833166 0.240234452 0.271675431 0.30342162
## theta[8]            0.169285330 0.229822439 0.260975981 0.29271247
## theta[9]            0.157204739 0.218353147 0.250091396 0.28124948
## theta[10]           0.157128544 0.218055794 0.249598229 0.28105085
## theta[11]           0.145992914 0.207846306 0.239666752 0.27082340
## theta[12]           0.146476958 0.207537798 0.239375783 0.27075371
## theta[13]           0.145879558 0.207732205 0.239249335 0.27065585
## theta[14]           0.146456563 0.207349375 0.239157696 0.27063298
## theta[15]           0.146861177 0.207742095 0.239361470 0.27057448
## theta[16]           0.135496570 0.196830858 0.228741755 0.26012085
## theta[17]           0.123434659 0.186315400 0.218155503 0.24928713
## theta[18]           0.111729212 0.174830511 0.206908709 0.23875612
##                           97.5% 95% HPD lower 95% HPD Upper
## mu.theta            0.291794742   0.218367496   0.292234724
## sigma.squared.theta 0.007749149   0.002091304   0.007145648
## theta[1]            0.422408524   0.232281088   0.420184310
## theta[2]            0.411221099   0.220433377   0.407616128
## theta[3]            0.398142110   0.214921355   0.400469351
## theta[4]            0.387603973   0.201350051   0.387947020
## theta[5]            0.376058523   0.190405264   0.375353511
## theta[6]            0.375977901   0.192027351   0.376189585
## theta[7]            0.364680282   0.177384454   0.363094081
## theta[8]            0.352641759   0.169178697   0.352380001
## theta[9]            0.341980520   0.156562827   0.340932909
## theta[10]           0.341358222   0.157674460   0.341788988
## theta[11]           0.330769108   0.146457376   0.331179569
## theta[12]           0.331377906   0.147056626   0.331864403
## theta[13]           0.330216192   0.144819502   0.329044016
## theta[14]           0.331354655   0.144552059   0.329134058
## theta[15]           0.331341439   0.146365004   0.330653637
## theta[16]           0.321064203   0.136204345   0.321524939
## theta[17]           0.309320509   0.124160654   0.309892311
## theta[18]           0.297668282   0.110759627   0.296552728</code></pre>

## 后验分布图

还可以用下述代码绘制各参数的[后验分布图](MCMCoutput.html)，并检验算法是否达到收敛。

```{}
# Plot the results
mcmcplot(
  mcmcout = draws.to.analyze,
  filename = "MCMCoutput"
)
```


