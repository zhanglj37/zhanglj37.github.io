# Comparison of Frequentist and Bayesian Regularization in Structural Equation Modeling

Jacobucci, R., & Grimm, K. J. (2018). Comparison of frequentist and Bayesian regularization in structural equation modeling. *Structural Equation Modeling: A Multidisciplinary Journal, 25*, 639–649. DOI: [10.1080/10705511.2017.1410822](https://doi.org/10.1080/10705511.2017.1410822)

[TOC]

## Purpose

Purpose: demonstrating both similarity and distinction across estimation frameworks, while specifically highlighting more recent developments in Bayesian regularization.

1 first start with the use of small-variance priors in Mplus, and how this is equivalent to the use of ridge regularization. 

2 demonstrate difference across both frequentist and Bayesian estimation in the case of the lasso.

3 extend this demonstration to more complex methods, spe- cifically a number of more recent hierarchical Bayesian methods: the Bayesian adaptive lasso (Feng et al., 2017) and the horseshoe prior

### Comparison between ridge and lasso

"The lasso penalty shrinks parameters by a constant amount, driving certain parameter estimates to zero, whereas the ridge penalty shrinks estimates proportionally. The ridge penalty helps stabilize parameter estimates, particularly if multi-collinearity is present, but does not drive estimates to zero. This makes lasso regularization more attractive when model simplification is desired."

![image-20200814172623506](fig/image-20200814172623506.png)



Asymmetric parameters: loadings, regression coefficients

Symmetric parameters: variances, covariances



**Huang, P.-H., Chen, H., & Weng, L.-J. (2017). A penalized likelihood method for structural equation modeling. *Psychometrika, 82*(2), 329– 354. doi:10.1007/s11336-017-9566-9**

**Jacobucci, R., & Grimm, K. J. (2018). Regularized estimation of multi-variate latent change score models. In E. Ferrer, S. Boker, & K. J. Grimm (Eds.), *Advances in Longitudinal Models for Multivariate Psychology: A Festschrift for Jack McArdle.* Routledge, London.**

## Ridge

Example data: six items and one factor, three loadings were strong and the other three indicators are generally thought to be the result of an additional factor

estimate loadings with ridge regularization 



To show correspondence, asserting a conversion from prior variance to value of λ is not as important as a demonstration that the parameter estimates are shrunken at parallel rates as the prior variance is constrained 

Model comparison: ML, Bayesian ridge: N(0,0.01), N(0,0.005), Frequentist ridge: lambda = 0.17, 0.34;   BIC

Model fit does not improve with the use of small-variance priors, this is mainly due to the number of parameters remaining consis- tent in the calculation of the Bayesian information criterion (BIC; Schwarz, 1978).

Results of the Bayesian ridge and frequentist ridge were almost same.



## Lasso

a set of 30 penalties or small-variance priors were tested on the same one factor model with all six factor loadings penalized



Bayesian models were estimated using the blavaan package (Merkle & Rosseel, 2015), which inter- faces JAGS (Plummer, 2003) in R. Normal distribution priors were used for BRidge, and Laplace distribution priors were used for BSEM lasso (BLasso). 



in RegSEM lasso the parameter estimates are driven to zero, whereas in BLasso estimates are driven to near zero, without estimates actually reaching zero. **This finding agrees with Park and Casella (2008) in that the BLasso acts as a form of hybrid between the frequentist ridge and lasso.**

![image-20200814201218281](fig/image-20200814201218281.png)

**Park, T., & Casella, G. (2008). The Bayesian lasso. *Journal of the American Statistical Association, 103*(482), 681–686.** 



## Other Methods

the Bayesian adaptive lasso (BaLasso; Feng et al., 2017) 

the horseshoe 

horseshoe+ priors (Bhadra et al., 2017; Carvalho et al., 2010). 



### Hierarchical Models

Hyper-prior for the shrinkage parameter

![image-20200814201633907](fig/image-20200814201633907.png)

### alasso

![image-20200814201739994](fig/image-20200814201739994.png)

With $\alpha$ set to 1 and $\beta$ as 0.05 (Feng et al., 2017)

"This prior on a prior, resulting in a gamma mixture of normals, capitalizes on the fact that the Laplace distribution can be expressed as a scale mixture of normal distributions with independent exponentially distrib- uted variances (i.e., Gamma with α = 1; Andrews & Mallows, 1974)."

### horseshoe and horseshoe+

The horseshoe prior will leave obvious signals unshrunk, mean- ing robustness when the model is not sparse, while exhibit- ing efficiency at shrinking noise parameters (Carvalho et al., 2010).

![image-20200814201958738](fig/image-20200814201958738.png)



![image-20200814202017073](fig/image-20200814202017073.png)



### Example

latent growth curve model with eight covariates 

For the covariate estimates, the BaLasso model resulted in sparser estimates in compar- ison to the RegSEM Lasso. Counting parameters estimated at 0.1, following the recommendation of Feng et al. (2017)



## Software

JAGS, stan, Bugs, Mplus, blavaan

R package: fanc package (Hirose & Yamamoto, 2015) and FANet (Blum, Houee, Lagarrigue, & Causeur, 2014), regsem

## Discussion

While both Bayesian and frequentist ridge methods produced comparable parameter estimate trajectories, this was not the case for the lasso methods. 



## My Thoughts

cross-validation which is often used in the frequentist ridge method can also be used in the Bayesian ridge method to choose the prior variance. Using the cross-validation method, RMSE maybe more appropriate than BIC, PPp.

The hyper-prior for the normal prior can be used in Bayesian measurement invariance analysis









<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>