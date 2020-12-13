# Exploratory Mediation Analysis of Dichotomous Outcomes via Regularization 

Serang, S., & Jacobucci, R. (2020). Exploratory Mediation Analysis of Dichotomous Outcomes via Regularization. *Multivariate Behavioral Research*, *55*(1), 69–86. <https://doi.org/10.1080/00273171.2019.1608145>

[TOC]

## Intro

Purpose: extend XMed method into dichotomous outcomes, including both mediators and dependent variables



Parallel multiple mediator model (Hayes, 2013) allows us to compare the relative influences of the mediators to each other.

Psychological processes rarely have a single well-defined mediator with a large effect; more often, many mediators exist with smaller effects.

**The underlying consumption of  confirmatory approach:**

To make these causal inferences, the methods assume that the model is properly specified and that there are no unmeasured confounders (VanderWeele & Vansteelandt, 2014)

In psychological studies, this ideal is rarely realized in practice

**Exploratory mediation analysis**  

MacKinnon (2008)

1. parallel model to detect mediators 2. reanalyze withthe subset of sig mediators 

The use of statistical significance, which is built on confirmatory philosophy, still carries with it some concerns when used in an exploratory context. One is the potential to overfit the data, leading to less generalizable solutions (Babyak, 2004; McNeish, 2015).

XMed

The purpose of this second stage is to provide unattenuated estimates of the effects to allow the researcher to better judge the relative influence of each potential mediator. 

identified true mediators more often regardless of sample size, strength of effect

XMed only required half the sample size relative to the p value methods 

**Dichotomous outcomes**

Step 1, select mediators: the lasso has been applied to logistic regression as well (Lokhorst, 1999). 

Cross-validation is used to choose optimal values of each kj (one for each mediator)

shrink a and b separately through simple regression model (x->m, m->y)

Those potential mediators with specific indirect effects greater in absolute value than a small number e (e.g., 0.001) will be selected 

![](fig/201123_1.png)

Step 2, reanalysis: probit regression,  in which the observed dichotomous outcome Yi is an indicator of a normally distributed continuous latent variable

estimation: WLS

**Software implementation**

Step 1: glmnet package (Friedman, Hastie, & Tibshirani, 2010) embedded in regsem

iteratively optimizes the functions in (7) and (9) with respect to each parameter while holding the others fixed until it converges upon a solution. 

glmnet require more than one independent variables, this is not the case for x->m paths. Solution: generate phantom variables (=1, var = 0) and fix the intercept of m at 0 to identify the model

**Role of XMed**

even if XMed were to identify a variable as a potential mediator, this does not necessarily imply that the variable is a mediator at all.

it could be caused by the independent and dependent variables, or it could be a confounder of the relationship between the independent and dependent variables. Neither XMed nor any other statistical approach can differentiate between these alternatives

## Simulation Study

Following the recommendations of Cohen (1988), we used values of 0.14 for small effects, 0.39 for medium effects, and 0.59 for large effects as these are commonly used in the mediation literature (Fairchild, MacKinnon, Taborga, &
Taylor, 2009; Zhang, 2014).

Model: symmetric (with dichotomous variables) and asymmetric  (without)

Traditional estimator: Sobel, percentile bootstrap and bias-corrected bootstrap

**accelerated bias-corrected bootstrap**  percentile bootstrap and bc-bootstrap are both the special cases of abc bootstrap

**Criteria**: sensitivity (true positive rate), false positive rate  



The Sobel test had the lowest sensitivity of all methods tested. 

the other methods generally required over double the sample size to achieve the same sensitivity as XMed. 

Results for dichotomous mediators showed similar patterns, though the overall sensitivity across all methods was lower than that of the continuous mediators

The conventional methods did have some minor differences in performance between them.

conventional methods hardly ever identified a false positive, with rates at or below 0.010

Examining the results in the asymmetric condition, false positive rates were much higher when the aj paths were nonzero, than the bj paths. (Because each aj path is a separate regression, each path receives its own tuning parameter. As such, when these paths were truly zero, they were shrunken accordingly. For bj paths however, only a single tuning parameter is used. )

## Illustrative example 

different results between step 1 and step 2

When fitting the second stage, the SEM program used will inevitably report standard errors, p values, and/or confidence intervals for the stage 2 estimates. However, since they were calculated as part of a multi-stage procedure, these statistics are not correct and should be ignored. 

## Discussion

XMed achieves these improvements in sensitivity at the cost of an increase in false positive rate.

The conventional methods, however, have a fixed nominal false positive rate (in theory, a, the pre-specified rejection region) and therefore cannot make this tradeoff. 

interaction effect: if one believes that an effect could potentially be mediated by the product of two mediators, one must create a new variable in the dataset

One limitation of the current work is that the mediators were simulated to be uncorrelated.

**Exploratory modeling** 

in circumstances where little is known about the mediation process of interest it is challenging to specify models based on theory or substantive expertise alone. 

## My thoughts

kind of adaptive lasso rather than lasso

even cannot provide interval estimation, estimates of standard errors in step 2.....

The conventional methods can make this tradeoff by changing alpha

<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>