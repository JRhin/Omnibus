**Issue**:
We have to extend the [[Instrumental Variables]]-based estimation process for the [[Multiple Regression Model]] to the case where multiple possible exogenous (relevant variables correlated with the dependent variable) have been omitted or multiple valid Instrumental Variables actually exist!

#### Case 1: one endogenous explanatory variable and multiple omitted variables

- Given for example:
	- a simple MRL setup (the same that we used in `Case 1` of the notes on [[Instrumental Variables]]) such as: $$y_{1}=\beta_{0}+\beta_{1}y_{2} + \beta_{2}z_{1} + u_{1}$$
	- this time *2 exogenous variables* are actually omitted, $z_{2},z_{3}$

- **Exclusion restrictions** about $z_{2},z_{3}$ $\implies$ the assumptions that:
	1. these variables are omitted relevant variables
	2. they are uncorrelated with $u_{1}$

- If they are both correlated with $y_{2}$ we could just use (one of) them as IVs $\rightarrow$ same if we choose any possible linear combination of the two

- To find the **best IV** we choose the *linear combination of the above variables* that is the most highly correlated with $y_{2}$. The procedure is the following:
	1. given the **reduced equation** $$y_{2}=\pi_{0} + \pi_{1}z_{1} + \pi_{2}z_{2} + \pi_{3} z_{3} +\nu_{2}$$
	2. remember that $$\mathbb{E}(\nu_{2})=Cov(z_{1},\nu_{2})=Cov(z_{2},\nu_{2})=Cov(z_{3},\nu_{2})=0$$
	3. the best IV for $y_{2}$ is $y_{2}^*$, i.e. the best linear combination from the above reduced equation $$y_{2}^*=\pi_{0} + \pi_{1}z_{1} + \pi_{2}z_{2} + \pi_{3} z_{3}$$
	5. notice that:
		1. $y_{2}^*$ $\rightarrow$ the part of $y_{2}$ uncorrelated with $u_{1}$
		2. $\nu_{2}$ $\rightarrow$ the part of $y_{2}$ correlated with $u_{1}$ $\rightarrow$ the possible cause of endogeneity in $y_{2}$
	6. $y_{2}^*$ not perfectly correlated with $z_{1}$ $\iff$ $\pi_{2} \neq 0$ or $\pi_{3} \neq 0$ $\rightarrow$ **key identification assumption**

- **In practice**:
	1. given data on $z_{j}$ we can estimate the reduced form by OLS $$\hat{y}_{2}=\hat{\pi}_{0}+\hat{\pi}_{1}z_{1}+\hat{\pi}_{2}z_{2}+\hat{\pi}_{3}z_{3}$$
	2. once obtained the fitted values $\hat{y}_{2}$ we test the joint significance of $z_{2},\,z_{3}$ in the reduced eq. $\implies$ if they are not relevant STOP...we are wasting our time with these IVs
	3. otherwise $\hat{y}_{2}$ can be used as IV for $y_{2}$
	4. the 3 equations for estimating $\hat{\beta}_{0},\,\hat{\beta}_{1},\,\hat{\beta}_{2}$ can be partially used (only replace the third eq.): $$\begin{cases}
\sum_{i=1}^{n}(y_{i1}-\hat{\beta}_{0}-\hat{\beta}_{1}y_{i2}-\hat{\beta}_{2}z_{i1})=0 \\
\sum_{i=1}^{n}z_{i1}(y_{i1}-\hat{\beta}_{0}-\hat{\beta}_{1}y_{i2}-\hat{\beta}_{2}z_{i1})=0 \\
\sum_{i=1}^{n}\hat{y}_{i2}(y_{i1}-\hat{\beta}_{0}-\hat{\beta}_{1}y_{i2}-\hat{\beta}_{2}z_{i1})=0
\end{cases}$$
	5. $\hat{y}_{i2}$ as the instrument, is also called the **two stage least squares (2SLS) estimator**

>[!info] Why is it called Two-Stages Least Squares?
>it can be shown that when we use $\hat{y}_{2}$ as the IV for $y_{2}$, the IV estimates $\hat{\beta}_{0},\,\hat{\beta}_{1},\,\hat{\beta}_{2}$ are identical to the OLS estimates from the regression of $y_{1}$ on $z_{1}$ and $\hat{y}_{2}$.
>
>The 2 stages:
>1. run the regression $\hat{y}_{2}=\hat{\pi}_{0}+\hat{\pi}_{1}z_{1}+\hat{\pi}_{2}z_{2}+\hat{\pi}_{3}z_{3}$
>2. run the regression of $y_{1}$ on $z_{1}$ and $\hat{y}_{2}$

