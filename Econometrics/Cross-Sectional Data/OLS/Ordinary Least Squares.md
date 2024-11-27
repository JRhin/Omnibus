---
title: Ordinary Least Squares
created: 2024-09-16
authors:
  - Engrima
tags:
  - Econometrics
  - Cross-Sectional_Data
  - OLS
---
## Simple Linear Regression Setup

**Setup**: 
- Given a [[Simple Regression Model]] : 
$$
y = \beta_{0 }+ \beta_{1}x + u
$$
- Given a random sample of data $\{x_{i}, y_{i}: i=1,\dots,n\}$ 
- We can estimate $\beta_{0}$ and $\beta_{1}$ finding $\hat{\beta}_{0}$ and $\hat{\beta}_{1}$.

**Procedure for $\hat{\beta}_{0}$**:
1. Use the <mark style="background: #ADCCFFA6;">SRL.1</mark> - <mark style="background: #ADCCFFA6;">SRL.4</mark> assumptions to get:

$$
\begin{cases}
\mathbb{E}[u] = \mathbb{E}[y- \beta_{0} - \beta_{1}x] = 0 \\ \\
Cov(x,u) = \mathbb{E}[xu] = \mathbb{E}[x(y- \beta_{0} - \beta_{1}x)] = 0
\end{cases}
$$
2. Now consider the equations in the "random sample" setup getting the <mark style="background: #D2B3FFA6;">First order conditions</mark> for the OLS estimates:
$$
\begin{cases}
a) \space\space\space n^{-1} \sum_{i=0}^n (y_{i} - \hat{\beta}_{0} - \hat{\beta}_{1}x_{i}) = 0\\ \\
b) \space\space\space n^{-1} \sum_{i=0}^{n} x_{i} (y_{i} - \hat{\beta}_{0} - \hat{\beta}_{1}x_{i}) = 0
\end{cases} 
$$
3. We can get the *OLS estimate of the intercept* $\hat{\beta}_{0}$ and the *OLS estimate of the slope* $\hat{\beta}_{1}$:
$$
a) \space\space\space \implies \bar{y} = \hat{\beta}_{0} +\hat{\beta}_{1}\bar{x} \implies \hat{\beta}_{0} = \bar{y} - \hat{\beta}_{1}\bar{x}
$$

**Procedure for $\hat{\beta}_{1}$**:
1. Can be proved that:
$$
\begin{cases}
\sum_{i=1}^nx_i(x_i-\bar{x})=\sum_{i=1}^n(x_i-\bar{x})^2 \\ \\
\sum_{i=1}^nx_i(y_i-\bar{y})=\sum_{i=1}^n(x_i-\bar{x})(y_i-\bar{y}).
\end{cases}

$$
2. Provided that $\sum_{i=1}^n(x_i-\bar{x})^2>0$ (which is always true if the sample values $x_{i}$ are <mark style="background: #FFB8EBA6;">not all equal</mark>)
3. We get:
$$
b) \space\space\space \implies \sum_{i=1}^nx_i[y_i-(\bar{y}-\hat{\beta}_1\bar{x})-\hat{\beta}_1x_i]=0 \implies \sum_{i=1}^nx_i(y_i-\bar{y})=\hat{\beta}_1\sum_{i=1}^nx_i(x_i-\bar{x}) 
$$
$$
\implies \hat{\beta}_1=\frac{\sum_{i=1}^n\left(x_i-\bar{x}\right)\left(y_i-\bar{y}\right)}{\sum_{i=1}^n\left(x_i-\bar{x}\right)^2}.
$$

**Summing-up**:
the OLS estimates for our parameters are:
$$
\hat{\beta}_{0} = \bar{y} - \hat{\beta}_{1}\bar{x}
$$
$$
\hat{\beta}_1=\frac{\sum_{i=1}^n\left(x_i-\bar{x}\right)\left(y_i-\bar{y}\right)}{\sum_{i=1}^n\left(x_i-\bar{x}\right)^2}.
$$
> [!tip] 
>  - $x$ and $y$ positive correlated $\implies$ $\hat{\beta}_{1}>0$
>  -  $x$ and $y$ negative correlated $\implies$ $\hat{\beta}_{1}<0$

