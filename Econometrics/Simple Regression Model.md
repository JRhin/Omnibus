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
>  The above statement relates to the ceteris-paribus assumption (strong assumption). 
>  We need other assumptions in order to:
>- use the simple regression model
> - get reliable estimators for $\beta_{1}$ and $\beta_{0}$

## Zero conditional mean assumption

**Zero mean assumption**
If $\beta_{0}$ is defined in the simple regression equation, by simply redefine the intercept, we can always assume that:
$$
\mathbb{E}(u) = 0
$$
__Mean independence assumption__
Assuming $u$ and $x$ to be uncorrelated would not be enough since correlation only measures linear independence. We can instead assume that the average value of $u$ doesn't depend on the value of $x$ i.e.:
$$
\mathbb{E}(u|x)=\mathbb{E}(u)
$$

![[Pasted image 20240429190802.png|450x390]]

__Zero conditional mean assumption__ (Zero mean + Mean Indep.)
From the 2 above assumptions we get:
$$
\mathbb{E}(u|x)=\mathbb{E}(u)=0
$$

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

**Setup**: Given a random sample of data $\{x_{i}, y_{i}: i=1,\dots,n\}$ we can estimate $\beta_{0}$ and $\beta_{1}$ finding $\hat{\beta}_{0}$ and $\hat{\beta}_{1}$.

**Procedure**:
1. Use the above assumptions to get:

$$
\begin{cases}
\mathbb{E}[u] = \mathbb{E}[y- \beta_{0} + \beta_{1}] = 0 \\ \\
\mathbb{E}[xu] = \mathbb{E}[x(y- \beta_{0} + \beta_{1})] = 0
\end{cases}
$$
2. Now consider the equations in the "random sample" setup getting the <mark style="background: #D2B3FFA6;">First order conditions</mark> for the OLS estimates:
$$
\begin{cases}
a) \space\space\space n^{-1} \sum_{i=0}^n (y_{i} + \hat{\beta}_{0} + \hat{\beta}_{1}x) = 0\\ \\
b) \space\space\space n^{-1} \sum_{i=0}^{n} x_{i} (y_{i} + \hat{\beta}_{0} + \hat{\beta}_{1}x) = 0
\end{cases} 
$$
3. We can get the *OLS estimate of the intercept* $\hat{\beta}_{0}$ and the *OLS estimate of the slope* $\hat{\beta}_{1}$:
$$
a) \space\space\space \implies \bar{y} = \hat{\beta}_{0} \hat{\beta}_{1}\bar{x} \implies \hat{\beta}_{0} = \bar{y} - \hat{\beta}_{1}\hat{x}
$$
$$
b) \space\space\space \implies \sum_{i=1}^nx_i[y_i-(\bar{y}-\hat{\beta}_1\bar{x})-\hat{\beta}_1x_i]=0 \implies \sum_{i=1}^nx_i(y_i-\bar{y})=\hat{\beta}_1\sum_{i=1}^nx_i(x_i-\bar{x}) 
$$

Can be proved that:
$$
\begin{cases}
\sum_{i=1}^nx_i(x_i-\bar{x})=\sum_{i=1}^n(x_i-\bar{x})^2 \\ \\
\sum_{i=1}^nx_i(y_i-\bar{y})=\sum_{i=1}^n(x_i-\bar{x})(y_i-\bar{y}).
\end{cases}

$$
Provided that $\sum_{i=1}^n(x_i-\bar{x})^2>0$ (which is always true if the sample values $x_{i}$ are <mark style="background: #FFB8EBA6;">not all equal</mark>) we get:
$$
\hat{\beta}_1=\frac{\sum_{i=1}^n\left(x_i-\bar{x}\right)\left(y_i-\bar{y}\right)}{\sum_{i=1}^n\left(x_i-\bar{x}\right)^2}.
$$

**Summing-up**:
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

> [!info]
> Why are $\hat{\beta}_{o}$ and $\hat{\beta}_{1}$ called *OLS solutions*?
> - We define the **fitted value** for observation $i$ :
>   $\hat{y}_{i}= \hat{\beta}_{0}+ \hat{\beta}_{1}x_{i}$
> - the **residual** for observation $i$  
>  $\hat{u}_{i}=y_{i}-\hat{y}_{i}=y_{i}-\hat{\beta}_{0}-\hat{\beta}_{1}x_{i}$
>  where:
> 	 - $\hat{u}_{i}>0 \implies$ the regression line *overpredicts* $y_{i}$ 
> 	 - $\hat{u}_{i}<0 \implies$ the regression line *underpredicts* $y_{i}$ 
> 
> It can be proved that the OLS solutions defined as above minimize the **sum of squared residuals**, i.e.:
> $$(\hat{\beta}_{0}, \hat{\beta}_{1}) = \text{argmin} \left( \sum_{i=1}^n \hat{u}^2 \right) = \text{argmin} \sum^{n}(y_{i}-\hat{\beta}_{0}-\hat{\beta}_{1}x_{i})^{2}$$

