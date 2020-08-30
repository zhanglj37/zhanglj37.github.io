# Latent Variable Interactions with Ordered Categorical Indicators

Ayturk, E.,  Cham, H., &  Brown, J. L.. (2019). Latent variable interactions with ordered-categorical indicators: comparisons of unconstrained product indicator and latent moderated structural equations approaches. *Educational and Psychological Measurement,* *80*(2):1-31. DOI: [10.1177/0013164419865017](https://www.researchgate.net/deref/http%3A%2F%2Fdx.doi.org%2F10.1177%2F0013164419865017)

[TOC]

## Purpose

- Comparison between UPI (unconstrained product indicator) and LMS (latent moderated structural equations) in latent moderation models.
- Studied four strategies to create sets of product indicators for UPI

#### Background

Although there are methods developed specifically to handle ordered-categorical variables in latent variable interaction modeling (e.g., Lee, Song, & Cai, 2010; Rizopoulos & Moustaki, 2008; Song & Lee, 2005), UPI and LMS still appear to be the most popular methods based on the citations on Google Scholar. 

Ref:

- Lee, S.-Y., Song, X.-Y., & Cai, J.-H. (2010). A Bayesian approach for nonlinear structural equation models with dichotomous variables using logit and probit links. Structural Equation Modeling, 17, 280-302. doi:10.1080/10705511003659425 

- Rizopoulos, D., & Moustaki, I. (2008). Generalized latent variable models with nonlinear effects. British Journal of Mathematical and Statistical Psychology, 61, 415-438. doi: 10.1348/000711007X213963 

- Song, X. Y., & Lee, S. Y. (2005). Maximum likelihood analysis of nonlinear structural equation models with dichotomous variables. Multivariate Behavioral Research, 40, 151-177. doi:10.1207/s15327906mbr4002_1

#### Parceling vs Matching in UPI

Matching: the indicators of the $\xi_1$ are  multiplied with those of $\xi_2$ . 

Three-matched-pair strategy: pair and multiply the three most reliable indicators of $\xi_1$ and $\xi_2$ according to their reliabilities. Before matching, all the indicators shall be mean-centered to increase the model convergence rates and reduce model specification complexity

The three-matched-pair strategy is disadvantageous in ignoring the remaining indicators of $\xi_2$ in representing the interaction term, which results in lower statistical power of the z test of the interaction effect compared with other matching strategies that use more product indicators. However, these matching strategies are not suggested because the model specification regarding the unique factors is more complex. 



Parceling to match the number of indicators of two latent variables for generating the interaction terms ($x_1z_1,x_2z_2...$)

Factorial algorithm:  the first parcel picks the indicators with the highest and lowest factor loadings. The second factor picks the indicators with second highest and second lowest factor loadings...

This strategy takes the advantage of the matching strategy in terms of the scaling identification and also the parceling strategy in terms of high statistical power to detect the interaction effect. Yang, Nay, and Hoyle (2010) found that parceling can reduce bias in parameter estimation when having categorical indicators. 

#### LMS

LMS builds on the ideas that (1) the interaction effect is a conditioned linear effect on another variable and (2) a weighted combination of conditional normal distributions can be used to approximate the multivariate distributions of the observed indicators.



## Highlights in the Simulation Study

Generation of categorical indicators: Under each distribution condition, the continuous indicators were standardized first, and then were categorized into five- and three-categories according to the thresholds used by Rhemtulla et al. (2012). 

Thresholds:   

- symmetric conditions: (-1.5, -0.5, 0.5, 1.5) , (-0.83, 0.83)
- moderately and severely skewed and kurtotic conditions: (0.05, 0.44, 0.84, 1.34), (0.58,1.13)

Four matching / parceling strategies in UPI:

- matching: three-matched-pair
- parceling
- two-matched-pair and one parcel (2M + P):  the two most reliable indicators of $\xi_1$ and $\xi_2$ were matched to create two product indicators and the least reliable indicator of $\xi_1$ was matched with the parcel of the remaining indicators of $\xi_2$ to create the third product indicator.
- one-matched-pair and two parcels (M + 2P)



It is appropriate to treat ordered-categorical indicators with five or more categories as continuous indicators in confirmatory factor analysis

Matching: UPI matching approach produced unbiased estimates of interaction effect with correct Type I error rates with N>=1,000 while it underestimated standard errors when the indicators were non-symmetrically distributed. 

Parceling:  produced unbiased estimates of the interaction effect with good coverage, and Type I error rates for all indicator type conditions (i.e., continuous, five-category, three-category) and across all sample sizes when the indicators were symmetrical. When the indicators were nonsymmetrical, UPI parceling models resulted in highly overestimated interaction effects, and low coverage rates with increased sample size (as low as 0.4%) in all conditions except with three-category severely skewed and kurtotic indicators. 

The new methods combined Matching and Parceling did not reach outstanding performance.

LMS approach performed similar to the UPI parceling approach

## Suggestions

Use a parceling strategy to create product indicators in the UPI approach or using the LMS approach when the categorical indicators are symmetrically distributed. 

Do NOT use UPI parceling or LMS when the indicators are skewed or kurtotic. 

Use UPI 2M + P for continuous skewed and kurtotic indicators with caution. It can produce suboptimal standard error estimates, Type I error rates, power, or coverage rates, depending on particular research conditions. 

## My Thoughts

Use instrumental variables when the indicators are skewed or kurtotic. Instrumental variables can also be used in UPI matching models to make use of all the indicators.



<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">RETURN</a></li>
</ul>			
</center>