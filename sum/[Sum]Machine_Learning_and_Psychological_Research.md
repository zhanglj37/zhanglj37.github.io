# Machine Learning and Psychological Research

Jacobucci, R., Grimm, K.J.. (2020). Machine Learning and Psychological Research: The Unexplored Effect of Measurement *Perspectives on Psychological Science, 15*:3, 809-816. DOI: [10.1177/1745691620902467](https://doi.org/10.1177/1745691620902467)

[TOC]

## Background



#### Advantages

- machine learning (ML) has allowed for the statistical analysis of relationships that were previously not possible (e.g., *p* > *N* in genetic and brain research)
- it has also allowed for the reanalysis of existing data
- performs better in prediction

#### Limitations

The comparison between ML and traditional statistical models is lack, making the advantages of ML is still controversial:

- a recent review comparing machine learning with more traditional statistical models such as linear and logistic regres- sion (Jie, Collins, Steyerberg, Verbakel, & van Calster, 2019) no evidence of superior performance of the machine-learning algorithms.

Integration of machine-learning algorithms with psychological research requires a great deal of nuance

- traditional: validity; ML: ?
- measurement errors of latent variables

## Simulation Study

Purpose: investigate the performance of ML when measurement errors exist



Model: $y=cos(x_1)+sin(x_2)+tan(0.1*x_1*x_2)+N(0,0.1)$

add measurement error: $x = \sqrt{relia}*x'+N(0,1-relia)$

relia = 0.3, 0.6, 0.9; N = 200, 500 ,2000

evaluation: R-square



#### Results

97% of the replications had higher *R*2 values in the linear model than in boosting when the reliability was 0.3. 

![](fig/0707_nonlinear.png)

Model: $y=x_1+x_2+0.1*x_1*x_2+N(0,0.1)$

add measurement error: $x = \sqrt{relia}*x'+N(0,1-relia)$

relia = 0.3, 0.6, 0.9; N = 200, 500 ,2000

both models saw a decrement in performance as the reliability was decreased, boosting was also influenced by sample size

![](fig/0707_linear.png)



## Recommendations

assess the reliability of both the outcome and predictors. 

![](fig/0707_recom.png)



## My Thoughts

Similarly, the exist of measurement errors can also influence the estimates of network analysis. Is it necessary to ensure the high reliability of indicators before network analysis, or is there any method to consider the exist of measurement errors  in network analysis / ML?





<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>