#### General setup:

- __Input__ : $y$ and $x$, two variables representing some population
- __Goal__: study how *how y varies with x*
- __Equation__ for the simple regression model: 
$$
y = \beta_{0 }+ \beta_{1}x + u
$$
###### Obs.
- $y$ is called _dependent/ response/ explained variable_
- $x$ is called _independent/ explanatory/ predictor/ control variable_ or _regressor_, _covariate_
- $u$ is the _error_ term $\implies$ represents all the (unobserved) factors other than $x$ that affect $y$ 
- $\beta_{1}$ is the _slope parameter_
- $\beta_{0}$ is the _intercept parameter_

###### Interpretation
If the other factors in $u$ are held fixed, then $x$ has a linear effect on $y$, i.e.:
$$
\Delta u =0 \implies \Delta y= \beta_{1} \Delta x
$$
> [!notice]
>  The above statement relates to the **[[Ceteris Paribus Assumption]]** (strong assumption). 
>  We ==need other assumptions== in order to:
>- use the simple regression model
> - get reliable estimators for $\beta_{1}$ and $\beta_{0}$

## Zero conditional mean assumption

**Zero mean assumption**
If $\beta_{0}$ is defined in the simple regression equation, by simply redefine the intercept, we can always assume that:
$$
\mathbb{E}(u) = 0
$$
__Mean independence assumption__
Assuming $u$ and $x$ to be uncorrelated would not be enough since correlation only measures **linear independence.** We can instead assume that the average value of $u$ doesn't depend on the value of $x$ i.e.:
$$
\mathbb{E}(u|x)=\mathbb{E}(u)
$$

__Zero conditional mean assumption__ (Zero mean + Mean Indep.)
From the 2 above assumptions we get:
$$
\mathbb{E}(u|x)=\mathbb{E}(u)=0
$$
#### Main finding
This final assumption implies the linear dependence relation of the mean of $y$ conditioned on $x$, i.e. the **population regression function**:
$$
\mathbb{E}(y|x)=\mathbb{E}(\beta_{0}+ \beta_{1}x + u|x)=\beta_{0 }+ \beta_{1}x
$$
![[Pasted image 20240429190802.png|450x390]]
#### Implications
1. __Population regression function (PRF)__ 
   $$
\mathbb{E}(y|x) = \beta_{0} + \beta_{1} x
$$
	This eq. tells us that we can break $y$ in two parts:
	- the _systematic part_ of $y$ (explained by $x$) : $\beta_{0} + \beta_{1} x$
	- the _unsystematic part_ of $y$ (not explained by $x$) : $u$
2. The correlation between $u$ and $x$ is zero, i.e. :
$$
Cov(x,u)=\mathbb{E}(xu) =0
$$
3. If we have some data $\{x_{i}, y_{i}: i=1,\dots,n\}$ then we can use the **OLS method** to estimate the parameters $\beta_{0}$ and $\beta_{1}$

## Ordinary Least Squares Estimates

**Setup**: 
Given a random sample of data $\{x_{i}, y_{i}: i=1,\dots,n\}$ we can estimate $\beta_{0}$ and $\beta_{1}$ finding $\hat{\beta}_{0}$ and $\hat{\beta}_{1}$.

**Results**:
the OLS estimates for our parameters are:

$$
\hat{\beta}_{0} = \bar{y} - \hat{\beta}_{1}\hat{x}
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

## Goodness-of-fit

**Goal**: measuring how well the explanatory/ independent variable $x$, explains the dependent variable, $y$.

**Base assumptions**: 
1. an intercept is estimated along with the slope
2. $SST \neq 0$ , which is true unless all $y_i$ are of the same value

We introduce the **R-squared** (or coefficient of determination) statistics, which represents the ratio of explained variation compared to the total variation:
$$
R^2\equiv\mathrm{SSE/SST}=1-\mathrm{SSR/SST}
$$
> [!tip] Properties
> - $R^2$ is interpreted as the fraction of the sample variation in y that is explained by x
> - $R^2 \in [0,1]$ 
> -  $R^2 \simeq 0$ poor fit of the OLS line
> - $R^2$ is equal to the square of the sample correlation coefficient between $y_{i}$ and $\hat{y}_i$

> [!warning]
> Low R-squared does not necessarily mean that an OLS regression equation is useless. It is
still possible that the regression line is a good estimate of the ceteris paribus relationship between variables!


## Other important characteristics of OLS estimates

### Changing Units of Measurement

OLS estimates change in entirely expected ways when the units of measurement of the dependent and independent variables change.

- If the dependent variable is multiplied by the constant $c$ then the OLS intercept and slope estimates are also multiplied by $c$.
- If the independent variable is divided/multiplied by some nonzero constant, $c$, then:
	-  the OLS slope coefficient is multiplied/divided by $c$
	- the OLS intercept is not affected

