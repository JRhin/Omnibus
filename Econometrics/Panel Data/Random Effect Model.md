---
title: Random Effect Model
created: 2024-09-16
authors:
  - Engrima
tags:
  - Econometrics
  - Panel_Data
---
It is another method for estimating unobserved effects with panel data models, at least as common as [[First Differencing Model]]

**Idea**:
We basically think the **unobserved effect is uncorrelated with all the explanatory variables**:
we believe that any leftover neglected heterogeneity only induces serial correlation in the composite error term, but it does not cause correlation between the composite errors and the explanatory variables.
So we try to generalize the approach assumed for [[Average Differencing Fixed Effect Model]] by using the above assumption to avoid the elimination of the **unobserved fixed effect term**.

**Procedure**:
1. Starting from the [[Pooled Multiple Regression Model]]:
$$
\begin{equation}
y_{i t}=\beta_{0} + \beta_1 x_{i t 1}+\beta_2 x_{i t 2}+\ldots+\beta_k x_{i t k}+a_i+u_{i t}, \quad t=1,2, \ldots, T \quad i=1,\dots,N
\end{equation}
$$
>[!warning]
>We explicitly include an intercept $\beta_{0}$ so that we can make the assumption that the unobserved effect, $a_{i}$, has zero mean

2. The above equation becomes the proper Random Effect Model since we don't need to eliminate $a_{i}$ given the assumption of no correlation between $a_{i}$ and any $x_{itj}$:
$$
\mathrm{Cov}(x_{itj},a_{i})=0,\quad t=1,2,...,T \; j=1,2,...,k
$$
3. If we define the composite error as $\nu_{it}=a_{i} + u_{it}$, since $a_{i}$ is always present in each time period, $v_{it}$ are **serially correlated across time**:
$$
\mathrm{Corr}(\nu_{it},\nu_{is})=\sigma_{a}^{2}/(\sigma_{a}^{2}+\sigma_{u}^{2}) > 0,\quad t\neq s
$$
	where:
$$
\begin{align}
\sigma_a^2=\mathrm{Var}(a_i)\\ \\
\sigma_{u}^{2}=\mathrm{Var}(u_{it})
\end{align}
$$
4. Define the transformation:
$$
\theta=1-[\sigma_u^2/(\sigma_u^2+T\sigma_a^2)]^{1/2}
$$
5. Then we apply the following particular case of **Generalized Least Squares** transformation for the equation:
$$
y_{it}-\theta\bar{y}_{i}=\beta_{0}(1 - \theta) + \beta_{1}(x_{it1} - \theta\bar{x}_{i1}) +\dots+ \beta_{k}(x_{itk}-\theta\bar{x}_{ik}) + (\nu_{it}-\theta\bar{\nu}_{i})
$$
6. The GLS Estimator is just the Pooled OLS Estimator of this new equation

>[!warning] Differences with FE Model
>1. The random effects transformation subtracts a **fraction of that time average**, where the fraction depends on:
>	- $\sigma_{u}^{2}$
>	- $\sigma_a^2$
>	- the number of time periods $T$
>2. The GLS transformation *allows for explanatory variables that are constant over time* (one advantage of RE)

>[!tip] FGLS for $\theta$
>The **[[Feasible Generalized Least Squares]] estimator** that uses $\hat{\theta}$ for estimating $\theta$ is called the **random effects estimator**.

#### RE as a generalization of both Pooled OLS and FE

The Random Effect equation allows us to relate the RE estimator to both pooled OLS and fixed
effects:
- $\theta=0$ $\implies$ **Pooled OLS**
- $\theta=1$ $\implies$ **FE Model**

**Cases**:
- $\hat{\theta} \rightarrow 0$ when the unobserved effect $a_{i}$ is relatively unimportant
- $\hat{\theta} \rightarrow 1$ when:
	a. $\sigma_{a}^2 \gg \sigma_{u}^2$
	b. $T$ is large

>[!info] Suggestion
>In applications of FE and RE, it is usually informative also to compute the pooled OLS estimates. Comparing the three sets of estimates can help us determine the nature of the biases caused by leaving the unobserved effect, $a_{i}$, entirely in the error term.


## RE Assumptions

