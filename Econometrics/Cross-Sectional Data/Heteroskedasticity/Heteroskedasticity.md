---
title: Heteroskedasticity
created: 2024-09-16
authors:
  - Engrima
tags:
  - Econometrics
  - Cross-Sectional_Data
  - Heteroskedasticity
---
- **Homoskedasticity assumption**:
  - the variance of the unobserved error, $u$, *conditional on the explanatory variables*, is **constant**, i.e. given the [[Multiple Regression Model]] $y=\beta_0+\beta_1x_1+\beta_2x_2+...+\beta_kx_k+u$  we have that:
$$
Var(u|x_{1},\dots,x_k)=\sigma^2
$$
  - it is needed (<mark style="background: #ADCCFFA6;">MRL.5</mark> in [[Gauss-Markov Assumptions]] and [[Classical Linear Model Assumptions]]) to justify the usual [[T-test]]s, [[F-test]]s, and confidence intervals for OLS estimation of the linear regression model, even with large sample sizes
  - it plays no role in showing whether OLS was unbiased or consistent
  - interpretation of our goodness-of-fit measures, $R^2$ and $\bar{R}^2$ , is also unaffected by the presence of heteroskedasticity

- **Heteroskedasticity**:
  - the variance of the unobserved factors changes across different segments of the population, where the segments are determined by the different values of the explanatory variables
  - the main **problems** 
    $\implies$ $Var(\hat{\beta}_{j})$ are **biased** without the homoskedasticity assumption
	$\implies$ no longer valid for constructing confidence intervals and t statistics
	$\implies$ OLS no longer [[BLUE Estimator]]

## Heteroskedasticity-Robust Inference after OLS Estimation

**Idea**: 
Adjust standard errors and t, F, and LM statistics so that they are valid in the presence of heteroskedasticity of unknown form.

**Heteroskedasticity-robust procedures**:
they are valid (at least in large samples) whether or not the errors have constant variance, and we do not need to know which is the case

#### Case 1: Simple Regression

**Setup**:
1. Consider the [[Simple Regression Model]]: $$y = \beta_{0 }+ \beta_{1}x + u$$
2. Assume the first four [[Gauss-Markov Assumptions]]
3. If the error contains heteroskedasticity $\implies \operatorname{Var}(u_i|x_i)=\sigma_i^2$
4. Write the [[Ordinary Least Squares]] Estimator: $$\hat{\beta}_1=\beta_1+\frac{\sum_{i=1}^n(x_i-\bar{x})u_i}{\sum_{i=1}^n(x_i-\bar{x})^2}$$
5. Under Assumptions <mark style="background: #ADCCFFA6;">MLR.1</mark> through <mark style="background: #ADCCFFA6;">MLR.4</mark> + conditioning on $x_{i}$ we have that: $$\mathrm{Var}(\hat{\beta}_1)=\frac{\sum_{i=1}^n(x_i-\bar{x})^2\sigma_i^2}{\mathrm{SST}_x^2}$$
**Goal**:
We need a way to estimate the above variance when $\sigma_{i}\neq\sigma$ (otherwise we would have homosk. and simply get $\frac{\sigma^2}{SST_{x}}$)

**Procedure**:
1. $\hat{u}_{i}$ $\rightarrow$ the OLS residuals from the initial regression of $y$ on $x$
2. a valid estimator of the variance would be:
$$
\widehat{\mathrm{Var}}\left(\widehat{\beta}_{j}\right)=\frac{\sum_{i=1}^n(x_i-\bar{x})^2\hat{u}_i^2}{\mathrm{SST}_x^2}
$$

#### Case 2: Multiple Regression

**Procedure**:
1. Consider the [[Multiple Regression Model]]: $$y=\beta_0+\beta_1x_1+\beta_2x_2 + \dots + \beta_{k}x_{k} +u$$
2. a similar formula for a valid estimation:
$$
\widehat{\mathrm{Var}}\left(\widehat{\beta}_{j}\right)=\frac{\sum_{i=1}^{n}\hat{r}_{ij}^{2}\hat{u}_{i}^{2}}{\mathrm{SSR}_{j}^{2}}=\frac{\sum_{i=1}^{n}\hat{r}_{ij}^{2}\hat{u}_{i}^{2}}{\text{SST}_j (1 - R_j^2)}
$$
3. where:
	1. $\hat{r}_{ij}$ $\rightarrow$  the $i$-th residual from regressing $x_{j}$ on all other independent variables
	2. $SSR_{j}$ $\rightarrow$ sum of squared residuals from this regression
4. square root of the quantity this estimated variance is called the **heteroskedasticity-robust standard error** for $\hat{\beta}_{j}$

>[!tip] Degrees of freedom adjustment
>Sometimes, as a dof correction, this variance estimate is multiplied by $n/(n - k - 1)$ before taking the square root.

>[!tip] Alternative formula
>The term $\text{SSR}_j$ in the above variance estimation can be replaced with $\text{SST}_j (1 - R_j^2)$, where:
>-  $\text{SST}_j$ $\rightarrow$ the total sum of squares of $x_j$ 
>- $R_j^2$ $\rightarrow$ the usual R-squared from regressing $x_j$ on all other explanatory variables.

>[!danger] Problem
>Little sample variation in $x_{j}$ or [[Multicollinearity]] may cause high heteroskedasticity-robust standard errors!
>
>Empirically robust standard errors are often found to be larger than the usual standard errors.

>[!tip] Why to prefer OLS with usual standard error
>- If the homoskedasticity assumption holds + errors are normally distributed (MLR.4, MLR.5) $\implies$ usual t statistics have exact t distributions, (regardless of the sample size). 
>- The robust standard errors and robust t statistics are justified only as the sample size becomes large, even if [[Classical Linear Model Assumptions]] are true.

## Main inference implications of heteroskedastic-robust standard errors

1. **Robust [[T-test]]**: 
   it is possible to consequently obtain a **heteroskedasticity-robust t statistic** by using the heteroskedasticity-robust standard error in the formula $$t=\frac{\text{estimate}-\text{hypothesized value}}{\text{standard error}}$$
2. **Robust [[F-test]]**: 
   heteroskedasticity $\implies$ usual sum-of-squared residuals form of the F statistic is not valid $\implies$ compute the [[Chow Test]]
3. **Robust [[Lagrange Multiplier Test]]**: 
   for a **heteroskedasticity-robust LM statistic**:
	1. obtain the residuals $\tilde{u}$ from the restricted model 
	2. regress each of the independent variables excluded under the null on all of the included independent variables to get the residuals $\tilde{r}_{1}\dots \tilde{r}_{q}$ ($q$: number of excluded variables)
	3. find the product between each $\tilde{r}_{j}$ and $\tilde{u}$
	4. run the regression of 1 on $\tilde{r}_{1} \tilde{u},\,\tilde{r}_{2} \tilde{u},\, \tilde{r}_{q} \tilde{u}$ **without an intercept**
	5. The robust LM statistic turns out to be $n-SSR_{1}$ where $SSR_{1}$ is the usual sum of squared residuals from this final regression
	6. Under $H_{0}$, LM is distributed approximately as $\chi_{q}^2$

>[!tip] Alternative to the use of heteroskedastic-robust standard errors
>Another way of getting reliable statistics is to directly correct the regression model instead of correcting the standard errors. Examples of these transformed models are:
>- [[Weighted Least Squares]]
>- [[Feasible Generalized Least Squares]]


## Testing for heteroskedasticity

Possible tests:
- [[Breusch-Pagan test]]
- [[White test]]