>[!tip] OLS vs 2SLS Multicollinearity
>Problem of multicollinearity is more serious in 2SLS
>
>Proof (non-formal):
>1. Consider the asymptotic variance of the 2SLS estimator $\hat{\beta}_{1}$: $$Var(\hat{\beta}_{1})=\frac{\sigma^2}{\hat{SST}_{2}(1-\hat{R}^2_{2})}$$
>2. Where:
>	1. $\sigma^2=Var(u_{1})$
>	2. $\hat{SST}$ $\rightarrow$ tot. variation in $\hat{y}_{2}$
>	3. $\hat{R}^2_{2}$ $\rightarrow$ from a regression of $\hat{y}_{2}$ on all other exogenous variables comparing in the structural eq.
>3. By construction $\hat{y}_{2}$ has less variation than $y_{2}$
>4. Correlation between the exogenous variables and $\hat{y}_{2}$ is often much higher than the between $y_{2}$ and these variables
>5. The above variance is larger than the once in OLS


#### Case 2: multiple endogenous explanatory variables

- Given for example:
	- a simple MRL setup such as: $$y_1=\beta_0+\beta_1y_2+\beta_2y_3+\beta_3z_1+\beta_4z_2+\beta_5z_3+u_1$$
	- this time the 2 exogenous variables $z_{2},z_{3}$ are actually included but we have two different endogenous variables $y_{2}, \, y_{3}$ that may be correlated with $u_{1}$

- To estimate the above regression **by 2SLS**, we need *at least two exogenous variables* that satisfy the **Exclusion restrictions**:
	1. these variables are omitted relevant variables
	2. they are uncorrelated with $u_{1}$

- **Problem**:
  A **new problem** arises when we have multiple endogenous variables in the regression: 
  the exclusion restrictions for the (at least) two exogenous variables are *necessary but not sufficient* for consistent 2SLS estimates 
- **Solution**:
	- To solve this problem we introduce the **Order Condition for Identification of an Equation**:
	  We need **at least as many excluded exogenous variables as there are included endogenous explanatory variables** in the structural equation.
	- We can check the Order Condition by counting endogenous and exogenous variables.

>[!warning] Estimation methods and NOT models
>OLS and 2SLS are different estimation methods that are applied to the same model. It is true that they have desirable statistical properties under different sets of assumptions on the model, but the relationship they are estimating is given by the equation in 2SLS.1 (or MLR.1). 
>
>We can say the same for pooled OLS, first differencing, fixed effects, and random effects are different estimation methods for the same model.


## Testing Multiple Hypotheses after 2SLS Estimation

**Problem**:
R-squared in 2SLS can be negative $\implies$ usual F statistics might not be appropriate
$\implies$ if we use the 2SLS residuals to compute the SSRs for both the restricted and unrestricted models, there is no guarantee that $SSR_{r}\geq SSR_{ur}$

**Solution**:
Combine the sum of squared residuals from the second stage regression with $SSR_{ur}$ to obtain a statistic with an approximate F distribution in large samples.

## 2SLS Assumptions

1. **Linearity in the Parameters** <mark style="background: #ADCCFFA6;">2SLS.1</mark>:
   The model in the population can be written as
$$
y = \beta_0 + \beta_1 x_1 + \beta_2 x_2 + \ldots + \beta_k x_k + u,
$$
	where $\beta_0, \beta_1, \ldots, \beta_k$ are the unknown parameters (constants) of interest, and $u$ is an unobserved random error or random disturbance term. The instrumental variables are denoted as $z_j$.


2. **Random Sampling** <mark style="background: #ADCCFFA6;">2SLS.2</mark> 
   We have a random sample on $y$, the $x_j$, and the $z_j$.

3. **Rank Condition** <mark style="background: #ADCCFFA6;">2SLS.3</mark>
   1.  There are no perfect linear relationships among the instrumental variables
   2. The rank condition for identification holds.

>[!tip] 2SLS.3 with one or more endogenous variables
>With a single endogenous explanatory variable the rank condition is easily described. Let $z_1, \ldots, z_m$ denote the exogenous variables, where $z_k, \ldots, z_m$ do not appear in the structural model. The reduced form of $y_2$ is $$y_2 = \pi_0 + \pi_1 z_1 + \pi_2 z_2 + \ldots + \pi_{k-1} z_{k-1} + \pi_k z_k + \ldots + \pi_m z_m + \nu_2.$$
>Then, we need at least one of $\pi_k, \ldots, \pi_m$ to be nonzero. This requires **at least one exogenous variable that does not appear in the structural model** (the order condition). Stating the rank condition with two or more endogenous explanatory variables requires some more matrix algebra...

