# Bayesian Factor Analysis as a Variable-Selection Problem

Lu, Z. H. , Chow, S. M. , & Loken, E. . (2016). Bayesian factor analysis as a variable-selection problem: alternative priors and consequences. *Multivariate Behav Res*, *51*(4), 519-539. DOI: [10.1080/00273171.2016.1168279](https://doi.org/10.1080/00273171.2016.1168279)

[toc]

## Backgroud

Disadvantages of strict restrictions in CFA: However, prior knowl- edge may not be available, and specifying oversimplified factor-loading structures may lead to biased estimates of the parameters in 􏰂 (Asparouhov & Muthén, 2009). 

Hybrid approach between EFA and CFA: modification indices

Limitations of MI method: 

- Low generalization ability
- The best subset selection requires the com- parison of $2^p$ models, which is not feasible even for moderate *p*. 
- without a proper correction procedure, the Type I error rate may be far from the specified significance level. 
- the parameter and standard error estimates may be severely inflated by collinearity problems and may lead to falsely identified significant variables (Harrell, 2001).

-- > an alternative way to combine the strengths of EFA and CFA is to structure factor analysis as a variable selection problem.

variable selection:ridge, ssp

the current study: test the performance of ssp and compare it with ridge in loadings identification and estimation in one-step. (distinct from the two-step procedure adopted by Muthén and Asparouhov (2012) in their BSEM-RP. ). a real data analysis

O’Hara, R. B., & Sillanpää, M. J. (2009). A review of Bayesian variable selection methods: What, how and which. *Bayesian Analysis*, *4*, 85–117. doi:10.1214/09-BA403



Introduction of methods, "To ease presentation, we assume that no intercept term exists in the model. "

### Frequentist ridge and lasso

risge: The ridge estimator shrinks the magnitude of all elements of β toward zero. The L2 penalty function reflects the subjective belief that estimates of β with large magnitudes are less preferable. 

lasso: As illustrated in Hastie et al.(2009), the lasso estimator sets the elements of the MLE estimator that are smaller than $1/τ^2$ to exactly zero and shrinks the other elements to zero by $1/τ^2$ .

### Bayesian ridge and lasso

two popular prior choices for β are the Gaussian distribution and the Laplace distributions, expressed respectively as

![image-20200826213253090](fig/image-20200826213253090.png)

Bayesian ridge

![image-20200826213538404](fig/image-20200826213538404.png)

### spike and slab

![image-20200826213740923](fig/image-20200826213740923.png)

![image-20200826214530906](fig/image-20200826214530906.png)

That is, when σ2 is small, the first component would center narrowly around zero, as opposed to being specified as a point mass (i.e., a spike) at zero. 

This prior is a mixture of two components: (a) the “spike”—representing the prior belief that λ*jk* should be fixed at zero and (b) the “slab”—the wider normal distri- bution representing the belief that λ*jk* should be estimated from data because it may deviate substantially from 0. 



## My Thoughts

Good title and good story: extend the simulation study to a big question

The ridge prior in Mplus is not the common ridge prior, the prior variance and the penalty strength is fixed, even cannot beat the frequentist ridge method.



ssp: combine the two-step method in one-step analysis using Bernoulli distribution. can also be adapted using laplace prior (aBlasso-ssp). maybe the perfomance of ssp is similar to horseshoe which consider two shrinkage parameters (local and global)



<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>