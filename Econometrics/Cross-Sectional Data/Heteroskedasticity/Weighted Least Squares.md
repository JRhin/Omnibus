---
title: Weighted Least Squares
created: 2024-09-16
authors:
  - Engrima
tags:
  - Econometrics
  - Cross-Sectional_Data
  - Heteroskedasticity
---
**Problem**:
[[Heteroskedasticity]] $\implies$ usual t and F statistics no more valid

**Setup**:
- We have a [[Multiple Regression Model]]: $$y=\beta_0+\beta_1x_1+\beta_2x_2 + \dots + \beta_{k}x_{k} +u$$
- We assume heteroskedasticity, i.e. for some function of the independent variables we have: $$\mathrm{Var}(u|\mathbf{x})=\sigma^2h(\mathbf{x})$$
- Since variance must be positive $\iff$ $h(x)>0$

**Idea**:
- We want to transform the above regression model, by using the known function $h(x)$ to correct the model and make it homoscedastic
- To satisfy the [[Gauss-Markov Assumptions]] we want:
   $\mathbb{E}(u_{i}/ \sqrt{ h_{i} })=0$ $\implies$ $Var(u_{i}|x_{i})=\mathbb{E}(u_{i}^2|x_{i})=\sigma^2h_{i}$
- Thus we get a new assumption to get homoscedasticity:
$$
\mathrm{E}\Big((u_i/\sqrt{h_i} )^2\Big)=\mathrm{E}(u_i^2)/h_i=(\sigma^2h_i)/h_i=\sigma^2
$$
- We can divide the original MRL equation to get an homoscedastic equivalent model that satisfies all the [[Gauss-Markov Assumptions]]:
$$
\begin{aligned}y_{i}/\sqrt{h_{i}}&=\beta_{0}/\sqrt{h_{i}} + \beta_{1}(x_{i1}/\sqrt{h_{i}} ) + \beta_{2}(x_{i2}/\sqrt{h_{i}} ) + ...\\&+ \beta_{k}(x_{ik}/\sqrt{h_{i}} ) + (u_{i}/\sqrt{h_{i}} )\\
\\
\implies y_i^* &=\beta_0x_{i0}^*+\beta_1x_{i1}^*+...+\beta_kx_{ik}^*+u_i^*
\end{aligned}
$$
- Where:
	- $x_{i0}^*=1 /  \sqrt{ h_{i} }$
	- $\beta_{j}^*$ are examples of **Generalized Least Squares (GLS) Estimators**
	- GLS estimators for correcting heteroskedasticity are called **Weighted Least Squares (WLS) Estimators**

>[!info] Why are they called **Weighted Least Squares (WLS) Estimators**?
>Because $\beta_{j}^*$'s minimize the weighted sum of squared residuals, where each squared residual is weighted by $1 /  \sqrt{ h_{i} }$

>[!tip] Interpretation
>Less weight is given to observations with a higher error variance. OLS gives each observation the same weight because it is best when the error variance is identical for all partitions of the population.

>[!tip] Residuals
>The residuals are given by: $$\sum_{i=1}^{n}(y_{i}-\beta_{0}-\beta_{1}x_{i1}-\beta_{2}x_{i2}-...-\beta_{k}x_{ik})^{2}/h_{i}$$
>
>Notice how:
>- residuals $\implies$ multiplied by $1 /  h_{i}$
>- independent variables $\implies$ multiplied by $1 /  \sqrt{ h_{i} }$

>[!danger] Natural use of WLS
>There is one case where the weights needed for WLS arise naturally from an underlying econometric model $\rightarrow$ instead of using individual-level data, we only have averages of data across some group or geographic region.
>- If the individual-level equation satisfies the Gauss-Markov assumptions, then *the error in the per capita equation has a variance proportional to one over the size of the population*.
>- The advantage of weighting by firm size, city population, and so on relies on the underlying individual equation being homoskedastic. If heteroskedasticity exists at the individual level, then the proper weighting depends on the form of heteroskedasticity.
>- Further, if there is correlation across errors within a group then $\mathrm{Var}(\bar{u}_{i})\neq\sigma^{2}/m_{i}$

>[!tip] WLS vs OLS
>The OLS and WLS estimates will always differ due to **sampling error**
>
>The **problem**:
>- If they produce statistically significant estimates that differ in sign
>- If they produce statistically significant estimates that differ in magnitude
>
>$\implies$ Typically, this indicates that one of the other Gauss-Markov assumptions is false (typically MRL.4)
>$\implies$a significant difference between OLS and WLS can indicate a functional form misspecification in $E(y|x)$.
>

>[!danger] Heteroskedasticity function misspecification
>What if $\mathrm{Var}(u|\mathbf{x})\neq\sigma^2h(\mathbf{x})$?
>
>1. WLS estimates will always be **unbiased** and **consistent** since:
>   $\mathbb{E}(u|x)=0 \implies  Cor(h(x),u)=0, \; \forall h(\cdot) \implies Cor(x_{j} / \sqrt{ h_{j} }, u_{j} / \sqrt{ h_{j} }), \; \forall h(\cdot)$
>2. Usual WLS standard errors and test statistics, computed under the assumption $\mathrm{Var}(u|\mathbf{x})=\sigma^2h(\mathbf{x})$ are no longer valid
>   $\implies$ we can correct this by using **heteroskedastic-robust standard errors** for the statistics after WLS estimation
>3. It is no more guaranteed WLS to be more efficient than OLS.
>   
>   **Take-home message**: in cases of strong heteroskedasticity, it is often better to use a wrong form of heteroskedasticity and apply WLS than to ignore heteroskedasticity and use OLS.