![[Pasted image 20240429205611.png|450x390]]

> [!info]
> Why to not minimize some other function instead of the sum of residuals?
> 1. minimizing some other function might lead to not closed (e.g. when using the sum of absolute values) forms and heavy optimization routines
> 2. with OLS we'll be able to derive *unbiasedness*, *consistency* and some other important statistical properties
> 3. OLS is suited for estimating the parameters appearing in the conditional mean function $\mathbb{E}[y|x]$


We define:

- **OLS regression line**:
$$
\hat{y}=\hat{\beta}_0+\hat{\beta}_1x,
$$
- **Total sum of squares**:
  $$
\mathrm{SST}\equiv\sum_{i=1}^{n}(y_{i}-\bar{y})^{2}
$$
- **Explained sum of squares**:
  $$
\\\mathrm{SSE}\equiv\sum_{i=1}^{n}(\hat{y}_{i}-\bar{y})^{2}
$$
- **Residual sum of squares**:
  $$
\\\mathrm{SSR}\equiv\sum_{i=1}^{n}\hat{u}_{i}^{2}
$$


**Algebraic properties** of OLS statistics:

1. The OLS estimates are chosen to make residuals add up to zero:
   $$
\sum_{i=1}^n\hat{u}_i=0.
$$
2. The sample covariance between the regressors and the OLS residuals is zero:
   $$
\sum_{i=1}^nx_i\hat{u}_i=0
$$
3. The point $(\bar{x},\bar{y})$ is always on the OLS regression line.



## Goodness-of-fit

**Goal**: measuring how well the explanatory/ independent variable $x$, explains the dependent variable, $y$.

**Base assumptions**: 
1. an intercept is estimated along with the slope
2. $SST \neq 0$ , which is true unless all $y_i$ are of the same value

We introduce the **R-squared** (or **coeff. of determination**) statistics, which represents the ratio of explained variation compared to the total variation:
$$
R^2\equiv\mathrm{SSE/SST}=1-\mathrm{SSR/SST}
$$
> [!tips]
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



## Unbiasedness of OLS

**Simple Regression assumptions** for unbiasedness of OLS:

1. **Linearity in parameters** <mark style="background: #CACFD9A6;">(SRL.1)</mark> : $y$ is related to $x$ and $u$ as:
   $$
y=\beta_{0}+\beta_{1}x+u
$$
2. **Random Sampling** <mark style="background: #CACFD9A6;">(SRL.2)</mark>: random sample of size $n$, $\{(x_i,y_i): i = 1, 2, ..., n\}$, following the above population model
3. **Sample Variation in the Explanatory Variable** <mark style="background: #CACFD9A6;">(SRL.3)</mark>: the sample outcomes on x, namely, $\{(x_i,y_i): i = 1, 2, ..., n\}$, are not all the same value.
4. **Zero Conditional Mean** <mark style="background: #CACFD9A6;">(SRL.4)</mark>: the error $u$ has an expected value of zero given any value of the explanatory variable, i.e. :
   $$
\mathbb{E}(u|x)=0.
$$

#### Theorem: Unbiasedness of OLS

Using Assumptions <mark style="background: #CACFD9A6;">SLR.1</mark> through <mark style="background: #CACFD9A6;">SLR.4</mark>, for any values of $\beta_{0}$ and $\beta_{1}$ we have:
$$
\mathbb{E}(\hat{\beta}_{0})=\beta_{0}\space \space \operatorname {and} \space \space\mathbb{E}(\hat{\beta}_{1})=\beta_{1}
$$

