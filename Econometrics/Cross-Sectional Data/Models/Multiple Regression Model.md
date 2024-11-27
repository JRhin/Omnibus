#### Idea:
We add more independent variables $x_{i}$ to extend our [[Simple Regression Model]].

#### Why?
Here we list some of the main reasons to include other independent variables:
1. **Multiple regression analysis** is more amenable to *ceteris paribus* analysis since it allows to explicitly control for many factors that affect $y$ (that in the **simple regression** setup would be incorporated in the error term $\implies$ impossible to apply the ceteris paribus fixing those terms);
2. Adding more factors useful for explaining $y$ $\implies$ *explaining more variation* in $y$;
3. Controlling for more variables potentially correlated with other independent variable $\implies$ *extrapolating this correlation from the error term* (which otherwise would be correlated with some $x$, causing the OLS estimators to be biased);
4. Multiple regression analysis can incorporate more general *functional form* relationships, i.e. is way *more flexible*.
#### Setup with 2 variables:

- __Input__ : $y$, $x_{1}$ and $x_{2}$, three variables representing some population
- __Goal__: study how *how $y$ varies with $x_{1}$ and $x_{2}$*
- **Equation**: for the multiple regression model:
$$
y=\beta_0+\beta_1x_1+\beta_2x_2+u
$$
###### Obs.
- $y$ is called _dependent/ response/ explained variable_
- $x$ is called _independent/ explanatory/ predictor/ control variable_ or _regressor_, _covariate_
- $u$ is the _error_ term $\implies$ represents all the (unobserved) factors other than $x$ that affect $y$ 
- $\beta_{1}$ and $\beta_{2}$ are the _slope parameters_ respectively for $x_{1}$ and $x_{2}$
- $\beta_{0}$ is the _intercept parameter_

> [!notice]
>  An example about the ability of **MLR** of generalizing functional relationships.
>  Suppose family consumption (*cons*) is a quadratic function of family income (*inc*):
>  $$ cons=\beta_0+\beta_1inc+\beta_2inc^2+u$$

###### Possible more complex interpretations
There is an important difference with simple regression in the parameters interpretation.
For instance, if we look at the example above in the blue box, the change in consumption with respect to the change in income is approximated by:

$$
\frac{\Delta cons}{\Delta inc}\approx\beta_{1}+2\beta_{2}inc
$$
The marginal effect of income on consumption depends on both $\beta_{1}$ and $\beta_{2}$ (see [[Quadratic form]] notes for more details)!!!

#### General Setup:

- __Input__ : $y$, $x_{1} \dots x_{k}$, are $k+1$ variables representing some population
- __Goal__: study how *how $y$ varies with $x_{1} \dots x_{k}$*
- **Equation**: for the multiple regression model with $k$ variables:
$$
y=\beta_0+\beta_1x_1+\beta_2x_2 + \dots + \beta_{k}x_{k} +u
$$
- **Number of (unknown) parameters** $= k+1$

>[!notice] Extended Conditional Mean Assumption
>As in the simple case a fundamental assumption in MLR is the **zero conditional mean assumption**:
> $$ \mathrm{E}(u|x_{1},x_{2},\ldots,x_{k})=0$$
> as always this requires:
> - the unobserved error term be uncorrelated with the explanatory variables
> - we have correctly accounted for the functional relationships between the explained and explanatory variables (i.e. no relation misspecification).

>[!note] Notational abuse
>In MLR setup we just introduce $k$ independent variable $x_{1},\dots, x_{k}$.  Do not confuse such variables with the observations (samples) for the single independent variable $x$ in the SRL setup (we used the same notation). From now on we will denote by
>- $x_{j}$ $\to$ the $j$-th independent random variable
>- $x_{ij}$ $\to$ the $i$-th observation for the $j$-th independent variable in the random sample setup.

>[!warning] Irreducibility of the error
>No matter how many explanatory variables we include in our model, there will always be factors we cannot include, and these are collectively contained in $u$

>[!warning]
> The power of MLR is that it provides this ceteris paribus interpretation even though the data have not been collected in a ceteris paribus fashion.
> In other words it allows us to do in **nonexperimental** environments what natural scientists are able to do in a controlled laboratory setting: keep other factors fixed!
## Ordinary Least Squares Estimates