### Incorporating Nonlinearities

We have focused on linear relationships between the dependent and independent variables but it is rather easy to incorporate many nonlinearities into simple regression analysis by appropriately defining the dependent and independent variables.

> <mark style="background: #ABF7F7A6;">Example 1</mark>:
> Probably a better characterization of how wage changes with education is that each 
> year of education increases wage by a constant percentage.
> A model that gives (approximately) a constant percentage effect is:
> $$
\log(wage)=\beta_0+\beta_1educ+u
$$

> <mark style="background: #ABF7F7A6;">Example 2</mark>:
> Another important use of the natural log is in obtaining a constant elasticity model.
> A constant elasticity model is:
> $$
\log(salary)=\beta_0+\beta_1\log(sales)+u
$$

Here we report a table of typical use cases in econometrics:

![[Pasted image 20240429215935.png]]

> [!warning]
> The simple regression equation is linear in the parameters $\beta_{0}$ and $\beta_{1}$ but there are no restrictions on how y and x relate to the original explained and explanatory variables of interest!
> But, as we have just seen, the interpretation of the coefficients does depend on the variables definitions!

## Expected Values of OLS Estimators

**Simple Regression assumptions** for unbiasedness of OLS:

1. **Linearity in parameters** <mark style="background: #CACFD9A6;">(SRL.1)</mark> 
   $y$ is related to $x$ and $u$ (all *random variables*) as:
$$
y=\beta_{0}+\beta_{1}x+u
$$
2. **Random Sampling** <mark style="background: #CACFD9A6;">(SRL.2)</mark>
   considering $n$ random samples $\{(x_i,y_i): i = 1, 2, ..., n\}$ drawn from the above population model, we can write:
$$
y_{i}=\beta_{0}+\beta_{1}x_{i}+u_{i},\quad i=1,2,...,n
$$ 
3. **Sample Variation in the Explanatory Variable** <mark style="background: #CACFD9A6;">(SRL.3)</mark>
   the sample outcomes on $x$, namely, $\{(x_i,y_i): i = 1, 2, ..., n\}$, are not all the same value. If the sample standard deviation of $x_{i}$ is zero, this assumption fails.
4. **Zero Conditional Mean** <mark style="background: #CACFD9A6;">(SRL.4)</mark>
    the error $u$ has an expected value of zero given any value of the explanatory variable, i.e. :
   $$
\mathbb{E}(u|x)=0.
$$
>[!danger] Errors vs Residuals
>Notice that the sample errors $u_{i}$ are different from the sample residuals $\hat{u}_{i}$ (which are estimates of the sample error). Their relation is given by:
>$$\hat{u}_{i}=u_{i}-(\hat{\beta}_{0}-\beta_{0})-(\hat{\beta}_{1}-\beta_{1})x_{i}$$

>[!info] Random sample version of SRL.4
>SRL.4 can be rewritten for the random samples:
>$$\mathbb{E}(u_{i}|x_{i})=0 \quad i=1,2,...,n$$

>[!info] SRL.4 raison d'être
>SRL.4, coupled with SRL.2 and SRL.3, allows us to derive the statistical properties of the OLS estimators as conditional on the values of the xi in our sample (a nice trick).

>[!warning] Comments on SRL assumptions
>- <mark style="background: #CACFD9A6;">SRL.2</mark> can fail in a cross section when samples are not representative of the underlying population;
>- if the sample standard deviation of $x_{}i$ is zero, then Assumption <mark style="background: #CACFD9A6;">SLR.3</mark> fails; otherwise, it holds;
>- <mark style="background: #CACFD9A6;">SLR.3</mark> almost always holds in interesting regression applications;
>- if <mark style="background: #CACFD9A6;">SLR.4</mark> fails, the OLS estimators generally will be biased $\implies$ possibility that $x$ is correlated with $u$ is almost always a concern in simple regression analysis with nonexperimental data.
#### Theorem: Unbiasedness of Sampling Expected Values of OLS Estimators

Using Assumptions <mark style="background: #CACFD9A6;">SLR.1</mark> through <mark style="background: #CACFD9A6;">SLR.4</mark>, for any values of $\beta_{0}$ and $\beta_{1}$ we can derive the expected values of the OLS estimators:
$$
\mathbb{E}(\hat{\beta}_{0})=\beta_{0}\space \space \operatorname {and} \space \space\mathbb{E}(\hat{\beta}_{1})=\beta_{1}
$$
>[!info] 
>The above theorem can be proved using the trick of conditioning on $\{x_{1}, \dots, x_{n}\}$ in combination with the SRL assumptions (see pages 48, 49 for formal proof).


## Variance of the OLS Estimators

**Goal**: In addition to knowing that the sampling distribution of $\hat{\beta}_{1}$ is centered about $\beta_{1}$ , it is important to know how far we can expect $\hat{\beta}_{1}$ to be away from $\beta_{1}$ ==on average==.