>[!info]
>Comments on SRL assumptions:
>- <mark style="background: #CACFD9A6;">SRL.2</mark> can fail in a cross section when samples are not representative of the underlying population;
>- if the sample standard deviation of $x_{}i$ is zero, then Assumption <mark style="background: #CACFD9A6;">SLR.3</mark> fails; otherwise, it holds;
>- <mark style="background: #CACFD9A6;">SLR.3</mark> almost always holds in interesting regression applications;
>- if <mark style="background: #CACFD9A6;">SLR.4</mark> fails, the OLS estimators generally will be biased $\implies$ possibility that $x$ is correlated with $u$ is almost always a concern in simple regression analysis with nonexperimental data.



## Variance of the OLS Estimators

**Goal**: In addition to knowing that the sampling distribution of $\hat{\beta}_{1}$ is centered about $\beta_{1}$ , it is important to know how far we can expect $\hat{\beta}_{1}$ to be away from $\beta_{1}$ ==on average==.

>[!warning]
>It turns out that the variance of the OLS estimators can be computed under Assumptions SLR.1 through SLR.4. However, these expressions would be somewhat complicated. Instead, we add **homoskedasticity** assumption.

5. **Homoskedasticity** <mark style="background: #CACFD9A6;">(SRL.5)</mark>: error u has the same variance given any value of the explanatory variable, i.e. :
   $$
\mathrm{Var}(u|x)=\sigma^2
$$

![[Pasted image 20240429231959.png|470x410]]


>[!tips]
>- Homoskedasticity assumption plays no role in showing that $\hat{\beta}_{0}$ and $\hat{\beta}_{1}$ are unbiased.
> We add assumption <mark style="background: #CACFD9A6;">SLR.5</mark> because:
> 	-  it simplifies the variance calculations for $\hat{\beta}_{0}$ and $\hat{\beta}_{1}$ 
> 	- it implies that ordinary least squares has certain efficiency properties
> - If we were to assume that $u$ and $x$ are independent, $\mathrm{Var}(u|x)=\sigma^2$ But independence is too strong
> - it can be proved that the **error variance**  is given by the unconditional variance of $u$:
>   $$
\sigma^2 = Var(u|x) = \mathbb{E}[u^2|x] - [\mathbb{E}[u|x]]= \mathbb{E}[u^2]=Var(u)
$$

>[!info]
>A larger $\sigma$ means that the distribution of the unobservables affecting $y$ is more spread out.

>[!info]
>When $Var(u|x)$ depends on $x$ $\implies$ the error term exhibits  **heteroskedasticity** Because $Var(u|x) = Var(y|x)$  , heteroskedasticity is present whenever $Var(y|x)$ is a function of $x$.


#### Theorem: Sampling Variances of the OLS Estimators

Under Assumptions <mark style="background: #CACFD9A6;">SLR.1</mark> through<mark style="background: #CACFD9A6;"> SLR.5</mark>,

$$\mathrm{Var}(\hat{\beta}_{1}) = \frac{\sigma^{2}}{\sum_{i=1}^{n} (x_{i}-\bar{x})^{2}} = \sigma^{2}/\mathrm{SST}_{x}$$

$$\\\mathrm{Var}(\hat{\beta}_{0})=\frac{\sigma^{2}n^{-1}\sum_{i=1}^{n}x_{i}^{2}}{\sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)^{2}}
$$

**Interpretation** of the above theorem:
- the larger the error variance, the larger is $\mathrm{Var}(\hat{\beta}_{1})$ $\iff$ more variation in the unobservables affecting $y$ makes it more difficult to precisely estimate $\beta_{1}$
- more variability in the independent variable is preferred $\iff$ more spread out is the sample of independent variables, the easier it is to trace out the relationship between $\mathbb{E}(y|x)$ and $x$.

**Unbiased estimator of the Error Variance**: if we know n 2 2 of the residuals, we can always get the other two residuals by using the restrictions implied by the first order conditions $\implies$ there are only $n-2$ degrees of freedom in the OLS residuals
$$
\hat{\sigma}^2=\frac{1}{(n-2)}\sum_{i=1}^{n}\hat{u}_{i}^{2}=\mathrm{SSR}/(n-2)
$$

#### Theorem: Unbiasedness of Error Variance

In OLS setup, considering the variance estimate $\hat{\sigma}^1$ defined as above, this estimate is unbiased, i.e. :
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
> - *standard errors* of $\hat{\beta}_{0}$ and $\hat{\beta}_{1}$:
>  $$\mathrm{se}(\hat{\beta}_1) = \hat{\sigma}/\sqrt{\mathrm{SST}_x}= \hat{\sigma}/\left(\sum_{i=1}^n(x_i- \bar{x})^2 \right)^{1/2}$$