**Setup**: 
Given a random sample of data $\{x_{i}, y_{i}: i=1,\dots,n\}$ we can estimate $\beta_{0}, \dots \beta_{k}$ , finding $\hat{\beta}_{0} \dots \hat{\beta}_{k}$.

**Idea**:
The $k+1$ OLS estimates are chosen to minimize the *sum of squared residuals*:
$$
\sum_{i=1}^{n}(y_{\mathrm{i}}-\hat{\beta}_{0}-\hat{\beta}_{1}x_{i1}-...-\hat{\beta}_{k}x_{ik})^{2}
$$

**Results**:
1. There is no direct need to directly solve the **First order conditions** to find the OLS Estimators, but we can get a closed-form for the coefficient OLS Estimates
2. First we define the **auxiliary residual** for the $j$-th variable $\hat{r}_{ij}$ that is the estimated residual from the regression of $x_{j}$ over all the other variables, i.e.:
$$
\begin{align}
\hat{x}_{ij} &= \hat{\beta}_0+\hat{\beta}_1x_{i1}+\dots+\hat{\beta}_{j-1}x_{i(j-1)}+\hat{\beta}_{j+1}x_{i(j+1)}+\dots+\hat{\beta}_kx_{ik}\\ \\
\hat{r}_{ij}&=x_{ij}-\hat{x}_{ij}
\end{align}
$$
3. We can prove that the closed form for the $j$-th coefficient OLS Estimate is:
$$\hat{\beta}_{j}= \frac{\left|\sum_{i=1}^{n}\hat{r}_{ij}y_{i}\right|}{\left|\sum_{i=1}^{n}\hat{r}_{ij}^{2}\right|}$$

4. Thus we obtain the **OLS regression line**:
$$
\hat{y}=\hat{\beta}_0+\hat{\beta}_1x_1+\hat{\beta}_2x_2+...+\hat{\beta}_kx_k
$$
5. Or in terms of changes:
$$
\Delta\hat{y}=\hat{\beta}_{1}\Delta x_{1}+\hat{\beta}_{2}\Delta x_{2}+...+\hat{\beta}_{k}\Delta x_{k}
$$

6. Thus the **prediction** and the **residuals** for the single $i$-th example are respectively:
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

>[!tip] MLR coefficients interpretation
>The coefficient on $x_{1}$ measures the change in $\hat{y}$ due to a one-unit increase in $x_{1}$, holding all other independent variables fixed. Thus, we have controlled for the variables $x_2, ..., x_k$ when estimating the effect of $x_{1}$ on $y$ (ceteris paribus as always), i.e.:
> $$\Delta\hat{y}=\hat{\beta}_1\Delta x_1$$

>[!info] Auxiliary residuals
> The residuals $\hat{r}_{i1}$ (for $k=2$, i.e. if we only have two indep. variables) are the part of $x_{i1}$ that is uncorrelated with $x_{i2}$.
> We can also say that  $\hat{r}_{i1}$ is $x_{i1}$ after the effects of $x_{i2}$ have been **partialled-out**.

>[!note]
>see the [[Ordinary Least Squares]] section for more details on the first-order conditions etc.


#### MLR vs SRL

If we consider:
1.  the **simple regression**: $\tilde{y}=\tilde{\beta}_{0}+\tilde{\beta}_{1}x_{1}$
2.  the **multiple regression**: $\hat{y}=\hat{\beta}_{0}+\hat{\beta}_{1}x_{1}+\hat{\beta}_{2}x_{2}$
	
There is the following relationship between $\tilde{\beta}_{1}$ and $\hat{\beta}_{1}$:
$$
\tilde{\beta}_{1}=\hat{\beta}_{1}+\hat{\beta}_{2}\tilde{\delta}_{1}
$$
where:
- $\tilde{\delta}_{1}$ is the slope coefficient from the simple regression of $x_{i2}$ on $x_{i1}$ for $i=1,\dots,n$
- $\hat{\beta}_{2}\tilde{\delta}_{1}$ is called the **confounding term** since is what differentiates $\tilde{\beta}_{1}$ from $\hat{\beta}_{1}$ 

