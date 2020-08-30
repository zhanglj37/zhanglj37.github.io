# Regularized Structural Equation Modeling to Detect Measurement Bias

Liang, X., Jacobucci, R. (2019). Regularized Structural Equation Modeling to Detect Measurement Bias: Evaluation of Lasso, Adaptive Lasso, and Elastic Net. *Structural Equation Modeling: A Multidisciplinary Journal*. Advance online publication. DOI: [10.1080/10705511.2019.1693273](https://doi.org/10.1080/10705511.2019.1693273)

[TOC]

## Purpose

Purpose: "investigate regularization methods for detecting various forms of measurement bias using restricted factor analysis (RFA) models, particularly in complex SEM models with relatively small sample sizes."

RFA model: $x_i = \Lambda\eta_i+Bv_i+C\eta_iv_i+\epsilon_i$

#### Measurement bias

"a violation of measurement invariance, conditional on the trait level"

Measurement bias can be classified into uniform bias (non-invariant intercept) and non-uniform bias (non-invariant intercepts and loadings). **The non-uniform bias manifested as non-linear interaction effects is less straightforward to test, because the interactions often times do not follow multivariate normal distributions.**

#### Regularization Method

Regularization methods have advantages over the traditional methods in small sample size conditions. Small sample size problem: "In a review of 194 studies including 1,409 confirmatory factor analysis models by Jackson, Gillaspy, and Purc-Stephenson (2009), 25% of the models consisted of more than 24 observed indicators and 20.3% of the models used sample sizes less than."

Selection of shrinkage parameter in likelihood-based estimator: 

- bootstrapping method
- cross-validation: mean square error or information criteria

$\lambda*P(\theta)$

- ridge: $P(\theta)=\sqrt{\sum_j\theta^2}$
- lasso: $P(\theta)=\sum_j{|\theta|}$
- adaptive lasso: $P(\theta)=\sum_j|\theta_{MLE}^{-1}\theta|$ where $\theta_{MLE}^{-1}$ represents weights
- elastic net: $P(\theta)=(1-\alpha)\sqrt{\sum_j\theta^2}+\alpha\sum_j|\theta|$

 not included in the current paper:

- spike and slab: $\beta_u$~$N(0,\sqrt{\sigma_1^2\pi_u+\sigma_2^2(1-\pi_u)})$ where $\pi_u$~$Beta(a_u,b_u)$
- aBSS-Lasso: spike and slab + lasso: using laplace prior rather than the normal prior in spike and slab regularization method

minimax concave penalty (MCP; Zhang, 2010) is efficient in detecting measurement bias, yielded a good balance between true and positive rates compared with lasso and MLE



Reference of Regularization methods in multi-group structural equation modeling

- Huang, P. H. (2018). A penalized likelihood method for multi-group structural equation modelling. *British Journal of Mathematical and Statistical Psychology, 71*, 499–522.
- Finch, H. (2018). Comparison of measurement invariance testing using penalized likelihood and maximum likelihood estimators: A Monte Carlo simulation study. *General Linear Model Journal, 44*, 20–33.
- Lindstrøm, J. C., & Dahl, F. A. (2020). Model selection with lasso in multi-group structural equation models. *Structural Equation Modeling: A Multidisciplinary Journal. 27*(1): 33-42. 

## Highlight in the simulation study

#### Study 1: simulation study

model: one factor $\eta$ with 16, 48, and 80 continuous items, one covariate variable $v$ and an interaction between factor $\eta$ and $v$; loading: 0.7; correlation between $\eta$ and $v$ = 0; proportion of biased items: 25% or 50%

size of bias: 0, 0.176, 0.333 accounting  0%, 3% and 10% of the total variance in an item, referred to as no bias, small bias, and large bias, respectively (Jak, Oort, & Dolan, 2013).

R package lavaan and regsem

shrinkage parameter $\lambda$: starting from zero with a 0.05 increment, BIC;  $\alpha$ in the elastic net method: fixed at 0.5

determination of the significance of the bias estimates: MLE (Wald test with 0.05 alpha level); regularization method (Threshold of 0 since the standard errors are difficult to obtain)



Results

the enet yielded greater true positive rates than the lasso and alasso, but also resulted in more inflated false positive rates. The alasso produced slightly greater true positive rates and lower false positive rates than the lasso when only one type of biases (uniform or non-uniform) was present.

MLE performed comparably on true positive rates in most conditions, but was inferior when both biases were present in 25% of the items with small sample sizes

RMSE appeared to be affected the most by the sample size, but not markedly by other factors. MLE yielded the lowest RMSE.

#### Study 2: empirical illustration

both BIC and AIC were used to guide the selection of the best fitting regularized model. Root mean square error of approximation (RMSEA; Steiger & Lind, 1980) was also reported as a model fit measure.

BIC has higher penalty strength on the complex model than AIC. 

MLE did not provide a convergent solution while regularization was able to handle complex models by forcing a number of parameter estimates to zero.

## Discussion

suggestion:

- small sample size: enet 
- focus on controlling the false positive rate: alasso
- focus on the overall model estimation for biased item: MLE

Bias detection based on penalized estimates does not rely on inferential procedures
comparing to MLE.

global penalization is imposed on all parameters without controlling for the recovery of local signals: both the noise and signal parameters were penalized the same amount toward zero

## My Thoughts

Regularization methods in multi-group structural equation modeling can be extended in Bayesian framework. Since p-value and standard error are easier to obtain in Bayesian regularization methods compared to the likelihood-based estimator. 

Need to figure out the minimax concave penalty (MCP; Zhang, 2010)



Summarize the application method (prior selection for cross-loadings / covariance matrix) using different regularization method in Bayesian analysis.

- ridge: normal prior for cross-loadings, inverse-wishart prior for covariance matrix (Muthén & Asparouhov, 2012)
- lasso: Laplace prior
- spike and slab: $\beta_u$~$N(0,\sqrt{\sigma_1^2\pi_u+\sigma_2^2(1-\pi_u)})$ where $\pi_u$~$Beta(a_u,b_u)$
- aBSS-Lasso: Laplace prior + Beta prior



The principle of elastic net method is similar to the DLS estimator which can deal with non-normally distributed data.



Comparison between different regularization method: 

- use regularization method as the variable selection tool and re-analyze the model again with selected parameters (without regularization method). Solve both the problem of overestimating standard error in traditional method and the limitation of bias estimates in regularization method?
- different threshold: 0.1



Power is more important than Type I error rate in modifying the parameters not of interest: Because missing these parameters will lead to bias estimates of other parameters of interest?



RFA model with binary $v_s$ (dummy coding the group) can be used to test measurement invariance. 



Jacobucci, R., & Grimm, K. J. (2018). Comparison of frequentist and Bayesian regularization in structural equation modeling. *Structural Equation Modeling: A Multidisciplinary Journal, 25*, 639–649.





<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>