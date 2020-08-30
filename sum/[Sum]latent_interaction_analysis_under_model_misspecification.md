# latent interaction analysis under model misspecification

Brandt, H., Umbach, N., Kelava, A., & Bollen, K. A. (2019). Comparing estimators for latent interaction models under structural and distributional misspecifications. *Psychological Methods.* Advance online publication. [https://doi.org/10.1037/met0000231](https://psycnet.apa.org/doi/10.1037/met0000231)

[TOC]

## Purpose
Compare different estimators for nonlinear SEM with interaction effects and to investigate how they perform under misspecification.
- Distributional misspecification

  Non-normality under ML estimation

- Structural misspecification

  cross-loadings and residual covariances


## Estimators
### Two-stage method of moments estimator (2SMM; Wall & Amemiya, 2003)

Factor scores approach
- First stage: estimates factor scores (Bartlett factor score, can be obtained in lavaan package) using confirmatory factor analysis

- Second stage: regression model using the moments equations (Wall & Amemiya, 2003)

  $η=α_η+γ_1 ξ+γ_2 h(ξ)+γ_3 x_0+ζ$ 

  $x_0:covariates,h(ξ):interation$

  $e.g., h(ξ)=ξ_1 ξ_2$

Normality assumptions exsist in stage 1 and 2

lavaan & moments equation

### The nonlinear structural equation mixture model approach (NSEMM; Kelava et al., 2014)
Takes nonnormality into account by using a mixture model for the latent factors.

Principle: a skew distribution can be decomposed into several normal distributions

For example:
![1589979771646](fig/sum_200520.png)
$ = 1/5N(0,1) + 1/5N(1/2,1) + 3/5N(13/15,5/9)$

For latent predictors:

$\xi = \sum_c{w_c*\xi_c}$

$w_c: weight,\xi_c$ ~ $MVN(k_c,\phi_c)$

$\eta_c=α_{ηc}+γ_{1c} ξ+γ_{2c} h(ξ)+γ_{3c} x_0+ζ_c $

For interpretation, all parameters except of $k_c$ and $Φ_c$ for the latent predictors’ distribution are constrained as class-invariant in this paper.

Two or three mixture components are often sufficient to account for the nonnormality but can also be tested using information criteria.

Mplus

### Product indicator (PI) approaches
Unconstrainted Product indicator (PI) approaches (Marsh et al., 2004)

Suppose each latent variable $X(\xi_1)$, $Z(\xi_2)$ and $Y(\eta)$ has three indicators $(x_1-x_3, x_4-x_6, y_1-y_3)$.

latent interaction variable can be represented by product indicators(PIs):
- matched pairs: $x_1*x_4, x_2*x_5, x_3*x_6$
- all-pairs:  $x_1*x_4, x_1*x_5, x_1*x_6, x_2*x_5.....etc$

Normality assumption: is always violated in the UPI approach due to the PIs even if the indicators themselves are normally distributed

Mplus

### Model-implied instrumental variables two-stage least squares (MIIV-2SLS; Bollen, 1995)
Suppose each latent variable $X(\xi_1)$, $Z(\xi_2)$ and $Y(\eta)$ has three indicators $(x_1-x_3, x_4-x_6, y_1-y_3)$.

- scaling indicators: $x_1, x_4, y_1$

- instrument indicators: $x_2,x_3,x_5,x_6,x_2*x_5,x_2*x_6,x_3*x_5,x_3*x_6,x_0$

  

- use instrument indicators to predict the scaling indicators

- use the predict scores of scaling indicator as a “proxy” for the latent variable

$y_1=a_\eta+\xi_1 x_1+\xi_2 x_4 + \xi_3 x_0 + \xi_4 x_1x_4 + u$

in which $u$ is correlated with $x_1$ and $x_4$, the predict scores of scaling indicators are supposed to solve this problem

Assumptions:
- If any of the MIIVs correlate with the error, then this implies a structural misspecification in the model and raises the potential for biased estimates.
- It is very important to test this assumption, for example, using overidentification tests Model.

AER package

## Highlight Methods and Results

### Data generation

structure misspecification: 

single cross-loadings or single residual covariance, scaling indicator is unvovled in the misspecification in half of the situdations 

distribution misspecification: 

- Use the moment equations provided by Fleishman (1978) and Vale and Maurelli (1983) to generate multivariate (non)-normal distributions with prespecified univariate moments.
- We tested alternative procedures in order to ensure that the data generation mechanism did not influence the test design  (Foldnes & Olsson, 2016)

### Diagnostic tests
2SMM & UPI：Modification index in the measurement model.
- power is acceptable when the misspecification is medium or the sample size is large.

MIIV-2SLS: Overidentification test  (Sargan, 1958).
- power is unacceptable when the scaling indicators are invovled in the misspecification.


### Highlight Results

MIIV-2SLS approach was robust against misspecifications as long as the misspecification did not involve the scaling indicator of the outcome variable.

For NSEMM, the nonnormality induced an additional bias for the interaction effect under the low reliability condition that did not occur for the other two approaches.

When the scaling indicator was involved in the structural misspecification2, we found large biases across all estimators. The bias in the MIIV-2SLS estimates did not spread to other parameters for the omitted factor loading, but was more spread out for an omitted unique factor covariance.

Overall, 2SMM provided the lowest relative RMSE for the interaction effect. MIIV-2SLS produced the lowest relative RMSE for the linear effects when the misspecification did not affect the scaling indicator.



## My thoughts

The settings of structure misspecification (Just omitting one cross-loadings or residual covariance) is too simple to represent the complicated practical situations.

Even in these simple misspecification conditions, the bias of structural parameters are often unaccepting. It implies the importance of two things: the robustness of estimators, the detection method of model misspecification.

Regularized cfa are supposed to perform the detection of model misspecification.





<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>