>[!tip] MLR = SRL $\iff$ look at the **confounding term**
>For the previous example, we have that $\tilde{\beta}_{1}=\hat{\beta}_{1}$ if:
>1. *either* the partial effect of $x_{2}$ on $\hat{y}$  is $0$ $\implies$ $\hat{\beta}_{2}=0$
>2. *or* $x_{1}$ and $x_2$ are uncorrelated in the sample $\implies$ $\tilde{\delta}_{1}=0$

## Goodness-of-fit

We can obtain the same statistics and the same reasoning from the goodness-of-fit section of the [[Simple Regression Model]].

>[!warning]
>Is important to know that:
>- $R^2$ never decreases when another independent variable is added to the regression model, because $\mathrm{SSR}$ never increases.
>- Thus $R^2$ is not a completely reliable measure of the quality of the model and the factor that should determine whether an explanatory variable belongs to a model is whether it has a **nonzero partial effect** on $y$ in the population.

>[!tip] Low $R^2$
>Generally, a low $R^2$ $\implies$ it is hard to predict individual outcomes on $y$ with much accuracy.

## Expected Values of OLS Estimators

**Multiple Regression assumptions** for unbiasedness of OLS:

1. **Linearity in parameters** <mark style="background: #CACFD9A6;">(MLR.1)</mark> 
   $y$ is related to $x_{1},\dots,x_{k}$ and $u$ (all *random variables*) as:
$$
y=\beta_0+\beta_1x_1+\beta_2x_2+...+\beta_kx_k+u
$$
2. **Random Sampling** <mark style="background: #CACFD9A6;">(MLR.2)</mark>
   considering $n$ random samples $\{(x_i,y_i): i = 1, 2, ..., n\}$ drawn from the above population model, we can write:
$$
y_i=\beta_0+\beta_1x_{i1}+\beta_2x_{i2}+...+\beta_kx_{ik}+u_i,\quad i=1,2,...,n
$$ 
3. **No Perfect Collinearity** <mark style="background: #CACFD9A6;">(MLR.3)</mark>
   This assumption holds if in the sample:
   1. none of the independent variables is constant, 
   2. and there are no exact linear relationships among the independent variables i.e., no independent variable is an exact linear combination of the other independent variables (no **Perfect Collinearity**).
      
4. **Zero Conditional Mean** <mark style="background: #CACFD9A6;">(MLR.4)</mark>
    the error $u$ has an expected value of zero given any value of the explanatory variable, i.e. :
$$
\mathbb{E}(u|x_{1},\dots,x_{k})=0.
$$

>[!tip] Perfect Collinearity: Positive example
>The example $cons=\beta_{0}+\beta_{1}inc+\beta_{2}inc^{2}+u$ doesn't violate MLR.3 since $inc$ and $inc^2$ are not linearly related.

>[!tip] Perfect Collinearity: Negative example
>It is interesting to see that $\log(cons)=\beta_{0}+\beta_{1}\mathrm{log}(inc)+\beta_{2}\mathrm{log}(inc^{2})+u$ violates the Perfect Collinearity assumption since $\log(inc^2)=2\cdot\log(inc)$.

>[!danger] When do MLR.3 fails?
>1. when one variable is a constant multiple of another
>2. when one independent variable can be expressed as an exact linear function of two or more of the other independent variables
>3. if the sample size is too small in relation to the number of parameters being estimated i.e., $n<k+1$
>4. if we are very unlucky in sampling our observations (e.g. **adversarial sampling** such as always sampling $x_{2}=2x_{1}$ )

>[!danger] When do MLR.4 fails?
>1. can fail is if the functional relationship between the explained and explanatory variables is **misspecified** in the regression equation
>2. omitting an important factor that is correlated with any of $x_{1},\dots,x_{k}$ $\implies$ some $x_j$ is correlated with $u$ $\implies$ $x_{j}$ is an **endogenous** explanatory variable ([[Endogeneity]] issue).


