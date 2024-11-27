---
title: Feasible Generalized Least Squares
created: 2024-09-16
authors:
  - Engrima
tags:
  - Econometrics
  - Cross-Sectional_Data
  - Heteroskedasticity
---
**Problem**:
- In the [[Weighted Least Squares]] case we assumed that **heteroskedasticity was known up to a multiplicative form**. 
- But in general it is difficult to find the correct function $h(x_i)$

**Solution**:
- We can model the function $h$ and use the data to estimate the unknown parameters in this model
- The estimate of each $h_{i}$ is denoted as $\hat{h}_{i}$
- Using $\hat{h}_{i}$ yields an estimator called the **Feasible GLS (FGLS) Estimator**

**Idea**
- Given an heteroskedastic [[Multiple Regression Model]] we assume that the variance is an exponential form of the variables, i.e.: 
$$
\mathrm{Var}(u|\mathbf{x})=\sigma^{2}\mathrm{exp}(\delta_{0}+\delta_{1}x_{1}+\delta_{2}x_{2}+\ldots+\delta_{k}x_{k})
$$
- We choose the exp. form to assure the *non-negativity* of the variance
-  We get that:
$$
\begin{align}
&u^{2}=\sigma^{2}\mathrm{exp}(\delta_{0}+\delta_{1}x_{1}+\delta_{2}x_{2}+...+\delta_{k}x_{k})\nu  \\ \\ 
\implies &\mathbb{E}(\nu|x_{1},\dots,x_{k})=1
\end{align}
$$
- If we assume $\nu \perp \!\!\! \perp x$: 
$$\implies \log(u^{2})=\mathrm{a}_{0}+\delta_{1}x_{1}+\delta_{2}x_{2}+\ldots+\delta_{k}x_{k}+e$$
- This last equation satisfies the [[Gauss-Markov Assumptions]] and we can get unbiased estimators of $\delta_{j}$ by using OLS

**Procedure**:
 1. Run the regression of $y$ on $x_1, x_2, \ldots, x_k$ and obtain the residuals, $\hat{u}$.
 2. Create $\log(\hat{u}^2)$ by first squaring the OLS residuals and then taking the natural log.
 3. Run the regression (OLS) $$\log(u^{2})=\mathrm{a}_{0}+\delta_{1}x_{1}+\delta_{2}x_{2}+\ldots+\delta_{k}x_{k}+e$$ 
 4. Obtain the fitted values, $$\hat{g}=\mathrm{\hat{a}}_{0}+\hat{\delta}_{1}x_{1}+\hat{\delta}_{2}x_{2}+\ldots+\hat{\delta}_{k}x_{k}$$
 5. Exponentiate the fitted values, getting: $\hat{h} = \exp(\hat{g})$.
 6. Estimate the equation $y = \beta_0 + \beta_1 x_1 + \ldots + \beta_k x_k + u$ by **WLS**, using weights $1/\hat{h}$.
    In other words, we replace $h_i$ with $\hat{h}_i$ in equation:
$$
y_{i}/\sqrt{h_{i}}=\beta_{0}/\sqrt{h_{i}} + \beta_{1}(x_{i1}/\sqrt{h_{i}} ) + \beta_{2}(x_{i2}/\sqrt{h_{i}} ) + ...\\+ \beta_{k}(x_{ik}/\sqrt{h_{i}} ) + (u_{i}/\sqrt{h_{i}} )
$$

>[!tip] FGLS vs WLS
>If we could use $h_i$ rather than $\hat{h}_{i}$ in the WLS procedure, we know that our estimators would be unbiased; in fact, they would be the [[BLUE Estimator]]s, **assuming that we have properly modeled the heteroskedasticity**.
>
>FGLS estimator is:
>- no longer unbiased
>- but consistent
>- and asymptotically more efficient that OLS

