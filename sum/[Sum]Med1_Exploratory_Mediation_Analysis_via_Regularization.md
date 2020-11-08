# Exploratory Mediation Analysis via Regularization

Serang, S., Jacobucci, R., Brimhall, K. C., & Grimm, K. J. (2017). Exploratory Mediation Analysis via Regularization. *Structural Equation Modeling: A Multidisciplinary Journal*, *24*(5), 733–744. <https://doi.org/10.1080/10705511.2017.1311775>

[TOC]

Purpose: two-stage approach called exploratory mediation analysis via regularization (XMed) 

## Background

### Mediation

mediation can occur in the absence of a statistically significant relation between independent and dependent variables (MacKinnon, 2008; Shrout & Bolger, 2002). 

For multiple mediators, multiple mediation model VS single: multiple mediator model allows for the
estimation of specific indirect effects conditional on the presence of other mediators in the model.  



**Estimation:**

multivariate delta method (Sobel, 1982, 1986):  relies heavily on assumptions of multivariate normality 

Bootstrap



Exploratory Mediation: situations often arise in which the available theory is limited, and as a result our hypotheses and subsequent predictions are not well defined.  

MacKinnon (2008) described a two-stage approach

- mediation analysis of all possible mediators of interest should be conducted.  
- only those mediators found to be statistically significant should be included in the final model. 

the potentially large number of tests could lead to inflated rates of Type I error, and recommends exercising some control over family-wise error rates.  	

**Limitations of *p-*value based method**

The theory underlying p values and confidence intervals used to assess statistical significance has roots in the confirmatory approach, and as such is not appropriate for exploratory analysis even if corrections for multiple testing are made. 

Additionally, it has been shown in the regression context that such methods have the propensity to overfit the data, finding signal in noise and thus producing less generalizable solutions (Babyak, 2004; McNeish, 2015). 



**Lasso: widely used**

Although other methods for subset selection exist, the lasso has been shown to perform especially well in conditions where a small to moderate number of moderate-sized effects exist 



XMed

- select the mediators with non-zero $a_j$ and $b_j$
- refit the model using the selected mediators without regularization

## Simulation Study

### Simulation study 1

determine how often the method was able to correctly identify mediators relative to other methods. 

**Five mediators**

- large effect: 0.59*0.59
- medium: 0.36*0.36
- small: 0.11*0.11
- two noise variables

**choice of the effect size**: kappa-squared measure derived by Preacher and Kelley (2011). The authors
suggested that values of 0.25, 0.09, and 0.01 could serve as benchmarks for large, medium, and small effects  

**Different methods**

- XMed
- multivariate delta (sobel): with 0.01 and 0.05 $\alpha$
- bootstrap

**Results**

- the p value methods were far more conservative than XMed
- the bootstrap method was slightly more conservative than the delta method. Yet, this difference was minimal 
- Furthermore, when alpha was .01, neither of the methods was able to detect Ms more than 5% of the time until the sample size reached 1,000 

### Simulation study 2

examine bias in parameter estimates as a result of our two-stage procedure.  

## Discussion

propose a novel two-stage method for exploratory mediation analysis 



Confirmatory VS Exploratory: In the context of exploratory mediation analysis, we believe **it is better to identify some variables as mediators when in fact they are not**, as opposed to failing to identify variables that are indeed mediators. 

Some argue that shrunken estimates (without stage 2) are preferable because they have less variance, as per the bias–variance trade-off 

**What if the *p-*value in the second-stage is non-sig?**  These p values do not reflect the mediator subset selection procedure performed in the first stage, and are thus not valid when using XMed. Given that the first stage performs subset selection, this in itself is sufficient and null hypothesis significance testing of the second-stage parameter estimates is not required, even if it were appropriate. 



regsem forum: https://groups.google.com/d/forum/regsem 



Future research: multilevel models (My note: maybe Bayesian reg is more flexible in multilevel models)

<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>