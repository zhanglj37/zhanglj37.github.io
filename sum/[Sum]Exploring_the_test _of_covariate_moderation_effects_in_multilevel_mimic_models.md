# Exploring the Test of Covariate Moderation Effects in Multilevel MIMIC Models

Cao, C., Kim, E. S., Chen, Y.-H., Ferron, J., & Stark, S. (2019). Exploring the Test of Covariate Moderation Effects in Multilevel MIMIC Models. *Educational and Psychological Measurement*, *79*(3), 512–544. https://doi.org/10.1177/0013164418793490

[TOC]

## Introduction

- moderation effect at within level
- moderation effect at between level
- cross-level ↓

![](fig/210116_1.png)

Finch and French (2011) conducted one study to compare the performance of multilevel MIMIC models and standard MIMIC models (with one covariates) that did not take into account the nested data with one covariate occurring at the between level and the within level, respectively. Results indicated that it is important to take into account the nested structure of data in multilevel MIMIC models.

there have been no studies examining the performance of MIMIC models in estimating the effects of multiple covariates and their interaction on the latent factor in a multilevel SEM context

Purpose

- explore the performance of multilevel MIMIC models in estimating and testing the interaction effect
- provide applied researchers an empirical example of the detailed modeling process and results interpretation of interaction effect in multilevel MIMIC

## Simulation Study

Data generation: PROC IML in SAS/IML

two-level data with two dichotomous covariates, six indicators

- within level: factor variance @ 1
- between level: six loadings @ 0.8, residual variance @ 0.02, 0.01, and 0.004 for large, medium, and small ICCs

Manipulation

![](fig/210116_2.png)

Basis: Mathieu, Aguinis, Culpepper, and Chen (2012) conducted a review of studies published in the Journal of Applied Psychology involving tests of cross-level interactions, and they reported a within-level regression coefficient ranging between 2.06 and .45 and a between-level regression coefficient ranging between 2.23 and .35.

- moderation effect: 0, 0.3, 0.6
- **cross-level measurement invariance status**: all 0.8 in two levels, 0.8 and 0.6 in between level and within level

### Results

- multilevel MIMIC models performed well in detecting the interaction effect at the within or across levels. 
- However, when the interaction effect was at the between level, the performance of multilevel MIMIC models depended on the magnitude of the interaction effect, ICC, and sample size, especially cluster number.
- Regarding the impact of simulation factors on the performance of multilevel MIMIC models, ICC is worthy of note first
- Overall, cross-level measurement noninvariance did not make a notable impact on the estimation of interaction in the structural part of multilevel MIMIC models when factor loadings were allowed to be different across levels.

## Empirical Study

used seventh grade Longitudinal Study of American Youth (LSAY). LSAY aims to study the development of students’ attitudes toward and achievement in science and mathematics (Miller, 2010 ).

Miller, J. D. (2010). Longitudinal Study of American Youth, 1987-1994, and 2007: User Guide (ICPSR 30263). Ann Arbor, MI: Inter-university Consortium for Political and Social
Research.

## Discussion

Given the low power of multilevel MIMIC models in detecting the between-level interaction, aggregating data did not result in an obvious improvement of the performance.

- solution: researchers should be aware of the low power ...

## My Thoughts

This paper present a good example about how to consider the influence of measurement invariance when the main focus is not MI.





<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>