#### Theorem: Unbiasedness of Sampling Expected Values of OLS Estimators
Under Assumptions <mark style="background: #ADCCFFA6;">MLR.1</mark> through <mark style="background: #ADCCFFA6;">MLR.4</mark> we have:
$$
\mathbb{E}(\hat{\beta}_{j})=\beta_{j} \quad ,j=0,1,\ldots,k
$$

## Variance of the OLS Estimators

**Goal**: In addition to knowing that the sampling distribution of $\hat{\beta}_{j}$ is centered about $\beta_{j}$ , it is important to know how far we can expect $\hat{\beta}_{j}$ to be away from $\beta_{j}$ ==on average==.

**Simplification trick**: add homoskedasticity assumption to make the variance evaluation easier.

5. **Homoskedasticity** <mark style="background: #CACFD9A6;">(MLR.5)</mark>: error u has the same variance given any value of the explanatory variable, i.e. :
$$
\mathrm{Var}(u|x_{1},\dots ,x_{k})=\sigma^2
$$
>[!info] Gauss-Markov assumptions
>[[Gauss-Markov Assumptions]] are the assumptions from <mark style="background: #ADCCFFA6;">MLR.1</mark> to <mark style="background: #ADCCFFA6;">MLR.5</mark>

#### Theorem: Sampling Variances of the OLS Estimators
Under Assumptions <mark style="background: #CACFD9A6;">MLR.1</mark> through<mark style="background: #CACFD9A6;"> MLR.5</mark>,

$$\mathrm{Var}(\hat{\beta}_{j}) = \frac{\sigma^{2}}{\mathrm{SST}_{j}\cdot(1-R_{j}^2)} \quad ,j=1,\dots,k$$
where:
- $\mathrm{SST}_{j}=\sum_{i=1}^{n} (x_{ij}-\bar{x}_{j})^{2}$
- $R_{j}^2$ is R-squared from regressing $x_{j}$ on all the other independent variables

>[!tip] A difference with the SLR model
>For the [[Simple Regression Model]] the variance was similar but we had no $1-R_{j}^2$ term at the denominator!

>[!danger] The importance of the estimator variance
>A larger variance means a less precise estimator, and this translates into larger confidence intervals and less accurate hypotheses tests.

#### Components of OLS Variances

The components are of $\mathrm{Var}(\hat{\beta}_{j})$:

1. The **error variance** $\rightarrow$ $\sigma^2$
	- larger $\sigma^2$ $\implies$ lager $\mathrm{Var}(\hat{\beta}_{j})$
	- more “noise” in the equation $\implies$ more difficult to estimate the partial effect of any of the independent variables on $y$
	- nothing to do with the sample size
	- only one way to reduce $\sigma^2$ is to add more explanatory variables
	
2. The **Total Sample Variation** in $x_{j}$ $\rightarrow$ $\mathrm{SST_{j}}$
	- larger $\mathrm{SST_{j}}$ $\implies$ smaller $\mathrm{Var}(\hat{\beta}_{j})$
	- a way to increase $\mathrm{SST_{j}}$ is to increase $n$ (number of samples)
	
3. The **Linear Relationships among the Independent Variables** $\rightarrow$ $R^2_{j}$
	- high degree of linear relation among variables $\iff$ $R^2_{j} \rightarrow 1$ $\implies$ larger $\mathrm{Var}(\hat{\beta}_{j})$
	- $R^2_{j}$ is the proportion of the total variation in $x_{j}$ that *can be explained by the other independent variables* appearing in the equation
	- Extreme cases for a given (fixed) $\sigma^2$ and $\text{SST}_j$:
		- the smallest $\text{Var}(\hat{\beta}_j)$ $\iff$ $R^2_j = 0$ $\iff$ $x_j$ has zero sample correlation with every other independent variable
		- the highest $\mathrm{Var}(\hat{\beta}_{j})$ $\iff$ $R^2_j \rightarrow 1$ $\iff$ High (but not perfect) correlation between two or more independent variables i.e. **[[Multicollinearity]]**

![[Pasted image 20240706194140.png|470x410]]

>[!tip] How to reduce Multicollinearity
>1. Collecting more data
>2. Changing the scope of analysis (e.g. changing the granularity of the event we are studying or aggregating/differencing by categories)
>3. Computing statistics such us the [[Variance Inflation Factor]] (VIF) to determine the severity of multicollinearity and dropping the variables that exceed a certain threshold