We consequently define:
- **Fitted value** for observation $i$ :
$$
\hat{y}_{i}= \hat{\beta}_{0}+ \hat{\beta}_{1}x_{i}
$$
- **Residual** for observation $i$ :
 $$
 \hat{u}_{i}=y_{i}-\hat{y}_{i}=y_{i}-\hat{\beta}_{0}-\hat{\beta}_{1}x_{i}
 $$
	 where:
	 - $\hat{u}_{i}>0 \implies$ the regression line *overpredicts* $y_{i}$ 
	 - $\hat{u}_{i}<0 \implies$ the regression line *underpredicts* $y_{i}$ 
- **OLS regression line**:
$$
\hat{y}=\hat{\beta}_0+\hat{\beta}_1x,
$$
- **Total sum of squares** 
	- $\to$ a measure of the total sample variation in the $y_{i}$
	- consider that $\frac{\mathrm{SST}}{(n-1)}$ is the sample variance
	- consider that $\bar{y}=\frac{1}{n }\sum_{i=1}^n y_{i}$ is the sample mean
$$
\mathrm{SST}\equiv\sum_{i=1}^{n}(y_{i}-\bar{y})^{2}
$$
- **Explained sum of squares**
	- $\to$ a measure of the sample variation in the $\hat{y}_{i}$
	- consider that $\bar{\hat{y}}=\hat{y}$
$$
\\\mathrm{SSE}\equiv\sum_{i=1}^{n}(\hat{y}_{i}-\bar{y})^{2}
$$
- **Residual sum of squares**:
	- a measure of the sample variation in the $\hat{u}_{i}$
  $$
\\\mathrm{SSR}\equiv\sum_{i=1}^{n}\hat{u}_{i}^{2}
$$
>[!tip] Relation between $\mathrm{SST} ,\; \mathrm{SSE},\; \mathrm{SSR}$
>By using the properties of the summation operator and some algebre, we can proof that:
> $$\mathrm{SST}=\mathrm{SSE}+\mathrm{SSR}$$

> [!info]  Why are $\hat{\beta}_{o}$ and $\hat{\beta}_{1}$ called *OLS solutions*?
> It can be proved that the OLS solutions defined as above minimize the **sum of squared residuals**, i.e.:
> $$(\hat{\beta}_{0}, \hat{\beta}_{1}) = \text{argmin} \left( \sum_{i=1}^n \hat{u}^2 \right) = \text{argmin} \sum^{n}(y_{i}-\hat{\beta}_{0}-\hat{\beta}_{1}x_{i})^{2}$$

![[Pasted image 20240429205611.png|450x390]]

> [!info]  Why to not minimize some other function instead of the sum of residuals?
> 1. minimizing some other function might lead to not closed (e.g. when using the sum of absolute values) forms and heavy optimization routines
> 2. with OLS we'll be able to derive *unbiasedness*, *consistency* and some other important statistical properties
> 3. OLS is suited for estimating the parameters appearing in the conditional mean function $\mathbb{E}[y|x]$

>[!tip] Algebraic properties of OLS statistics:
>
>1. The OLS estimates are chosen to make residuals add up to zero:
>   $$
>\sum_{i=1}^n\hat{u}_i=0.
>$$
>2. The sample covariance between the regressors and the OLS residuals is zero:
>   $$
>\sum_{i=1}^nx_i\hat{u}_i=0
>$$
>3. The point $(\bar{x},\bar{y})$ is always on the OLS regression line.


## Multiple Linear Regression Setup

**Setup**: 
- Given a [[Multiple Regression Model]]:
$$
y=\beta_0+\beta_1x_1+\beta_2x_2 + \dots + \beta_{k}x_{k} +u
$$
- Given a random sample of data $\{x_{i}, y_{i}: i=1,\dots,n\}$ 
- We can estimate $\beta_{0}, \dots \beta_{k}$ , finding $\hat{\beta}_{0} \dots \hat{\beta}_{k}$.