>[!warning] Trick for variance computation
>It turns out that the variance of the OLS estimators can be computed under Assumptions SLR.1 through SLR.4. However, these expressions would be somewhat complicated. Instead, we add **homoskedasticity** assumption.

5. **Homoskedasticity** <mark style="background: #CACFD9A6;">(SRL.5)</mark>: error u has the same variance given any value of the explanatory variable, i.e. :
   $$
\mathrm{Var}(u|x)=\sigma^2
$$

*Homoskedasticity* visualization:
![[Pasted image 20240429231959.png|470x410]]

*Heteroskedasticity* visualization:
![[Pasted image 20240706160606.png|470x410]]

>[!tip] Homoskedasticity properties:
>- Homoskedasticity assumption plays no role in showing that $\hat{\beta}_{0}$ and $\hat{\beta}_{1}$ are unbiased.
> - We add assumption <mark style="background: #CACFD9A6;">SLR.5</mark> because:
> 	-  it simplifies the variance calculations for $\hat{\beta}_{0}$ and $\hat{\beta}_{1}$ 
> 	- it implies that ordinary least squares has certain efficiency properties
> - If we were to assume that $u$ and $x$ are independent, $\mathrm{Var}(u|x)=\sigma^2$ but independence would be a too strong (conservative) assumption
> - it can be proved that the **error variance**  is given by the unconditional variance of $u$:
>$$\sigma^2 = Var(u|x) = \mathbb{E}[u^2|x] - [\mathbb{E}[u|x]]= \mathbb{E}[u^2]=Var(u)$$
> - A larger $\sigma$ means that the distribution of the unobservables affecting $y$ is more spread out 

>[!info] Heteroskedasticity on the opposite
>- When $Var(u|x)$ depends on $x$ $\implies$ the error term exhibits  **heteroskedasticity**
>- Because $Var(u|x) = Var(y|x)$  , heteroskedasticity is present whenever $Var(y|x)$ is a function of $x$.

#### Theorem: Sampling Variances of the OLS Estimators

Under Assumptions <mark style="background: #CACFD9A6;">SLR.1</mark> through<mark style="background: #CACFD9A6;"> SLR.5</mark>,

$$\mathrm{Var}(\hat{\beta}_{1}) = \frac{\sigma^{2}}{\sum_{i=1}^{n} (x_{i}-\bar{x})^{2}} = \frac{\sigma^{2}}{\mathrm{SST}_{x}}$$

$$\\\mathrm{Var}(\hat{\beta}_{0})=\frac{\sigma^{2}n^{-1}\sum_{i=1}^{n}x_{i}^{2}}{\sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)^{2}}
$$

**Interpretation** of the above theorem:
- the larger the error variance, the larger is $\mathrm{Var}(\hat{\beta}_{1})$ $\iff$ more variation in the unobservables affecting $y$ makes it more difficult to precisely estimate $\beta_{1}$
- more variability in the independent variable is preferred $\iff$ more spread out is the sample of independent variables, the easier it is to trace out the relationship between $\mathbb{E}(y|x)$ and $x$.

**Unbiased estimator of the Error Variance**: if we know $n-2$ of the residuals, we can always get the other two residuals by using the restrictions implied by the first order conditions $\implies$ there are only $n-2$ degrees of freedom in the OLS residuals
$$
\hat{\sigma}^2=\frac{1}{(n-2)}\sum_{i=1}^{n}\hat{u}_{i}^{2}=\frac{\mathrm{SSR}}{(n-2)}
$$

#### Theorem: Unbiasedness of Error Variance

In OLS setup, considering the variance estimate $\hat{\sigma}^2$ defined as above, this estimate is unbiased, i.e. :
$$
\mathbb{E}[\hat{\sigma}^2]= \hat{\sigma}^2
$$
If $\hat{\sigma}^2$ is plugged into the variance formulas we get unbiased estimators of $\mathrm{Var}(\hat{\beta}_{0})$ and $\mathrm{Var}(\hat{\beta}_{1})$.


>[!info]
>We can derive the following estimates:
>- the *standard error of the regression*:
> $$\hat{\sigma}=\sqrt{\hat{\sigma}^2}$$
> - *standard deviations* of $\hat{\beta}_{0}$ and $\hat{\beta}_{1}$:
>   $$\mathrm{sd}(\hat{\beta}_{1}) = \sigma/\sqrt{\mathrm{SST}_{x}}$$
> - *standard errors* (estimates of standard deviations) of $\hat{\beta}_{0}$ and $\hat{\beta}_{1}$:
>  $$\mathrm{se}(\hat{\beta}_1) = \hat{\sigma}/\sqrt{\mathrm{SST}_x}= \hat{\sigma}/\left(\sum_{i=1}^n(x_i- \bar{x})^2 \right)^{1/2}$$