#### Estimating $\sigma^2$ to estimate OLS Variance

**Goal**:
We need an unbiased estimator of $\sigma^2$ to obtain unbiased estimator of $\mathrm{Var}(\hat{\beta}_{j}) = \frac{\sigma^{2}}{\mathrm{SST}_{j}\cdot(1-R_{j}^2)}$

**Solution**:
As for the Simple Linear Regression model, we know that $\sigma^2=\frac{1}{n}\sum_{i=1}^n\hat{u}_{i}^2$ would be a biased estimator $\implies$ we need to account for the degrees of freedom generalizing the estimator that we obtained in the SLR setup for our MLR setup with $k$ independent variables:
$$
\hat{\sigma}^{2}= \frac{\sum_{i=1}^{n}\hat{u}_{i}^{2}}{n-k-1}=\frac{\mathrm{SSR}}{n-k-1}
$$

>[!tip] Degrees of freedom
>Notice that:
>	$$df=n-(k+1)=\text{(number of observations) - (number of estimated parameters)}$$

#### Theorem: Unbiasedness of the OLS Error Variance
Under Assumptions <mark style="background: #CACFD9A6;">MLR.1</mark> through<mark style="background: #CACFD9A6;"> MLR.5</mark>, given the estimate $\hat{\sigma}^2$ as above, we get:
$$
\mathbb{E}(\hat{\sigma}^2)=\sigma^2
$$
The **standard error of the regression** (SER) is then defined as $\hat{\sigma}$

>[!warning] SER when including variables
>Notice that $\hat{\sigma}$ can either decrease or increase when another independent variable is added to a regression. 
>This is because when another explanatory variable is added:
>- although **SSR** must fall
>- the **degrees of freedom** also falls by one

#### Estimating the OLS Standard Error
Once we obtained the SER we can derive an unbiased estimate for the coefficient standard error.

1. Given the OLS standard deviation for the $j$-th coefficient $\hat{\beta}_{j}$:
$$
\mathrm{sd}(\hat{\beta}_{j})=\sigma/[\mathrm{SST}_{j}(1-R_{j}^{2})]^{1/2}
$$
2. We can derive an estimate of $\mathrm{sd}(\hat{\beta}_{j})$ by introducing the **OLS Standard Error**:
	- in the *homoscedastic* setup: $$\mathrm{se}(\hat{\beta}_{j})=\frac{\hat{\sigma}}{\mathrm{SST}_{j}\cdot(1-R_{j}^{2})^{1/2}}$$
	- in the *heteroscedastic* setup: $$\mathrm{se}(\hat{\beta}_j)=\frac{\hat{\sigma}}{\sqrt{n}\cdot\mathrm{sd}(x_j) \sqrt{1 - R_j^2}}$$
		where $\mathrm{sd}(x_{j})$ is the **sample standard deviation**:
$$
\mathrm{sd}(x_{j})=\sqrt{n^{-1}\sum_{i=1}^{n}(x_{ij}-\overline{x}_{j})^{2}}
$$
>[!danger] Keep in mind the [[Bias-Variance Trade-off]]
>While the presence of **heteroskedasticity** does not cause bias in the $\hat{\beta}_j$, it does lead to bias in the usual formula for $\text{Var}(\hat{\beta}_j)$, which then invalidates the standard errors.

## Efficiency of OLS

According to the Gauss-Markov Theorem, we know that the OLS Estimators are **[[BLUE Estimator]]s**
(best linear unbiased estimators), when under Assumptions <mark style="background: #CACFD9A6;">MLR.1</mark> through<mark style="background: #CACFD9A6;"> MLR.5</mark>.

## Inference after OLS

**Goal**:
Perform statistical inference using the full sampling distribution of the OLS Estimates $\hat{\beta}_{j}$.

**Problem**:
So far we were able to only derive the first and second moments of $\hat{\beta}_{j}$.

**Solution**:
We introduce a new assumption to the Gauss-Markov Assumptions, leading to a new set of assumptions called [[Classical Linear Model Assumptions]] (CRL Assumptions <mark style="background: #ADCCFFA6;">MLR.1</mark> - <mark style="background: #ADCCFFA6;">MLR.6</mark>).