**Idea**:
The $k+1$ OLS estimates are chosen to minimize the *sum of squared residuals*:
$$
\sum_{i=1}^{n}(y_{\mathrm{i}}-\hat{\beta}_{0}-\hat{\beta}_{1}x_{i1}-...-\hat{\beta}_{k}x_{ik})^{2}
$$

**Procedure**:
1. This minimization problem leads to the resolution of the OLS **first order conditions**, i.e. $k+1$ equations in $k+1$ variables $\hat{\beta}_{0} \dots \hat{\beta}_{k}$:
$$
\begin{cases}
\sum_{i=1}^{n}(y_{i}-\hat{\beta}_{0}-\hat{\beta}_{1}x_{i1}-...-\hat{\beta}_{k}x_{ik})=0\\\sum_{i=1}^{n}x_{i1}(y_{i}-\hat{\beta}_{0}-\hat{\beta}_{1}x_{i1}-...-\hat{\beta}_{k}x_{ik})=0\\\sum_{i=1}^{n}x_{i2}(y_{i}-\hat{\beta}_{0}-\hat{\beta}_{1}x_{i1}-...-\hat{\beta}_{k}x_{ik})=0\\\sum_{i=1}^{n}x_{ik}(y_{i}-\hat{\beta}_{0}-\hat{\beta}_{1}x_{i1}-...-\hat{\beta}_{k}x_{ik})=0
\end{cases}
$$
2. The OLS first order conditions can be solved using the assumptions:
$$
\begin{cases}
\mathbb{E}[u]=0 \\ \\
\mathbb{E}[x_{j}u]=0 \space \space ,\space j=1,2,\dots,k
\end{cases}
$$
3. Thus we obtain the **OLS regression line**:
$$
\hat{y}=\hat{\beta}_0+\hat{\beta}_1x_1+\hat{\beta}_2x_2+...+\hat{\beta}_kx_k
$$
4. Or in terms of changes:
$$
\Delta\hat{y}=\hat{\beta}_{1}\Delta x_{1}+\hat{\beta}_{2}\Delta x_{2}+...+\hat{\beta}_{k}\Delta x_{k}
$$

5. Thus the **prediction** and the **residuals** for the single $i$-th example are respectively:
$$
\hat{y}_{i}=\hat{\beta}_{0}+\hat{\beta}_{1}x_{i1}+\hat{\beta}_{2}x_{i2}+...+\hat{\beta}_{k}x_{ik}
$$
$$
\hat{u}_i=y_i-\hat{y}_i
$$
>[!tip] Properties of $\hat{y}_{i}$ and $\hat{u}_{1}$:
>1. $\bar{y}=\bar{\hat{y}}$
>2. $Cov(x_{i}, u_{i})=0 \quad \forall i$
>3. $Cov(\hat{y}_{i},\hat{u}_{i})=0 \quad \forall i$
>4. The point $\bar{x}_{1},\dots,\bar{x}_{k}$ is always on the OLS regression line, i.e.: $$\bar{y}=\hat{\beta}_0+\hat{\beta}_1\bar{x}_1+\hat{\beta}_2\bar{x}_2+...+\hat{\beta}_k\bar{x}_k$$

>[!tip] MRL coefficients interpretation
>The coefficient on $x_{1}$ measures the change in $\hat{y}$ due to a one-unit increase in $x_{1}$, holding all other independent variables fixed. Thus, we have controlled for the variables $x_2, ..., x_k$ when estimating the effect of $x_{1}$ on $y$, i.e.:
> $$\Delta\hat{y}=\hat{\beta}_1\Delta x_1$$

>[!tip] *Partialling-out* interpretation of MLR coefficients
> 1. Case with $k=2$ where the MLR is given by $\hat{y}=\hat{\beta}_{0}+ \hat{\beta}_{1}x_{1} + \hat{\beta}_{2}x_{2}$. We can express the OLS estimate of $\beta_{1}$ in a closed form: $$\hat{\beta}_{1}= \frac{\left|\sum_{i=1}^{n}\hat{r}_{i1}y_{i}\right|}{\left|\sum_{i=1}^{n}\hat{r}_{i1}^{2}\right|}$$
>    where $\hat{r}_{i1}$ are the OLS residuals from a simple regression of $x_{1}$ on $x_{2}$ (we can then do a simple regression of $y$ on $\hat{r}_{1}$ to obtain $\hat{\beta}_{1}$).
> 2. General case with $k$ explanatory variables, $\beta_{1}$ can still be written as above but the residuals $\hat{r}_{i1}$ come from the multiple regression of $x_1$ on $x_2, ..., x_k$.

