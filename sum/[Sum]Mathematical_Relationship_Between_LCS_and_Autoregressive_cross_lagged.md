# On the Mathematical Relationship Between Latent Change Score and Autoregressive Cross-Lagged Factor Approaches: Cautions for Inferring Causal Relationship Between Variables 

Usami, S., Hayes, T., & McArdle, J. J. (2015). On the mathematical relationship between latent change score and autoregressive cross-lagged factor approaches: Cautions for inferring causal relationship between variables. *Multivariate Behavioral Research*, *50*(6), 676-687. <https://doi.org/10.1080/00273171.2015.1079696 >

[TOC]

## Causal Inference

philosopher David Hume summarized three conditions for identifying a causal relationship from A to B: 

- (1) A precedes B in time (temporal precedence), 
- (2) A and B are contiguous in space and time (contiguity),
- (3) A and B always co-occur or neither of them occurs (covariation; see Holland). 

Cook and Campbell (1979) also suggested three similar conditions of causality

- (1) temporal precedence
- (2) covariation between A and B
- (3) the exclusion of alternative explanations for cause-effect linkages.  

Rubin (1974) extended a counterfactual model from Jerzy Neyman’s work (Neyman, 1990) and proposed the potential outcomes model (alternatively referred to as the Neyman-Rubin-Holland model 

Granger causality, which originated in economics, emphasizes temporal precedence, unique effect, and inertia (or stability).  

## Models for causal inference

tested via the statistical significance of the causal path from A at timepoint t - 1 to B at timepoint t while controlling for B at timepoint t - 1. 

- Latent change score: extension of the latent growth curve model 
- Cross-lagged model: extension of vector autoregressive model

Unlike the LCS model, which incorporates information from both means and covariances, the ARCL model has been commonly used in longitudinal data analysis to examine change based on manifest variable covariances only 

McArdle (2009) noted that “This new change model [the bivariate LCS model] subsumes all aspects of the previous models [including the ARCL model] as special cases to be tested. We can fit the standard crosslagged factor model ... by eliminating the latent intercepts and the latent slopes” (p. 597). 

both the LCS model and the ARCL model are subsumed into the autoregressive latent trajectory (ALT) model  



## LCS

Relation between LCS and latent growth curve model:

![](fig/210405_1.png)



Equation

![](fig/210405_3.png)

![](fig/210405_4.png)

![](fig/210405_5.png)



Constraints in practice: 

no factor disturbance and time-invariant parameters

![](fig/210405_8.png)



## Relationship between LCS and cross-lagged

![](fig/210405_2.png)



![](fig/210405_6.png)

![](fig/210405_7.png)

Difference: 

The random effect assumption regarding the slope factor scores in the LCS model. 

Interpretation: the expected latent change scores (or increments between timepoints *t* − 1 and *t*) are the same among individuals who share not only the same latent true scores f_(yi(t-1))  and f_(xi(t-1)) but also the same slope factor scores.

Similarity: evaluate the causal precedence between variables, and both models have been commonly used for this purpose in longitudinal designs. 



Interpretation of the random effect

- From a standard interpretation, random effects depict moderators that are not included in the model. 
- an alternative interpretation of random effects on slope factor scores is the perturbation of error variances. As one reviewer commented, one taking a systems approach assumes perturbation and is unlikely to be interested in making a causal argument in the first place, which is different from standard behavioral research for causal inference.  

Model selection: next paper

due to a lack of prior empirical investigation in this area little is known about (a) what the best procedure is for model selection in this context, and (b) when and how often such discrepant results can occur. In forthcoming work (Usami, Hayes, & McArdle, in press) 

## Empirical Analysis

These examples illustrate how conclusions regarding causal precedence can differ dramatically between the LCS and ARCL models



**Difference in**  γ_y and γ_x across ARCL and LCS models

It is expected that high correlations between S_yi (S_xi) and f_(yi(t-1)) (f_(xi(t-1)))  can lead indirectly to unstable estimates of β_y (β_x) resulting from multicollinearity.

The standard errors of β_y (β_x) in the LCS model are about 10-20 times larger than those in the ARCL models



## Discussion

Recent work by Hamaker et al. (2015) insisted that cross-lagged models, which do not represent the actual within-person relationships over time, may lead to erroneous conclusionsregarding the presence, predominance, and sign of causal influences  

- lcs may be an alternative





<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>