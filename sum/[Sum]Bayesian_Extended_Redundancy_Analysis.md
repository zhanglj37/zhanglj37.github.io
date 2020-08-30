# Bayesian Extended Redundancy Analysis

Choi, J.Y., Kyung, M., Hwang, H., Park, J.H.. (2020). Bayesian Extended Redundancy Analysis: A Bayesian Approach to Component-based Regression with Dimension Reduction. *Multivariate Behavioral Research, 55*(1): 30-48. https://doi.org/10.1080/00273171.2019.1598837

[TOC]

## Purpose
To make use of the advantages of Bayesian analysis, this paper extended the extended redundancy analysis (ERA) into the Bayesian framework (BERA).

## Extended Redundancy Analysis

Function: dimension reduction and linear regression.

Reduces predictors to a smaller number of new variables, that is, components or weighted composites of the predictors.

Can be regarded as a special form of structural equation modeling. (items: observed variables; factors: composites of the predictors)

### Principle of frequentist ERA

$$
Y = FA+ E = XWA + E
$$

F: components
X: predictors
W: weights
A: matrix of regression coefficients

Estimation: minimize the residual sum of squares using alternating least squares algorithm: (1)  update W for fixed A (2) update A for fixed W, repeat (1) and (2) until convergence

**? Uncertainty of positive/negative W/A: non-convergence in Bayesian analysis**

### Comparison with Other Dimension Reduction Methods

#### Principal component regression
- extracts components which account for as much variation of the predictors as possible

- correlations between predictors and outcome variables are not considered

#### Partial least squares regression
- estimate component weights for predictors to obtain the components are maximally associated with the outcome variables

- is difficult to understand how the algorithm works theoretically and to generalize PLSR to handle a more variety of problems

#### ERA
- the way of extracting components is similar to the PLS methods

Different from PLS:

- the algorithm used in estimation

- one set **VS** multiple sets of predictors and reduces each set into a component based on some substantive theories. (Theory driven rather than data driven)


## Bayesian Extended Redundancy Analysis

**Answer to the ? : to avoid the potential sign-switching between W and A, we fix signs of W to the sign of a weight estimate that yields the strongest association with outcome variables.**

### Priors

#### Conjugate priors
- can be derived as the same known family of the prior distribution
- with a large valued variance of the prior distribution, these conjugate priors become non-informative or diffuse priors with no concern of an improper posterior distribution.
- easy to implement for the applied researchers

#### Power priors (Ibrahim & Chen, 2000)

combine the information of previous research:

$$
\pi(\theta | D_0, \delta) \varpropto L(\theta | D_0)^{\delta} \pi_0(\theta | c_0)
$$

$L(\theta | D_0)^{\delta}$: the likelihood for the historical data $D_0$ given a set of parameters $\theta$

$\pi_0(\theta | c_0)$:initial prior distribution , $c_0$ hyperparameter

$\delta$: [0,1], a weight that controls for the influence of the historical data on the current data, 1: equal weights to the previous data and the likelihood of the current data

multiple historical datasets: $\delta_m$

hyperprior of $\delta$: a beta prior, a truncated gamma prior, or a truncated normal prior, consider few possible values of d based on theory for interpretation purposes (need sensitivity analyses)

### Advantages

- easy to calculate the 95% highest posterior density (HPD) **VS** using the re-sampling method to obtain the 95% bootstrap confidence interval in the tradition method

- using prior to combine the information of previous research

- flexible in handling missing data with data augmentation method



## Highlights in Simulation and Empirical Studies

Proportion of missingness in the two outcome variables: 0, 0.3, 0.5

To compare with the frequentist method, BERA was applied with and without imputation, with and without informative priors.


## My thoughts
#### More data driven than structural equation modeling (SEM)

- considering the regression parameters when estimating the "loadings"
- the direction of arrows between f and x represents the definition of f
- saturated regression model: no model fitting index like CFI, TLI

#### The repetition of the estimation of W and A is possible to be extended into SEM

- estimate the residual covariances and maximize the loadings simultaneously (avoid the bias estimation of loadings when relaxing the residual covariances constraints)





<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">RETURN</a></li>
</ul>			
</center>