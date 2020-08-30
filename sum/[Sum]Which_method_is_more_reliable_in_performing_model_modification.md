# Which method is more reliable in performing model modification

Yuan, K-H., & Liu, F. (2020). Which method is more reliable in performing model modification: lasso regularization or lagrange multiplier test? *Structural Equation Modeling: A Multidisciplinary Journal*. DOI:  [10.1080/10705511.2020.1768858](https://doi.org/10.1080/10705511.2020.1768858)

[toc]

## Backgroud

Lasso SEM **VS** Lagrange multiplier (LM) test in selecting the non-zero factor loadings 



LM test releases the constraint $v_j=0$ according to whether $\lambda_j$ is statistically significant, which is asymptotically equivalent to whether the corresponding $\lambda_j$ is statistically significant in a model with νj being freely estimated. In contrast, lasso SEM aims to release constraint  according to the absolute value of $\lambda_j$ in the estimation process

## Simulation Study Based on Real data

#### Model

47 items (49 non-zero loadings), 6 factors, 7-points 

The idea of using real data sets to validate a statistical method was used in MacCallum et al. (1992). 

- Different from MacCallum et al. (1992), the raw data set is transformed so that the “population covariance” matrix in our study is known and so are the locations and population values of the parameters in a correctly specified model. 

- We also used robust transformation to deal with nonnormally distributed data: M-estimation weights individual observations differently in estimating the population means and covariance matrix, and cases that are farther away from the center get smaller weights than those located near the center of the distribution of the sample. 

- N = 80, 100, 120, 150, 200, 300; At each sample size, 5 independent replications are drawn

(notes: a way to save time in simulation study .....)

Because it is time-consuming to conduct model modifications, MacCallum et al. (1992) used 10 replications and 4 model modifications for each replication in their study



#### Software

EQS for LM test; R package lslx for lasso sem

- Huang, P.-H. (2020). lslx: Semi-confirmatory structural equation modeling via penalized likelihood. Journal of Statistical Software, 93, 1–37. https://doi.org/10.18637/jss.v093.i07
- (note: this package can conduct multi-group set, but cannot conduct Bayesian sem)

LM test was baed on likelihood ratio statistic due to the approximate equivalence between the LM test and the likelihood ratio test

Lasso: For each sample, the set of non-zero loadings corre- sponding to the λ with the smallest BIC is recorded. The frequency of the correctly identified non-zero loadings across replications reflects the power of the lasso methodology



#### Evaluation criteria

- total number of parameters selected ($N_t$)
- 1 selected; 2 included in the 49 non-zero loadings set ($N_c$)
- $N_c/N_t$



#### Results

Lasso: 

- There are a few samples that the R package gives a warning that the algorithm did not converge, and these results are discarded. 

- for the total number of parameters selected, lasso SEM is rather sensitive to N.
- insensitive to non-normality and the robust transformation



LM

- performs more reliably under the robust transformation.





while LM test is not a reliable procedure to find a model that truly reflects the population relationship among variables, lasso SEM cannot deliver a sound model either. The results of this article indicate that lasso SEM is even less reliable than LM test in locating the truly non-zero parameters in the population.



If we choose the tuning parameter in the lasso method based on BIC rather than cross validation method, results may be different.



## My Thoughts

Variable selection using the Lasso method can also base on other criteria:

- other threshold (e.g., 0.1 rather than 0 which is used in this paper) of estimates 
- the significance of estimates (easier to obtain in Bayesian analysis rather than the NML estimation used in the current study) .

Future simulation studies should compare different ways of variable selection using lasso method.

( Based on the empirical study using blcfa package, the threshold of 0.1 has higher power than the criteria using HPD intervals. )



Comparison between Bayesian lasso and ML lasso

- different ways of selecting the tuning parameter
- different ways in variable selection
- different ways of estimation



The use of modification indexes in the simulation study of blcfa paper should also consider the siginificance test (likelihood ratio test) apart from the threshold (3.84) of modification index.

Our blcfa paper can also compare the lasso method with the post-hoc model modification method with non-normally distributed data.









<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>