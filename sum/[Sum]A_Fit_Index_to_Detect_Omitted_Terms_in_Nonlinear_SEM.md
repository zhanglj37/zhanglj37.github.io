# A Fit Index to Detect Omitted Terms in Nonlinear SEM

Gerhard, C., Büchner, R.D., Klein, A.G., Schermelleh-Engel, K.. (2017). A Fit Index to Assess Model Fit and Detect Omitted Terms in Nonlinear SEM. *Structural Equation Modeling: A Multidisciplinary Journal, 24*:3, 414-427, DOI: [10.1080/10705511.2016.1268923](https://doi.org/10.1080/10705511.2016.1268923)

[toc]

## Background



#### Chi-square test

Misspecifications due to omitted nonlinear terms cannot be readily detected by using the conventional chi-square test: 

- Mooijaart and Satorra (2009) showed that the con- ventional chi-square test is not able to detect omitted inter- action terms, and it has no power to identify this type of misspecification. (using PI (product indicators) method)

- If a linear structural equation model fits the data well according to the chi-square statistic, the underlying model might indeed be severely nonlinear. 

- However, to evaluate the fit of a nonlinear model, some researchers have recommended testing nonlinear models in a two-step estimation procedure (Maslowsky, Jager, & Hemken, 2015; Muthén, 2012): In a first step, a linear model with no nonlinear effects is tested to confirm a good fit in terms of the chi-square test. In a second step, the nonlinear terms are added, and the significance of a single or several nonlinear effects can be tested by the likelihood-ratio test statistic (Klein & Moosbrugger, 2000). 

#### $Z_{het}$ Measure (Klein and Schermelleh-Engel, 2010)

$Z_{het}$ is based on the comparison of the likelihood for the structural residuals under the assumption of heteroscedasticity with the likelihood for the structural residuals under the assumption of homoscedasticity. 

Limitations: need large sample size or very strong non-linear effects

#### $h_{het}$ Measure (Klein et al., 2016)

Test the heteroscedasticity of regression residuals.

Its particular advantage is that it can detect the heteroscedasticity of the regression residuals that has been generated not only by observed but also by unobserved predictor variables.

#### Purpose

Fit indexes, which are based on model comparisons, usually reach values between zero (indicating poor model fit) and one (indicating perfect model fit).

As the exact distributions of these descriptive measures are often unknown, inferential statistical testing is not possible. Instead of using a statistical test, it is common to use cutoff values (Hu & Bentler, 1999).

An advantage of a descriptive fit measure is that it quantifies the degree of fit along a continuum (cf. Hu & Bentler, 1999). 

Purpose: develop a fit measure (basen on $h_{het}$) that has some descriptive validity, rather than a strict test of model fit. It is desirable to obtain a measure that is scaled simultaneously to other known fit indexes in SEM.

## HOMOSCEDASTIC FIT INDEX (HFI)

In addition to omitted nonlinear terms, outliers in the data or misspecifications of the model equations are other potential sources of heteroscedasticity. 

$h_{het}$ is defined as a standardized estimator of kurtosis:

![](https://www.lijinzhang.xyz/sum/hhet.png)

The suitability of a one-tailed test for $h_{het}$

- It was confirmed that the asymptotic distribution holds for sufficiently large sample sizes (n ≥ 100). 

- Klein et al. (2016) demonstrated that if the population errors are heteroscedastic and sample size is very large, hhet is asymptotically greater than zero. 

- The critical value of $h_{het}$ for a one-tailed test and for α = 5% is z = 1.645.



A close descriptive fit with a value close to one indicates that the residuals in the structural part of the model are homoscedastic.  A value less than one indicates that the variance of the residuals of the target model is greater than the variance of a homo- scedastic model, which means that the residuals are het- eroscedastic. 

As cutoff values between .90 and .97 are common for descriptive fit measures based on model comparisons in SEM (Hu & Bentler, 1999; Schermelleh-Engel et al., 2003), the HFI uses a cutoff value of .95.

#### $h_{het}  -- HFI$

HFI = 1/($\alpha h_{het}$+1)

$\alpha$: scaling indicator = 0.032 to make sure the cutoff of HFI is approximately 0.95

all values of $h_{het}$ samller than zero are set at zero to calculate the HFI

## Highlights in Simulation Study

Model: two exogenous latent variable and one endogenous variable

- linear
- quadratic effect
- interaction effect
- one quadratic effect and one interaction effect
- two quadratic effect and one interaction effect
- linear model with nonnomally distributed error term
- linear model with nonnomally distributed exogenous varibale



Implementation of this HFI index:

- obtain the residuals for the structural part of the model in Mplus (by saving factor scores)

- calculate the HFI 



The HFI Type I error rates were close to the nominal α = 5% level across all conditions. 

Power is about 0.8 only when the sample size is large and the effect size of nonlinear term is large.



A two-step approach is recommended for researchers: In a first step, the researcher can assess the homoscedasticity of a latent model with the HFI measure. When the residuals are homoscedastic, the HFI value is close to one and it can be assumed that no strong nonlinear relationship has been overlooked.If the HFI indicates het- eroscedastic residuals, the second step entails searching for the source of heteroscedasticity. 

## My Thoughts

The logic of the introduction section is a little bit wired: The conclusion that chi-square is not appropriate under PI models cannot be extended to all the latent moderation models such as the LMS model. The simulation study in Maslowsky, Jager, & Hemken (2015) demonstrated that the power of chi-square test in LMS is more than 80% in most conditions.  Moreover, since the current study was based on LMS method, the results of chi-square test with PI method is not very appropriate to be used here as evidence to support the new HFI.

Learned a lot from the transformation of $h_{het}$ . The design of the population model is very comprehensive.







<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>