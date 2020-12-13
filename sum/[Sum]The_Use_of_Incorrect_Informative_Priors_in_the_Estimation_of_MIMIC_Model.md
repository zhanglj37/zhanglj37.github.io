# The Use of Incorrect Informative Priors in the Estimation of MIMIC Model Parameters with Small Sample Sizes 

Finch, W. H., & Miller, J. E. (2019). The Use of Incorrect Informative Priors in the Estimation of MIMIC Model Parameters with Small Sample Sizes. *Structural Equation Modeling: A Multidisciplinary Journal*, *26*(4), 497–508. <https://doi.org/10.1080/10705511.2018.1553111>

[TOC]

## Introduction

- The small sample size problem in SEM (approximately 18% of publications in the field fit SEMs using samples of 100 or fewer (MacCallum & Austin, 2000))

- The advantages of Bayesian estimation with small sample size , especially for informative priors

one cannot merely change a line of code in an estimation program from “ML” to “Bayes” and thereby receive the full benefits of using the Bayesian approach (McNeish, 2016a).

Given that in practice it may be unusual for a researcher to have exactly accurate prior information regarding the values of the MIMIC coefficient and factor loadings, it is of particular interest to consider the case when incorrect priors are used for these parameters.

Studies about the influence of incorrect informative prior selection in SEM

Depaoli (2014)  Latent growth mixture models

Shi and Tong (2017) Latent basis growth models



The use of diffuse priors may have an even more adverse effect on parameter estimation (Depaoli, 2014; McNeish, 2016a, 2016b) (Note: compared to ML estimation)

### MIMIC model

includes paths linking latent variables with one or more observed covariates.

gained in popularity as a research tool because of its utility in such a wide variety of research contexts (Thompson & Green, 2006). 

- comparison of group means on a latent variable (Thompson & Green, 2006), 
- the conduct of regression analyses linking latent and observed variables (Muthén, 1988), 
- the detection of differential item functioning (DIF) in educational and psychological testing (Finch, 2005).



Purpose

investigate the impact of using incorrect informative priors on the estimation of  MIMIC model

- extend previous work to a different study
- answer the call from Depaoli to investigate nonmixture latent variable models
- include a wide range of small sample size

## Simulation Study

one factor with 5/10/20/30 items, and one covariate

sample size: 30, 40, 60, 80, 100, 120, 140, 160, 180, 200

priors for loadings and path coefficients (Depaoli, 2014)

- correct informative priors: drawn from the normal distribution where the mean of the prior was set equal to the data generating value and the standard deviation set to 0.1
- incorrect informative priors: mean was 1, 2, 3 sd away from the data generating mean, sd of prior for loadings: 0.7

Results

incorrect informative priors with somewhat larger variance than is typical, yields more accurate parameter estimates than do naïve priors, or maximum likelihood 

## Discussion

results suggest that a researcher is better off using informative priors for the covariate, rather than noninformative priors, even when those priors are as much as three standard deviations away from the actual population value.

### Recommendations

use informative priors (even incorrect) for key parameters

when faced with a sample of fewer than 100, a researcher is probably best served by using an MCMC estimator with informative priors for the target parameter(s), rather than the ML or naïve priors Bayes estimator.





<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>