The ideal random effects assumptions include <mark style="background: #ADCCFFA6;">FE.1</mark>, <mark style="background: #ADCCFFA6;">FE.2</mark>, <mark style="background: #ADCCFFA6;">FE.4</mark>, <mark style="background: #ADCCFFA6;">FE.5</mark>, and <mark style="background: #ADCCFFA6;">FE.6</mark>. (FE.7 could be added but it gains us little in practice because we have to estimate $\theta$.) Because we are only subtracting a fraction of the time averages, we can now **allow time-constant explanatory variables**. So:
- <mark style="background: #ADCCFFA6;">FE.3</mark> is replaced with <mark style="background: #ADCCFFA6;">RE.3</mark> 
- <mark style="background: #ADCCFFA6;">FE.4</mark> is extended and replaced with <mark style="background: #ADCCFFA6;">RE.4</mark>
- <mark style="background: #ADCCFFA6;">FE.5</mark> is extended by <mark style="background: #ADCCFFA6;">RE.5</mark>

1. **No Perfect Collinearity Assumption** <mark style="background: #ADCCFFA6;">RE.3</mark>: There are no perfect linear relationships among the explanatory variables. 

2. **Fixed Effect Mean Assumption** <mark style="background: #ADCCFFA6;">RE.4</mark>: The cost of allowing time-constant regressors is that we must add assumptions about how the unobserved effect, $a_i$, is related to the explanatory variables $\implies$ in addition to <mark style="background: #ADCCFFA6;">FE.4</mark>, the expected value of $a_i$ given all explanatory variables is constant: 
$$
E(a_i \mid X_i) = \beta_0.
$$
>[!tip] RE.4 $\implies$ Unobserved Effect Correlation
>- This is the assumption that rules out correlation between the unobserved effect and the explanatory variables
>- It is the key distinction between fixed effects and random effects. 
>- Because we are assuming $a_i$ is uncorrelated with all elements of $x_{it}$, we can include time-constant explanatory variables. (Technically, the quasi-time-demeaning only removes a fraction of the time average, and not the whole time average.) 
>- We allow for a nonzero expectation for $a_i$ in stating Assumption RE.4 so that the model under the random effects assumptions contains an intercept, $\beta_0$.
>- Remember, we would typically include a set of time-period intercepts, too, with the first year acting as the base year.

We also need to impose homoskedasticity on $a_i$ as follows:

3. **Fixed Effect Homoskedasticity Assumption** <mark style="background: #ADCCFFA6;">RE.5</mark>: In addition to <mark style="background: #ADCCFFA6;">FE.5</mark>, the variance of $a_i$ given all explanatory variables is constant:
$$
\text{Var}(a_i \mid X_i) = \sigma_a^2.
$$

>[!tip] FE.1, FE.2, RE.3, RE.4, RE.5, FE.6 $\implies$ Consistency and Asymptotical Normality
>Under the six random effects assumptions (FE.1, FE.2, RE.3, RE.4, RE.5, and FE.6), the RE estimator is **consistent** and **asymptotically normally distributed** as $N$ gets large for fixed $T$. 
>Actually, consistency and asymptotic normality follow under the first four assumptions, but without the last two assumptions the usual RE standard errors and test statistics would not be valid. 

>[!tip] FE.1, FE.2, RE.3, RE.4, RE.5, FE.6 $\implies$ Asymptotical Efficiency
>In addition, under the six RE assumptions, the RE estimators are asymptotically efficient. This means that, in large samples, the RE estimators will have *smaller standard errors* than the corresponding pooled OLS estimators (when the proper, robust standard errors are used for pooled OLS). For coefficients on time-varying explanatory variables (the only ones estimable by FE), the RE estimator is more efficient.

## RE vs FE

1. fixed effects allows arbitrary correlation between $a_{i}$ and $x_{itj}$ $\implies$ FE more convincing for estimating **ceteris paribus effects**
2. If the key exploratory variable is constant over time $\implies$ we cannot estimate its effect on $y$ with FE
3. If one uses RE $\implies$ as many time-constant controls as possible are included among the explanatory variables (with FE not necessary to include such controls).
4. RE more efficient than Pooled OLS
5. It is common to apply both random effects and fixed effects, and then formally test for statistically significant differences in the coefficients on the time-varying explanatory variables with the [[Hausman Test]]
