# A Review of Bayesian Variable Selection Methods: What, How and Which 

 O'Hara, R. B. , &  Sillanpää, M. J. . (2009). A review of Bayesian variable selection methods: what, how and which. *Bayesian Analysis, 4*(1), 85-117.

[TOC]

## Backgroud

**How to inflate the meaning of study**: "An important problem in statistical analysis is the choice of an optimal model from a set of a priori plausible models. In many analyses, this reduces to the choice of which subset of variables should be included into the model.  ...In the Bayesian framework, ...this question is asked in variable-speciflc form: i.e. the task is to estimate the marginal posterior probability that a variable should be in the model. " 

Model: confirmatory or exploratory

"exploratory: seeing what the analysis throws out from a large number of candidates. This is not always an unreasonable approach. "  this paper examines diﬀerent options for the exploratory case where the prior may be leptokurtic.



Purpose: illustrate how to implement different variable selection methods with BUGS code available and compare these methods: Gibbs Variable Selection (GVS), Stochastic Search Variable Selection (SSVS), adaptive shrinkage with Jeffrey's prior or a Laplacian prior, reversible jump MCMC.



We do not consider some methods, such as Bayesian approximative computational approaches (e.g. Ball 2001; Sen and Churchill 2001) or **methods based on calculating model choice criteria, such as DIC** (Spiegelhalter et al. 2002), because these are only feasible to use with a maximum of dozens of candidate models. We also omit the machine learning literature focusing on finding maximum a posteriori estimates for parameters (e.g. Tipping 2004)



**worth-reading**

Miller, A. (2002). Subset Selection in Regression. Boca Raton, Florida, U.S.A.: Chapman & Hall/CRC. 

Tipping, M. E. (2004). \Bayesian inference: an introduction to principles and practice in machine learning." In Bousquet, O., von Luxburg, U., and R˜atsch, G. (eds.), Advanced Lectures on Machine Learning, 41{46. Springer.

## My Thoughts

The way of story telling can be used for my thesis.



<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>