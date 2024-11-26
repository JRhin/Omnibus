---
title: White test
created: 2024-09-16
authors:
  - Engrima
tags:
  - Econometrics
  - Cross-Sectional_Data
  - Heteroskedasticity
---
**Idea**:
This test can be considered a modified version of the [[Breusch-Pagan test]]:
- For the BP test we moved the subject for heteroskedasticity testing from $Var(u|x_1,x_2,...,x_k)$ to the squared error $u^2$ $\implies$ we want to test weather this $u^2$ is uncorrelated with all $x_{1},\dots,x_{k}$
- this time we regress $u^2$ on the independent variable and **all the possible cross products of these indep. variables**
- **Possible Problem**: too many regressors $\implies$ too many degrees of freedom
- **Solution**: 
	- the OLS fitted values are linear combinations of the indep. variables $\hat{y}_{i}=\hat{\beta}_{0}+\hat{\beta}_{1}x_{i1}+\hat{\beta}_{2}x_{i2}+...+\hat{\beta}_{k}x_{ik}$
	- we fit the OLS residuals on a functional form of those fitted values to replicate the effect of cross product of indep. variables and saving several degrees of freedom: $$\hat{u}^2=\delta_0+\delta_1\hat{y}+\delta_2\hat{y}^2+error$$
	- we can use F or LM statistics to test $\mathrm H_0\colon\delta_1=\delta_2=0$

>[!warning] Why this new test is useful
>Since $\hat{y}$ is an estimate of the expected value of $y$, given the $x_j$, using this latter hypothesis to test for heteroskedasticity is useful in cases where the variance is thought to change with the level of the expected value, $E(y \mid x)$.

**Procedure**:
1. Estimate the [[Multiple Regression Model]] by OLS, as usual. 
2. Obtain the OLS residuals $\hat{u}$ and the fitted values $\hat{y}$. 
3. Compute the squared OLS residuals $\hat{u}^2$ and the squared fitted values $\hat{y}^2$. 
4. Run the regression $$\hat{u}^2=\delta_0+\delta_1\hat{y}+\delta_2\hat{y}^2+error$$
5. Keep the R-squared from this regression, $R_{\hat{u}^2}^2$. 
6. Form either the F or LM statistic and compute the p-value.

>[!danger] White test as misspecification test
>If MLR.4 from the [[Gauss-Markov Assumptions]] is violated (in particular, if the functional form of $\mathbb{E}(y|x)$ is misspecified) then a test for heteroskedasticity can reject $H_0$, even if $Var(y|x)$ is constant!
