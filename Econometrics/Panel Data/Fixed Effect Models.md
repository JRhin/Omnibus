---
title: Fixed Effect Models
created: 2024-09-16
authors:
  - Engrima
tags:
  - Econometrics
  - Panel_Data
---
#### Idea:
Random samples are drawn *at each time period* from the same population getting [[Panel Data]]. We thus fit the always same [[Multiple Regression Model]] on the Panel Data, applying some **differencing trick** to our dataset to eliminate a so called **Fixed Effect Term** which collects all the unobserved time-invariant factors that affect the dependent variable.

>[!danger]
>Different differentiation techniques $\iff$ different Panel Data Model

#### Why?
We use Panel Data models in place of [[Pooled Multiple Regression Model]], to:

1. Distinguish the **unobserved factors** affecting the dependent variable in 2 types:
	1. those that are **constant over time** $\implies$ $u_{it}$
	2. those that **vary over time** $\implies$ $a_{i}$
2. Allow  the correlation between $a_{i}$ and $x_{it}$ without risking [[Endogeneity]] Bias

#### Setup with $t=2$ periods of time:
- **Notation**:
	- $i$ denotes the cross-sectional unit (observation) and $t$ the time period
	- $d2_{t}$ is a time dummy variable s.t. it not changes for different observations (indep. from $i$):
		$$
		d2_{t}=
		\begin{cases}
		0 \quad t=1 \\
		1 \quad t=2
		\end{cases}
		$$
	- the **fixed effect term** $a_{i}$ is the term that captures all the unobserved time-constant factors affecting $y_{it}$
	- the **idiosyncratic (time-varying) error** $u_{it}$ represents unobserved factors that change over time and affect $y_{it}$
- A **General two-period Fixed Effect model** is:
$$
y_{it}=\beta_0+\delta_0d2_t+\beta_1x_{it}+a_i+u_{it}, \quad t=1,2
$$

>[!tip] Different intercepts for different periods
>Similarly to how we manage different periods in [[Pooled Multiple Regression Model]]s, in Fixed Effect Models we allow the intercept to change over time:
>- $\beta_{0}$ $\implies$ intercept for $t=1$
>- $\beta_{0} + \delta_{0}$ $\implies$ intercept for $t=2$

>[!note] Example
>A simple unobserved effects model for city crime rates for 1982 and 1987 is:
>$$crmrte_{it}=\beta_{0}+\delta_{0}d87_{t}+\beta_{1}unem_{it}+a_{i}+u_{it}$$
> - $a_{i}$ $\implies$ all factors affecting city crime rates that do not change over time (e.g. the city’s location)
> - $u_{it}$ $\implies$ might include demographic features of the population (age, race, and education) that are non-constant over time

**Problem**:
1. Given the **composite error** $v_{it}=u_{it} + a_{i}$
2. We could solve the above model using the **Pooled OLS Estimates**
3. The problem is that in this case we have to assume:
	- $v_{it}$ uncorrelated with $x_{it}$
	- $\implies$ $a_{i}$ uncorrelated with $x_{it}$ (since $u_{it}$ uncorrelated with $x_{it}$ by [[Gauss-Markov Assumptions]])
	- $\implies$ otherwise we would get **[[Endogeneity]] Bias**
4. Using Pooled OLS on Panel Data doesn't solve the omitted variables problem
5. We should find a model that allows the correlation between $a_{i}$ and $x_{it}$

**Solution**:
Because $a_{i}$ is constant over time we can apply some differencing technique (w.r.t. time/periods) to preprocess data in order to **not include the fixed effect term inside our equation** and allow an existing correlation without affecting the validity of the OLS estimates.

#### Possible differencing approaches

1. **[[First Differencing Model]]**
2. **[[Average Differencing Fixed Effect Model]]**
3. Generalized **[[Random Effect Model]]**
