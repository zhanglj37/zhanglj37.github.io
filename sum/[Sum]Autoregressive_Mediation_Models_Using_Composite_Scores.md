# Autoregressive Mediation Models Using Composite Scores and Latent Variables: Comparisons and Recommendations

Zhang, Q., & Yang, Y. (2020). Autoregressive mediation models using composite scores and latent variables: Comparisons and recommendations. *Psychological Methods*, *25*(4), 472–495. https://doi.org/10.1037/met0000251

[TOC]

## Introduction

**Problem of cross-sectional mediation analysis**

- when concurrent variables are used in mediation analysis, causal relationship cannot be inferred because it takes time for causation to occur. 

**Solution**

- autoregressive mediation models (AMMs)
- sequential mediation model
  - still yield inaccurate mediation effect estimates because previous measures of the same variables are not appropriately controlled (Mitchell & Maxwell, 2013). 

**Two issues in applying AMMs**

- measurement errors
  - researchers tend to overlook the possible negative influence of measurement errors and longitudinal measurement non-invariance for conducting longitudinal mediation analysis.  
  - composite score (UCM); composite score with correction for reliability (CCM); latent variable modeling (LVM)
    - measure of reliability: composite reliability (based on measurement model)
- measurement invariance
  - The current study focuses on direct and indirect effects among latent factors that are measured by continuously distributed measurement indicators, and the mean structure is not relevant. For this reason, we do not consider the scalar invariance assumption in this study. 
  - Consequences of violating the longitudinal MI assumption: bias and misfit

**AMMs: As in Cole and Maxwell (2003), it is assumed that the system has reached** 

- stability (X, M, and Y do not show growth over time) 
- stationarity (the effects of X on M, M on Y, and X on Y, and the autoregressive coefficients of X, M, and Y remain the same at any fixed duration over time)
- equilibrium (the covariance matrix of X, M, and Y at any time point is the same) 

**Purpose**

- examine asymptotic estimation accuracy while using UCMs 
- examine conditions under which CCMs are able to yield asymptotically accurate direct and indirect effect estimates;  
- compare UCMs, CCMs, and LVMs 
- use an empirical example to demonstrate the procedure of fitting longitudinal mediation models, 

## Derivation

NMLE Estimates Based on Composite Scores With and Without Correction for Measurement Errors

**Asymptotic Bias of Parameter Estimates Under UCM** 

when $\alpha=$  .8, the value at whichr esearchers generally believe composite scores are reliable enough (e.g., Kaplan & Saccuzzo, 2009), the relative bias of the mediation effect aˆo*bˆo* is greater than 20% in magnitude 

**NMLE Estimates With an Infinite Sample Under CCM** 

the sum of loadings for items measuring a latent variable being invariant over time is sufficient to obtain asymptotically accurate NMLE estimates of direct and indirect effects using the reliability-corrected composite scores (or CCM).  

## Simulation Study

manipulation

- sample size
- number of time points
- effect size (a) a0  b0  c0 = 0; and (2) a0  b0 = .25, and c0  .15.  We selected these values based on R2 and Cohen’s f 2 (Cohen, 1988). 
- measurement model:
  - num of indicators
  - measurement invariance: satisfied; sum of loadings are equal across time for each latent variable, but
    loadings are unequal across time for some items of each latent variable; the sums of loadings are unequal across time for each latent variable. 
  - reliability 0.6, 0.8 (Specifically, with $\alpha =$  .6 and .8, when I  3, the measurement error variances are .98 and .37 )

derivation of data generation is interesting 



Results

**Performance of UCM**

When a0  b0  c0 = 0, parameter estimates did not deviate much from the population parameter values across conditions. This also agrees with our derivation results.  Otherwise serious bias

**Comparison between CCM and LVM**

When the sums of factor loadings were different over time, parameter estimates and coverage probabilities based on CCMs were also reasonable with zero and nonzero a0, b0, and c0.  even when measurement invariance is not satisfied

Patterns of results from LVMs were similar to those of CCMs 

**Influence of violation of measurement invariance and/or measurement errors**

CCM and LVM indicated better fit of the two models than UCM 

When number of timepoints or indicators increased, the Type I error rate or power also increased for all the three models  

Fit indexes of LVM were most sensitive to change in sample sizes. 

in terms of CCM, Scenarios 1 and 2 should both yield accurate estimates and thus reasonable fit. Because CCM is theoretically correct under both scenarios 



LVM allows for not only adjusting for measurement errors, but also the evaluation of longitudinal MI assumptions. 



## Discussion

Results showed that CCM and LVM performed better than UCM even when measurement errors were mis-specified to be uncorrelated 

The Type I error rate for the fit statistic of CCM was close to .05, whereas that for the LVM was severely inflated.  

Future study

- non-normality Because of the central limit theorem, composite scores tend to be normal even when each item has a non-normal distribution  



## My Thoughts

a good example to show how to consider so many problems in one study

the manipulation of measurement invariance is limited, which may help avoid complex and inexplicable results





<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>