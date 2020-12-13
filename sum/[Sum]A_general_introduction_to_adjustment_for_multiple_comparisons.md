# A general introduction to adjustment for multiple comparisons

Chen, S.-Y., Feng, Z., & Yi, X. (2017). A general introduction to adjustment for multiple comparisons. *Journal of Thoracic Disease*, *9*(6), 1725–1729. https://doi.org/10.21037/jtd.2017.05.34

[TOC]

Reasons for multiple adjustment

the statistical inference of committing at least one incorrect rejection will become inevitable even when 100 hypotheses are individually tested at significance level α = 0.05

![](fig/201205_1.png)



**Two ways for adjusting the statistical inference of multiple comparisons**

- adjust the observed p value
- adjust the cut-off value



**Measures accounting for Type I error rates**

per-comparison error rate  = E(U)/m 

- the expected proportion of variable U among all simultaneously tested hypotheses of m 

familywise error rate  = P(U>0)

- jointly consider all hypotheses as a family for controlling Type I error; and therefore the most stringent criterion
  is to guarantee that not any H0 is incorrectly rejected. 

false discovery rate  = E(U/R) if R >0; =0 if R=0

- expected proportion of incorrectly rejected H0 among all rejections 



## Common Methods for adjustment

example: Let m = 6 and α = 0.05; and the initially computed P values corresponding to six hypotheses are p1 = 0.1025, p2 = 0.0085, p3 = 0.0045 , p4 = 0.0658 , p5 = 0.0201 a n d p6 = 0.0304 , respectively. 

![](fig/201205_2.png)

### Bonferroni adjustment 

familywise error rate

adjusted p value = min{$p_i$*m, 1} (i∈[1,m])

much conservative 

### Holm adjustment

based on Bonferroni method, less conservative

in a stepwise way, computes the signifcance levels depending on the P value based rank of hypotheses.

each hypothesis will be tested in order from the smallest to largest P values   

$\alpha_i =\alpha/(m-i+1)$

![](fig/201205_3.png)

### Hochberg adjustment

similar to holm method, but start with the largest P (i=m)

$\alpha_i =\alpha/(m-i+1)$

### Hommel adjustment

Simes [1986] modified Bonferroni method and proposed a global test of m hypotheses, however, could not be
used for assessing the individual hypothesis Hi : $p_i≤i\alpha/m$

$j=max${i∈{1,...,m}:$p_{m-i+k}>k\alpha/i$, k=1,...,i}

if j does not exist, reject all the hypothesis

if j exist, reject all the hypothesis with $p_i≤\alpha/j$

p.adjust() function in R stats package. 

### Benjamini-Hochberg (BH) adjustment 

false discovery rate

Let q be the pre-specifed upper bound of FDR (e.g., q = 0.05 ), the first step is to compute index k : 

k=max{i:$p_i≤i*q/m$}

### Benjamini and Yekutieli (BY) adjustment 

Similar to BH method, a more conservative adjustment was further proposed for controlling FDR by Benjamini
and Yekutieli [2001] 

![](fig/201205_4.png)







<center>
<ul class="actions">
<li><a href="https://www.lijinzhang.xyz/blog_200520_summary.html" class="button">Return</a></li>
</ul>			
</center>