6. **Normality** <mark style="background: #ADCCFFA6;">(MLR.6)</mark>: error $u$ is *independent of the explanatory variables* $x_1, x_2, \ldots, x_k$ and is *normally distributed* with zero mean and variance $\sigma^2$, i.e.: 
$$u \sim \text{Normal}(0, \sigma^2)$$
**CRL** assumptions (<mark style="background: #ADCCFFA6;">MLR.1</mark> - <mark style="background: #ADCCFFA6;">MLR.6</mark>) can be summarized in:
$$ y|\mathbf{x}\sim\mathrm{Normal}(\beta_0+\beta_1x_1+\beta_2x_2+...+\beta_kx_k,\sigma^2)$$
![[Pasted image 20240707192009.png]]
#### Minimum Variance Unbiased Estimators
When we add <mark style="background: #ADCCFFA6;">MLR.6</mark> to the Gauss-Markov Assumptions, we improve the **efficiency** of the **[[BLUE Estimator]]s** estimators $\hat{\beta}_{1},\dots,\hat{\beta}_{k}$ making them not only the best (min. variance) estimator among the all unbiased linear estimators, but the **minimum variance estimators** among **all the possible unbiased estimators** (*not strictly the linear ones*).

#### Theorem: Normal Sampling Distributions of the OLS Estimators
Under the [[Classical Linear Model Assumptions]] <mark style="background: #ADCCFFA6;">MLR.1</mark> through <mark style="background: #ADCCFFA6;">MLR.6</mark>, conditional on the sample values of the independent variables, we have that Normality of the error term translates into *normal sampling distributions of the OLS estimators*:
$$
\hat{\beta}_j\sim\mathrm{Normal}[\beta_j,\mathrm{Var}(\hat{\beta}_j)]
$$
**Proof**:
1. Express $\hat{\beta}_j$ as: $\hat{\beta}_j = \beta_j + \sum_{i=1}^n w_{ij} u_i$
	-  $w_{ij} = \frac{\hat{r}_{ij}}{\text{SSR}_j}$
	- $\hat{r}_{ij}$: residual from regressing $x_j$ on other independent variables
	- $\text{SSR}_j$: sum of squared residuals from this regression
2. Define weights $w_{ij}$: they depend only on the independent variables, hence are nonrandom
3. Nature of $\hat{\beta}_j$: Linear combination of errors $u_i$
4. Assumptions:
	1. MLR.6: Errors $u_i$ are i.i.d. $\text{Normal}(0, \sigma^2)$
	2. MLR.2: Random sampling
5. Statistical Property: Linear combination of independent normal variables is normally distributed
6. Conclusion: $\hat{\beta}_j$ is normally distributed

**Implications**:
1. Standardized sampling distribution
$$
\frac{\hat{\beta}_j-\beta_j}{\mathrm{sd}(\hat{\beta}_j)}\sim\mathrm{Normal}(0,1)
$$
2. Standardized distribution with standard error estimate (r.V.)
$$
\frac{\hat{\beta}_{j}-\beta_{j}}{\mathrm{se}(\hat{\beta}_{j})}\sim t_{n-k-1}=t_{df}
$$

3. We can use the [[T-test]] for testing the **statistical significance** of **individual** independent variables
4. We can find confidence intervals for the OLS coefficients (using the corresponding standard errors)
5. We can use the [[F-test]] or the [[Lagrange Multiplier Test]] for testing **joint statistical significance** of **multiple** independent variables

## Consistency of OLS

**Definition**:

**Interpretation**:
- Let $\hat{\beta}_j$ be the OLS estimator of $\beta_j$ for some $j$. 
- For each $n$, $\hat{\beta}_j$ has a probability distribution representing its possible values in different random samples of size $n$.
- Assumptions <mark style="background: #ADCCFFA6;">MLR.1</mark> through <mark style="background: #ADCCFFA6;">MLR.4</mark> $\implies$ $\hat{\beta}_j$ is unbiased $\implies$ this distribution has mean value $\beta_j$. 
- If this estimator is consistent 
	- $\implies$ the distribution of $\hat{\beta}_j$ becomes more and more tightly distributed around $\beta_j$ as the sample size grows
	- $\implies$ as $n$ tends to infinity, the distribution of $\hat{\beta}_j$ collapses to the single point $\beta_j$
	- $\implies$ we can make our estimator arbitrarily close to $\beta_j$ if we can collect an infinite quantity of data

