# The horseshoe estimator for sparse signals

Carvalho, C.M. , Polsin, N. G., & Scott, J.G. (2010). The horseshoe estimator for sparse signals. *Biometrika, 97*(2): 465-480. 

[toc]

## The proposed estimator

$y | \theta\sim N(\theta,\sigma^2I)$

If $\theta$ is believed to be sparse:

$\theta_i|\lambda_i\sim N(0,\lambda_i^2), \lambda_i|\tau\sim C^+(0,\tau), \tau|\sigma\sim C^+(0,\sigma)$

$C^+$ Is a standard half-Cauchy distribution. (If the software does not support this prior, Truncated t (, , 1) distribution is equivalent).

"Each $\theta_i$ is mixed over its own $\lambda_i$, and each $\lambda_i$ has a half-Cauchy prior with common scale $\tau$. We assume Jeffreys' prior for the variance, $p(\sigma^2)\propto1/\sigma^2$"

The name of horeseshoe prior arises from the observation that, for fixed values $\sigma^2=\tau^2=1$:

The posterior of $\theta$: $E(\theta_i|y)=\int_0^1(1-\kappa_i)y_ip(\kappa_i|y)d\kappa_i =\{1-E(\kappa_i|y)\}y_i$, where $_i\kappa=1/(1+\lambda_i^2)$

The half-Cauchy prior on $\lambda_i$ implies a horseshoe-shaped Be(1/2,1/2) prior for the shrinkage coefficient $\kappa_i$



Unlike other similar procedures, the horseshoe prior is free of user-chosen hyperparameters, since the priors for $\lambda_i,\sigma$  are all fully specified without additional inputs

 The sparse normal-means problem, while simple, can be thought of as a proving ground for methodology aimed at solving many of the common challenges in modern statistics, such as regression, classification, function estimation and regularization of covariance matrices.



![image-20200824143742159](fig/image-20200824143742159.png)



## Similar methods

local shrinkage rules vs global shrinkage rules that have only a shared global scale parameter

### The discrete mixture prior

$\theta_i\sim wg(\theta_i)+(1-w)\delta_0, \lambda_i\sim wh(\lambda_i)+(1-w)\delta_0$

### The Student-t prior

$\theta_i \sim t_\xi (0,\tau), \lambda_i^2 \sim IG(\xi/2,\xi\tau^2/2)$

Assumption: $\xi --> 0$

### The double-exponential prior

$p(\lambda_i^2|\tau^2)=(2\tau^2)^{-1}exp\{-lambda_i^2/2\tau^2\}, \tau^2 \sim IG(\xi/2, \xi d^2/2)$

![image-20200824144855838](fig/image-20200824144855838.png)

## Simulation study

Our results show the double-exponential prior systemat attribute this to the two features: that exponential tails are insufficiently heavy to estimate large signals when noise is present, and that a pole at zero aids in reducing the substanstial amount of noise in these problems 

The horseshoe prior also systematically beats the the default normal-exponential-gamma priors.

## My Thoughts

How to choose between many regularization methods? cross-validation method with RMSE, BIC...(similar to the method for choosing shrinkage parameter in frequentist regularization method) ?









<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>