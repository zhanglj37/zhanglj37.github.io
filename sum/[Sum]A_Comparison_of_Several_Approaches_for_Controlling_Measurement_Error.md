# A Comparison of Several Approaches for Controlling Measurement Error in Small Samples 

Savalei, V. (2019). A Comparison of Several Approaches for Controlling Measurement Error in Small Samples. *Psychological Methods, 24*(3): 352-370.

[TOC]

## Introduction

Regression models can be viewed as a special case of PA models, although regression analyses are often performed in software that is incapable of fitting a PA model 

- influence of measurement error

unstandardized coefficients are impacted only by the measurement error in the predictor variables

whereas standardized coefficients are further impacted by the ratio of the measurement error in the predictor versus outcome variable. 



impact of ignorance (PA): a relation is zero using PA may produce a false-positive result much more often than 5% of the time. 

impact of consideration (SEM): It took sample sizes in the hundreds for the bias-variance trade-off to come down on the side of SEM estimates. 

- in small to medium samples, observed variable methods may be preferred over SEM when accurate estimation of relevant paths (rather than testing that certain paths are zero) is the goal (**There has been a renewed emphasis on estimation and away from significance testing in psychology (e.g., Cumming, 2014).** )
- Ledgerwood and Shrout proposed a solution that involves fitting both SEM and PA models, using SEM estimates for estimation and PA estimates for testing. However, this method is not ideal 

### Single-indicator models

other solution: intermediate models (Single-indicator models, correct composite model)

- the key issue is how to estimate the reliability of each observed composite: fix or estimate

estimate

- SI methods that estimate reliabilities from the data are not ideal. Estimates of alpha will vary from sample to sample 

fix (the suggestion of the current paper) at 0.7, 0.8 -values that are quite common in psychology (Nunnally & Bernstein, 1994). 

- If fixing reliability to an arbitrary value seems unreasonable, consider that regression analysis, it fixes the reliability of all observed variables to 1. 

why fix

- the inherent variability in the estimates of alpha may work against the SI approach in smaller samples. The fixed reliability SI approach represents a compromise between estimating reliability 
- in some situations, alpha or other internal consistency estimates may not be available or may not be appropriate.  (just one real indicator)



Previous studies

SEM produced the least biased estimates of latent regression coefficients, followed by SI, with PA performing the worst 

- However, Stephenson and Holbert did not examine the variability of the estimated regression coefficients under each model, focusing only on bias 

Type I error inflation has a curvilinear relation with reliability, peaking when reliability is in the .3 to .7 range. 

specified fixed-reliability SI model can maintain Type I error rates across different sample sizes 



Purpose

- do estimates obtained from SI models outperform PA and SEM estimates in smaller samples in terms of overall accuracy 
- how do estimates from different SI models fare relative to each other 
- how robust are the fixed-reliability SI models to misspecified reliability values 

## Simulation Study

latent mediation model

5 (sample size)  3 (size of the indirect effect)  2 (size of the direct effect)  3 (reliability of composites) factorial design  (with reference to Ledgerwood and Shrout (2011) )

The focus of this study is on small samples. Sample size was set to N  30, 50, 80, 100, or 200.  

The latent paths forming the indirect effect were set to equal and to take on the following values: a  b  .316, .548, or .707, so that the size of the indirect effect (ab) would be equal to .1, .3, or .5 

estimation: lavaan

SEM: all unstandardized loadings fixed to 1 to improve convergence

### Results

- Bias

Bias for PA is very high—it is almost always greater than 10%.  that bias remainsfairly high even when the reliability is .85 

For fixed-reliability SI methods, bias is generally acceptable in two of three reliability conditions.  

When the reliability is fixed to a lower value than it is, coefficients a and b are overestimated.  

- RMSE

SEM and SI produced very similar RMSEs.  

- coverage rate (**is a joint function of bias in the parameter estimates and the accuracy of the estimated standard errors.**  )

Three of the five methods (SI7, SI8, and PA) are biased 

SEM and SI perform very similarly and have good coverage, generally close to 95% 

for SI_fix, coverage may be lower than optimal because the variability due to  is not taken into account by the model 

- power

the fixed-reliability SI methods lost power relative to SEM/SI, sometimes drastically, when they underestimated reliability 

## Discussion

The results of this study suggest that the fixed-reliability SI method can be recommended when the following two conditions hold: (1) the sample size is small, and (2) one has a fairly good guess about the likely upper bound on reliability of all measures in the model.  

The biggest advantage of the fixed-reliability SI methods over other studied methods is when measures have low reliability 

- because in these conditions, SEM/SI lose the most power and PA is most biased.  

Westfall and Yarkoni (2016) recommend a sensitivity analysis for the fixed-reliability SI model, whereby a range of reliability values is used and results are compared. The results of this study suggest that when doing that 

## My thoughts

Bayesian estimation: strong prior on the residual variance without fixation





<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>