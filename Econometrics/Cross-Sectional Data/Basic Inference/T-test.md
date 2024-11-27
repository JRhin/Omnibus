---
title: T-test
created: 2024-09-16
authors:
  - Engrima
tags:
  - Econometrics
  - Cross-Sectional_Data
  - Basic_Inference
---
Given the [[Multiple Regression Model]] setup we can define the **t statistic** for a particular OLS Estimate $\hat{\beta}_{j}$:
$$
t_{\hat{\beta}_{j}}\equiv\hat{\beta}_{j}/\mathrm{se}(\hat{\beta}_{j})
$$

This statistic used to test hypotheses about $\hat{\beta}_{j}$ $\implies$ test **statistical significance** of the variable $x_{j}$:

#### Possible test alternatives

- **Positive One-Sided Test**
	- the test
$$
\begin{cases}
\mathrm{H}_0{:} \quad \beta_j=0\\ 
\mathrm{H}_1{:} \quad \beta_j>0
\end{cases}
$$
	- the rejection rule ($c$ : *critical value* given by a certain *significance level*)
$$
t_{\hat{\beta}_{j}}>c
$$
- **Negative One-Sided Test**
	- the test
$$
\begin{cases}
\mathrm{H}_0{:} \quad \beta_j=0\\ 
\mathrm{H}_1{:} \quad \beta_j<0
\end{cases}
$$
	- the rejection rule ($c$ : *critical value* given by a certain *significance level*)
$$
t_{\hat{\beta}_{j}}<-c
$$
- **Two-Sided Test**
	- this test alternative is the relevant when the sign of $\hat{\beta}_{j}$ is not well determined by theory (or common sense).
$$
\begin{cases}
\mathrm{H}_0{:} \quad \beta_j=0\\ 
\mathrm{H}_1{:} \quad \beta_j\neq0
\end{cases}
$$
	- the rejection rule ($c$ : *critical value* given by a certain *significance level*)
$$
|t_{\hat{\beta}_{j}}|>c
$$
	- in this case, if $H_{0}$ is actually rejected we say that $x_{j}$ is **statistically significant** for the chosen significance level.

- **Testing particular values**
	- the test
$$
\begin{cases}
\mathrm{H}_0{:} \quad \beta_j=a_{j}\\ 
\mathrm{H}_1{:} \quad \dots
\end{cases}
$$
	- we can generalize the above approaches adjusting the t statistic:
$$
t=\frac{\hat{\beta}_j-a_j}{\mathrm{se}(\hat{\beta}_j)}
$$

>[!info] Why is $t_{\hat{\beta}_{j}}$ a reasonable test statistic for $\hat{\beta}_{j}$?
>1. $\text{sign}(\hat{\beta}_{j})=\text{sign}(t_{\hat{\beta}_{j}})$ (since $se(\hat{\beta}_{j})>0$)
>2. For a fixed $se(\hat{\beta}_{j})$, larger $\hat{\beta}_{j}$ $\implies$ larger $t_{\hat{\beta}_{j}}$
>3. Finally:
>	1. A sample value (estimate) of $\hat{\beta}_{j}$ very far from 0 provides evidence against $\mathrm{H}_0{:}\beta_j=0$. 
>	2. But sampling error $\implies$ size of $\hat{\beta}_{j}$ *must be weighted against its sampling error*
>	3. $t_{\hat{\beta}_{j}}$ measures how many estimated standard deviations $\hat{\beta}_{j}$ is away from 0
>	4. For $t_{\hat{\beta}_{j}}$ sufficiently far from 0 we can reject $H_{0}$

#### Two possible procedures for testing

**Procedure A**:
1. state the alternative hp.
2. choose a significance level $\implies$ derive the critical value
3. compute the t statistic and compare its value with the critical value
4. reject or not the null hp

**Procedure B**:
1. Rather than testing at different significance levels, given the observed value of the t statistic, we evaluate the smallest significance level at which the null hypothesis would be rejected i.e., the **p-value**
2. Evaluate the result:
	- small p-values $\implies$ evidence against the null; 
	- large p-values $\implies$ little evidence against $H_{}0$.
3. In practice, if $\alpha$ denotes the significance level of the test, then $H_0$:
	- is rejected if p-value  $< \alpha$; 
	- otherwise, H0 is not rejected at the $100\cdot\alpha$% level.

>[!tip] Remember from hypothesis testing theory:
>1. Significance level falls $\implies$ critical value increase $\implies$ we require a larger  value of $t_{\hat{b}_j}$ in order to reject $H_0$.
>2. As the degrees of freedom in the $t$ distribution get large, the $t$ distribution approaches the standard normal distribution.
>3. The p-value is the probability of observing a t statistic as extreme as we did if the null hypothesis is true.
>4. The p-value nicely summarizes the strength or weakness of the empirical evidence against the null hypothesis.

>[!danger] Statistical vs Economic Significance
>- The statistical significance of a variable $x_j$ is determined entirely by the size of $t_{\hat{\beta}_j}$
>- The economic significance or practical significance of a variable is related to the size (and sign) of $\hat{\beta}_j$.
>  
>  **Take home message**: using a smaller significance level means that economic and statistical significance are more likely to coincide.

>[!warning]
>it is especially important to interpret the *magnitude of the coefficient*, in addition to looking at t statistics, when working with large samples. *With large sample sizes*, parameters can be estimated very precisely: standard errors are often quite small relative to the coefficient estimates, which usually results in **statistical significance**.

>[!info]
>Large standard errors can also be a result of multicollinearity, even if the sample size seems fairly large.

#### General guidelines

1. Check for statistical significance.
2. If a variable is not statistically significant at the usual levels (10%, 5%, or 1%), but the effect of the variable on $y$ is practically large, check the p-value for the t statistic:
	- if high p-value $\implies$ the practical large estimate (effect) is due to **sampling error**
3. Variables with small t statistics that have the “wrong” sign  can be ignored

#### Visualizations

*5% rejection rule for the right-sided alternative (25 df)*

![[Pasted image 20240707231531.png]]

*5% rejection rule for the left-sided alternative (25 df)*

![[Pasted image 20240707231556.png]]

*5% rejection rule for the two-sided alternative (25 df)*

![[Pasted image 20240707231616.png]]