>[!info] Auxiliary residuals
> The residuals $\hat{r}_{i1}$ (for $k=2$) are the part of $x_{i1}$ that is uncorrelated with $x_{i2}$.
> We can also say that  $\hat{r}_{i1}$ is $x_{i1}$ after the effects of $x_{i2}$ have been **partialled-out**.

>[!danger] OLS solution
> Thanks to the partialling-out formulation we do not need to solve the system of equations for the first-order conditions

## MRL vs SRL OLS Estimates

If we consider:
1.  the **simple regression**: $\tilde{y}=\tilde{\beta}_{0}+\tilde{\beta}_{1}x_{1}$
2.  the **multiple regression**: $\hat{y}=\hat{\beta}_{0}+\hat{\beta}_{1}x_{1}+\hat{\beta}_{2}x_{2}$
	
There is the following relationship between $\tilde{\beta}_{1}$ and $\hat{\beta}_{1}$:
$$
\tilde{\beta}_{1}=\hat{\beta}_{1}+\hat{\beta}_{2}\tilde{\delta}_{1}
$$
where:
- $\tilde{\delta}_{1}$ is the slope coefficient from the simple regression of $x_{i2}$ on $x_{i_{1}}$ for $i=1,\dots,n$
- $\hat{\beta}_{2}\tilde{\delta}_{1}$ is called the **confounding term** since is what differentiates $\tilde{\beta}_{1}$ from $\hat{\beta}_{1}$ 

>[!tip] MRL = SRL
>For the previous example, we have that $\tilde{\beta}_{1}=\hat{\beta}_{1}$ if:
>	1. the partial effect of $x_{2}$ on $\hat{y}$  is $0$ $\to$ $\hat{\beta}_{2}=0$
>	2. $x_{1}$ and $x_2$ are uncorrelated in the sample $\to$ $\tilde{\delta}_{1}=0$

## Properties of the OLS Estimators

#### Theorem: Unbiasedness of Sampling Expected Values of OLS Estimators
Under Assumptions <mark style="background: #ADCCFFA6;">MLR.1</mark> through <mark style="background: #ADCCFFA6;">MLR.4</mark> we have:
$$
\mathbb{E}(\hat{\beta}_{j})=\beta_{j} \quad ,j=0,1,\ldots,k
$$

#### Theorem: Sampling Variances of the OLS Estimators
Under Assumptions <mark style="background: #CACFD9A6;">MLR.1</mark> through<mark style="background: #CACFD9A6;"> MLR.5</mark>,

$$\mathrm{Var}(\hat{\beta}_{j}) = \frac{\sigma^{2}}{\mathrm{SST}_{j}\cdot(1-R_{j}^2)} \quad ,j=1,\dots,k$$
where:
- $\mathrm{SST}=\sum_{i=1}^{n} (x_{ij}-\bar{x}_{j})^{2}$
- $R_{j}^2$ is R-squared from regressing $x_{j}$ on all the other independent variables

#### Estimating $\sigma^2$ to estimate OLS Variance
**Goal**:
We need an unbiased estimator of $\sigma^2$ to obtain un biased estimator of $\mathrm{Var}(\hat{\beta}_{j}) = \frac{\sigma^{2}}{\mathrm{SST}_{j}\cdot(1-R_{j}^2)}$

**Solution**:
As for the Simple Linear Regression model, we know that $\sigma^2=\frac{1}{n}\sum_{i=1}^n\hat{u}_{i}^2$ would be a biased estimator $\implies$ we need to account for the degrees of freedom generalizing the estimator that we obtained in the SLR setup for our MLR setup with $k$ independent variables:
$$
\hat{\sigma}^{2}= \frac{\sum_{i=1}^{n}\hat{u}_{i}^{2}}{n-k-1}=\frac{\mathrm{SSR}}{n-k-1}
$$

