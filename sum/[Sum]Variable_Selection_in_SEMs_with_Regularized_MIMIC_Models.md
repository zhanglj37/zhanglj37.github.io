# Variable Selection in Structural Equation Models with Regularized MIMIC Models

Jacobucci, R., Brandmaier, A., & Kievit, R. (2019). A practical guide to variable selection in structural
equation models with regularized MIMIC models. *Advances in Methods and Practices in Psychological*
*Science, 2*, 55-76.

[TOC]

## Backgroud

large predictors, small sample size problem



variable selection: from the notorious stepwise variable selection procedures (cf. Thompson, 1995) to more complex and comprehensive approaches such as support vector machines or random forests.



ridge, lasso, and elastic net

lasso: perfroms better in variable selection

Ridge regularization: better handles multicollinearity among predictors.

-- > elastic net



"Non-zero coefficients can be thought of as important (e.g. see Laurin, Boomsma, & Lubke, 2016). This stands in stark contrast to the use of p-values, as using regularization to label parameters as important does not rely on any asymptotic foundations (it does not make statements with regards to a population). In particular, since the regularized estimates move away from the point of maximum likelihood, asymptotic distributions of parameter estimates do not hold anymore."



regsem

![practical_guide_regsem](fig/practical_guide_regsem.png)





Purpose: examine the possible benefits of regularization in the Multiple Indicator, Multiple Causes model (MIMIC) models



## Simulation Study

#### Model

1 factor 6 items, 100 predictors

collinearity_con = c(0, 0.2, 0.5, 0.8, 0.95) 

N_con = c(150,250,350,500,800,2000)    

The idea of using real data sets to validate a statistical method was used in MacCallum et al. (1992). 

- Different from MacCallum et al. (1992), the raw data set is transformed so that the “population covariance” matrix in our study is known and so are the locations and population values of the parameters in a correctly specified model. 

- We also used robust transformation to deal with nonnormally distributed data: M-estimation weights individual observations differently in estimating the population means and covariance matrix, and cases that are farther away from the center get smaller weights than those located near the center of the distribution of the sample. 

- N = 80, 100, 120, 150, 200, 300; At each sample size, 5 independent replications are drawn

(notes: a way to save time in simulation study .....)

Because it is time-consuming to conduct model modifications, MacCallum et al. (1992) used 10 replications and 4 model modifications for each replication in their study



Evaluation: Type I and Type II, RMSE

Estimation: lavaan and regsem; lasso and elastic net (results were almost identical, so just report the results of lasso method); lambda: based on BIC



At higher sample sizes, MLE performed well in comparison to Lasso with regard to RMSE, and even more so for RB. At smaller sample sizes (150, 250), the Lasso performed better than MLE. Somewhat surprisingly, when the amount of correlation among all predictors was extremely high (0.95), the Lasso produced a large amount of RB in the factor loadings. 

Lasso committed far more Type I errors with the noise variables (estimating noise variables as non-zero), but also had much lower Type II errors (i.e., it rarely omitted a truly predictive variable) across the small, medium and large variables in each condition.



## Empirical application

In cognitive neuroscience, where many features of brain structure and function may have complementary effects, the challenge is how to best reconcile the dimensionality constraints for covariance based methodologies such as SEM, with the richness of the imaging metrics (which may include hundreds of measures per individual). 



MIMIC model: tests the joint prediction of the latent variable (with 3 items) by all 48 tracts which allows one to quantify if one or more white matter tracts help predict individual differences in visual short term memory.

Results: 6 important predictors

## Empirical application 2

three factors, 42 items

MLE: 17 parameters

Lasso: 21 parameters

## Discussion

small sample size with Bayesian estimation: we did not include any conditions with N < 100.  In regularized regression it is possible to test models with P > N (where P is the number of predictors and N is the sample size), however, to our knowledge, this has not been done using traditional SEM estimation methods such as MLE. 

p-value

Additional methods include the use of heuristic search algorithms (e.g. Marcoulides & Ing, 2012), various methods for identifying group differences (Frick, Strobl, & Zeileis, 2015; Kim & von Oertzen, 2017; Tutz & Schauberger, 2015), and the use of graphical models for identifying latent variables (e.g Epskamp, Rhemtulla, & Borsboom, 2016).

Relaxed lasso is suggested





## My Thoughts

"As there is no generally optimal value for λ, is common to test a range of λ values, combined with cross-validation, to examine what the most appropriate degree of regularization is for a given dataset."

cross-validation can also be used when choosing the prior variance in Bayesian measurement invariance



Datasets:  https://openpsy chometrics.org/_rawdata/



<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>