4. **Exogenous Instrumental Variables** <mark style="background: #ADCCFFA6;">2SLS.4</mark> 
   The error term $u$ has zero mean, and each IV is uncorrelated with $u$. Remember that any $x_j$ that is uncorrelated with $u$ also acts as an IV.

>[!tip] 2SLS.1 - 2SLS.4 $\implies$ consistency
>Under Assumptions 2SLS.1 through 2SLS.4, the 2SLS estimator is **consistent**.

5. **Homoskedasticity** <mark style="background: #ADCCFFA6;">2SLS.5</mark>
   Let $z$ denote the collection of all instrumental variables. Then, 
$$
E(u^2 \mid z) = \sigma^2.
$$

>[!tip] 2SLS.1 - 2SLS.5 $\implies$ normality
>Under Assumptions 2SLS.1 through 2SLS.5, the 2SLS estimators are **asymptotically normally distributed**. Consistent estimators of the asymptotic variance are given as above, where $\sigma^2$ is replaced with $$\hat{\sigma}^2 = \frac{1}{n - k - 1} \sum_{i=1}^n \hat{u}_i^2$$
>and the $\hat{u}_i$ are the 2SLS residuals. The 2SLS estimator is also the best IV estimator under the five assumptions given. 

>[!tip] 2SLS.1 - 2SLS.5 $\implies$ asymptotical efficiency
>Under Assumptions 2SLS.1 through 2SLS.5, the 2SLS estimator is asymptotically efficient in the class of IV estimators that uses linear combinations of the exogenous variables as instruments.

>[!danger] Heteroskedasticity implications
>If the homoskedasticity assumption does not hold, the 2SLS estimators:
>- are still asymptotically normal,
>- but the standard errors (and $t$ and $F$ statistics) need to be adjusted,
>- are no longer the asymptotically efficient IV estimators.


6. **No Serial Correlation**  <mark style="background: #ADCCFFA6;">2SLS.6</mark>
   This assumption is only needed for 2SLS estimation with timeseries or panel data

## Testing for Endogeneity

>[!tip] OLS vs 2SLS
>- 2SLS estimator is less efficient than OLS when the explanatory variables are exogenous
>- 2SLS estimates can have very large standard errors
>$\implies$ it is useful to first test for endogeneity and then apply 2SLS if needed

**Setup**:
- Given the MLR model: $$y_1=\beta_0+\beta_1y_2+\beta_2z_1+\beta_3z_2+u_1$$
- $z_{1},\,z_{2}$ $\rightarrow$ exogenous
- $z_{3},z_{4}$ $\rightarrow$ omitted exogenous
- $y_{2}$ $\rightarrow$ endogenous (otherwise we would simply opt for OLS)

**Question**:
How do we test is $y_{2}$ uncorrelated with $u_{1}$?

**Idea**:
- Directly compare the OLS and 2SLS estimates
- If the differences are statistically significant $\implies$ $y_{2}$ must be endogenous

Procedure:
1. Estimate the *reduced form equation* by OLS: $$y_2=\pi_0+\pi_1z_1+\pi_2z_2+\pi_3z_3+\pi_4z_4+\nu_2$$
2. Obtain the reduced form residuals $\hat{\nu}_{2}$
3. We notice that $y_{2}$ uncorrelated with $u_{1}$ $\iff$ $\nu_{2}$ uncorrelated with $u_{1}$
4. Write: $$u_{1}=\delta_{1}\nu_{2}+e_{1}$$
5. Where:
	1. $e_{1}$ uncorrelated with $\nu_{2}$
	2. $\mathbb{E}(\nu_{2})=0$
6. Note that $u_{1}$ uncorrelated with $v_{2}$ $\iff$ $H_{0}:\; \delta_{1}=0$
7. Estimate the following equation by OLS: $$y_1=\beta_0+\beta_1y_2+\beta_2z_1+\beta_3z_2+\delta_1\hat{v}_2+error$$
8. Test $H_{0}:\; \delta_{1}=0$ $\implies$ rejection implies $y_{2}$ is endogenous since $u_{1}$ and $\nu_{2}$ are correlated!