#### Theorem: Unbiasedness of the OLS Error Variance
Under Assumptions <mark style="background: #CACFD9A6;">MLR.1</mark> through<mark style="background: #CACFD9A6;"> MLR.5</mark> ([[Gauss-Markov Assumptions]]), given the estimate $\hat{\sigma}^2$ as above, we get:
$$
\mathbb{E}(\hat{\sigma}^2)=\sigma^2
$$
The **standard error of the regression** (SER) is then defined as $\hat{\sigma}$

#### Estimating the OLS Standard Error
Once we obtained the SER we can derive an unbiased estimate for the coefficient standard error.

1. Given the OLS standard deviation for the $j$-th coefficient $\hat{\beta}_{j}$:
$$
\mathrm{sd}(\hat{\beta}_{j})=\sigma/[\mathrm{SST}_{j}(1-R_{j}^{2})]^{1/2}
$$
2. We can derive an estimate of $\mathrm{sd}(\hat{\beta}_{j})$ by introducing the **OLS Standard Error**:
	- in the *homoscedastic* setup:
$$
\mathrm{se}(\hat{\beta}_{j})=\hat{\sigma}/[\mathrm{SST}_{j}(1-R_{j}^{2})]^{1/2}
$$
	- in the *heteroscedastic* setup:
$$
\mathrm{se}(\hat{\beta}_j)=\frac{\hat{\sigma}}{\sqrt{n}\cdot\mathrm{sd}(x_j) \sqrt{1 - R_j^2}}
$$
		where $\mathrm{sd}(x_{j})$ is the **sample standard deviation**:
$$
\mathrm{sd}(x_{j})=\sqrt{n^{-1}\sum_{i=1}^{n}(x_{ij}-\overline{x}_{j})^{2}}
$$
#### Efficiency of OLS
According to the Gauss-Markov Theorem, we know that the OLS Estimators are **[[BLUE Estimator]]s**
(best linear unbiased estimators), when under Assumptions <mark style="background: #CACFD9A6;">MLR.1</mark> through<mark style="background: #CACFD9A6;"> MLR.5</mark>.

#### Minimum Variance Unbiased Estimators
When we add <mark style="background: #ADCCFFA6;">MRL.6</mark> to the Gauss-Markov Assumptions (getting the [[Classical Linear Model Assumptions]]), we improve the **efficiency** of the **[[BLUE Estimator]]s** estimators $\hat{\beta}_{1},\dots,\hat{\beta}_{k}$ making them not only the best (min. variance) estimator among the all unbiased linear estimators, but the **minimum variance estimators** among **all the possible unbiased estimators** (not strictly the linear ones).

#### Theorem: Normal Sampling Distributions of the OLS Estimators
Under the [[Classical Linear Model Assumptions]] <mark style="background: #ADCCFFA6;">MLR.1</mark> through <mark style="background: #ADCCFFA6;">MLR.6</mark>, conditional on the sample values of the independent variables, we have that Normality of the error term translates into *normal sampling distributions of the OLS estimators*:
$$
\hat{\beta}_j\sim\mathrm{Normal}[\beta_j,\mathrm{Var}(\hat{\beta}_j)]
$$

#### Implication: Inference after OLS

1. Standardized sampling distribution
$$
\frac{\hat{\beta}_j-\beta_j}{\mathrm{sd}(\hat{\beta}_j)}\sim\mathrm{Normal}(0,1)
$$
2. Standardized distribution with standard error estimate (r.V.)
$$
\frac{\hat{\beta}_{j}-\beta_{j}}{\mathrm{se}(\hat{\beta}_{j})}\sim t_{n-k-1}=t_{df}
$$

3. We can use the [[T-test]] for testing the **statistical significance** of **individual** independent variables
4. We can find confidence intervals for the OLS coefficients
5. We can use the [[F-test]] or the [[Lagrange Multiplier Test]] for testing **joint statistical significance** of **multiple** independent variables



