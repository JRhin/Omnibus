---
title: Quadratic form
created: 2024-09-16
authors: Engrima
tags:
 - Econometrics
 - Cross-Sectional_Data
 - Advanced_Relations
---
#### Simplest case
- Consider the model: $$y=\beta_0+\beta_1x+\beta_2x^2+u$$
- **Problem**: $\beta_1$ does not measure the change in $y$ with respect to $x$ since it makes no sense to hold $x_2$ fixed while changing $x$
- **New interpretation**: 
	- given the fitted regression $\hat{y}=\hat{\beta}_0+\hat{\beta}_1x+\hat{\beta}_2x^2,$
	- the approximation $$\Delta\hat{y}\approx(\hat{\beta}_1+2\hat{\beta}_2x)\Delta x \implies \Delta\hat{y}/\Delta x\approx\hat{\beta}_{1} + 2\hat{\beta}_{2}x$$
	- $\implies$ the slope of the relationship between $x$ and $y$ depends on the value of $x$!
- **Analysis**:
	1. When $\hat{\beta}_{1}>0$ and $\hat{\beta}_{2}<0$
		- i.e. the coefficient on $x$ is positive and the coefficient on $x_2$ is negative
		- the quadratic has a **parabolic shape**
		- there is always a positive value of $x$ where the effect of $x$ on $y$ is zero: $$x^*=|\hat{\beta}_1/(2\hat{\beta}_2)|$$
	2. When $\hat{\beta}_{1}<0$ $\hat{\beta}_{2}>0$
		- often the case when the model has a dependent variable in logarthmic form and an explanatory variable entering as a quadratic
		- the quadratic form has a **U-shape** $\implies$ captures an increasing effect of $x$ on $y$
	3. When $sign(\hat{\beta}_{1})= sign(\hat{\beta}_{2})$
		- If the coefficients on the level and squared terms have the same sign (either both positive or both negative) and the explanatory variable is necessarily nonnegative, there is no turning point for values $x > 0$. 
		- When $\beta_1$ and $\beta_2$ are both positive, the smallest expected value of $y$ is at $x = 0$, and increases in $x$ always have a positive and increasing effect on $y$. 
		- Conversely, if $\beta_1$ and $\beta_2$ are both negative, the largest expected value of $y$ is at $x = 0$, and increases in $x$ have a negative effect on $y$, with the magnitude of the effect increasing as $x$ gets larger. 
		- The general formula for the turning point of any quadratic is $x^* = -\frac{\hat{\beta}_1}{2\hat{\beta}_2}$, which results in a positive value if $\hat{\beta}_1$ and $\hat{\beta}_2$ have opposite signs, and a negative value when $\hat{\beta}_1$ and $\hat{\beta}_2$ have the same sign.


*Parabolic shape*
![[Pasted image 20240716201105.png]]

*U-shape*
![[Pasted image 20240716201018.png]]