![[Pasted image 20240716175340.png]]

#### Theorem: Consistency of OLS
Under assumptions <mark style="background: #ADCCFFA6;">MLR.1</mark> - <mark style="background: #ADCCFFA6;">MLR.4</mark>, the OLS estimator $\hat{\beta}_j$ is **consistent** for $\beta_j$, for all $j = 0, 1, \ldots, k$.

>[!tip] MLR.4' vs MLR.4
>Moreover we can relax the MLR.4 assumption for consistency since the probability limit of the coefficient of a variable in the [[Simple Regression Model]] setup is $$\operatorname{plim}\hat{\beta}_1=\beta_1+\operatorname{Cov}(x_1,u)/\operatorname{Var}(x_1),$$
>and actually exists if:
>- $Var(x_{1})<\infty$
>- $Var(u) < \infty$
>$\implies$ OLS is consistent in the simple regression case if we **assume only zero correlation**
>
>MLR.4' :  $\mathbb{E}(u) = 0$ and $Cov(x_{j},u) = 0$, for $j = 1, 2, ..., k.$

#### Derive the inconsistency of OLS

>[!tip] Parallelism bias-consistency 
>- Failure of $E(u \mid x_1, \ldots, x_k) = 0$ (MRL.4) $\implies$ bias in the OLS estimators,
>- Correlation between $u$ and any of $x_1, x_2, \ldots, x_k$ (MRL.4') $\implies$ inconsistent OLS estimators
>
>Thus if the error is correlated with any of the independent variables $\implies$ OLS is **biased** and **inconsistent** $\implies$ any bias persists as the sample size grows.

- In the simple regression case the inconsistency in $\hat{\beta}_1$ (sometimes loosely called the asymptotic bias) is
$$
\text{plim } \hat{\beta}_1 - \beta_1 = \frac{\text{Cov}(x_1, u)}{\text{Var}(x_1)}. \tag{5.4}
$$
- Because $\text{Var}(x_1) > 0$, the inconsistency in $\hat{\beta}_1$:
	- is positive $\iff$ $x_1$ and $u$ are positively correlated
	- is negative $\iff$ $x_1$ and $u$ are negatively correlated
	- can be negligible $\iff$ the covariance between $x_1$ and $u$ is small relative to the variance in $x_1$
- Problem: we cannot estimate how big $Cov(x,u)$ is because $u$ is unobserved
- Solution:
	1. Suppose the true model is $$y = \beta_0 + \beta_1 x_1 + \beta_2 x_2 + v,$$
	2. It satisfies the first four Gauss-Markov assumptions $\implies$ $v$ has a zero mean and is uncorrelated with $x_1$ and $x_2$. 
	3. If $\hat{\beta}_0$, $\hat{\beta}_1$, and $\hat{\beta}_2$ denote the OLS estimators from the regression of $y$ on $x_1$ and $x_2$, then these estimators are consistent. 
	4. If we omit $x_2$ from the regression and do the simple regression of $y$ on $x_1$, then $u = \beta_2 x_2 + v$. 
	5. Let $\tilde{\beta}_1$ denote the simple regression slope estimator. Then
$$
\text{plim } \tilde{\beta}_1 = \beta_1 + \beta_2 \delta_1, \tag{5.5}
$$
		where
$$
\delta_1 = \frac{\text{Cov}(x_1, x_2)}{\text{Var}(x_1)}. \tag{5.6}
$$
	6. Cases:
		1. If $x_1$ and $x_2$ are uncorrelated$\implies$ $\delta_1 = 0$ $\implies$ $\tilde{\beta}_1$ is a consistent estimator of $\beta_1$ (although not necessarily unbiased).
		2. If $x_2$ has a positive partial effect on $y$, so that $\beta_2 > 0$, and $x_1$ and $x_2$ are positively correlated, so that $\delta_1 > 0$ $\implies$ the inconsistency in $\tilde{\beta}_1$ is positive.
		3. And so on...
		4. If the covariance between $x_1$ and $x_2$ is small relative to the variance of $x_1$ $\implies$ inconsistency can be small.

>[!info] Inconsistency vs bias
>For practical purposes, we can view the inconsistency as being the same as the bias. The difference is that
>- the inconsistency is expressed in terms of the population variance of $x_1$ and the population covariance between $x_1$ and $x_2$, 
>- while the bias is based on their sample counterparts (because we condition on the values of $x_1$ and $x_2$ in the sample).

>[!danger] Inconsistency with more data
>An important point about inconsistency in OLS estimators is that the problem does not go away by adding more observations to the sample. If anything, the problem gets worse with more data!

>[!note]
>See the notes on the [[Bias-Variance Trade-off]] to get more info on the bias... Notice that the procedure for obtaining an estimate of the inconsistency term is practically the same we pursue for obtaining the bias term (with for the latter we are in the "sample setup")

## Asymptotic Normality of OLS

**Point**:
1. We know that [[Classical Linear Model Assumptions]] $\implies$ normality of the OLS sampling distributions
2. Normality under the Gauss-Markov assumptions:
	- plays no role in the unbiasedness of OLS, 
	- nor does it affect the conclusion that OLS is the best linear unbiased estimator
	- but exact inference based on t and F statistics requires <mark style="background: #ADCCFFA6;">MLR.6</mark>.
3. Even though the $y_{i}$ are not from a normal distribution, we can use the central limit theorem to conclude that the OLS estimators satisfy **asymptotic normality**

#### Theorem: Asymptotic Normality of OLS
Under the Gauss-Markov Assumptions <mark style="background: #ADCCFFA6;">MLR.1</mark> through <mark style="background: #ADCCFFA6;">MLR.5</mark>, we have that:
1. $\hat{\beta}_j$ is asymptotically normally distributed, since:
	- the normal distribution $$ \sqrt{n}(\hat{\beta}_j - \beta_j) \xrightarrow{a} \text{Normal}(0, \sigma^2 / a_j^2),$$
	- $\sigma^2 / a_j^2 > 0$ $\rightarrow$ the asymptotic variance of $\sqrt{n}(\hat{\beta}_j - \beta_j)$. 
	- for the slope coefficients $$a_j^2 = \text{plim} \left( \frac{1}{n} \sum_{i=1}^n \hat{r}_{ij}^2 \right),$$
	-  $\hat{r}_{ij}$ $\rightarrow$ residuals from regressing $x_j$ on the other independent variables. 

2. $\hat{\sigma}^2$ is a consistent estimator of $\sigma^2 = \text{Var}(u)$.
3. For each $j$, $$\begin{cases}
\frac{\hat{\beta}_j - \beta_j}{\text{sd}(\hat{\beta}_j)} \xrightarrow{a} \text{Normal}(0, 1) \\ \\
\frac{\hat{\beta}_j - \beta_j}{\text{se}(\hat{\beta}_j)} \xrightarrow{a} \text{Normal}(0, 1)
\end{cases}$$

where $\text{se}(\hat{\beta}_j)$ is the usual OLS standard error

**Interpretation**:
Regardless of the population distribution of u, the OLS estimators, when properly standardized, have approximate standard normal distributions (also when we use the standard error in place of standard deviation for standardization!).

>[!warning] 
>1. If the sample size is not very large, then the t distribution can be a poor approximation to the distribution of the t statistics when $u$ is not normally distributed
>2. The quality of the approximation depends not just on $n$, but on the $df= n - k - 1$ $\implies$ with **more independent variables** in the model, a **larger sample size** is usually needed to use the t approximation.
>3. The above theorem does require the homoskedasticity assumption $\implies$ otherwise usual t statistics and confidence intervals are invalid no matter how large the sample size is
>4. The asymptotic standard error is: $$\begin{cases}
\mathrm{se}(\hat{\beta}_j)\approx c_j/\sqrt{n}\\ \\
c_j=\frac\sigma{\sigma_j\sqrt{1-\rho_j^2}}
\end{cases}$$ 

