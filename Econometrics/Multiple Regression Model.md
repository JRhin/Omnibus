#### Idea:
We add more independent variables $x_{i}$ inside or regression model.

#### Why?
Here we list some of the main reasons to include other indep. variables:
1. **Multiple regression analysis** is more amenable to *ceteris paribus* analysis since it allow to explicitly control for many factors that affect $y$ (that in the **simple regression** setup would be incorporated in the error term $\implies$ impossible to apply the ceteris paribus fixing those terms);
2. Adding more factors useful for explaining y $\implies$ more of the ==variation== in y can be explained;
3. Multiple regression analysis can incorporate more general *functional form* relationships, i.e. is way more ==flexible==.

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
>  $$ cons=\beta_0+\beta_1inc+\beta_2inc^2+u
$$
###### Interpretation
There is an important difference with simple regression in the parameters interpretation.
For instance, if we look at the example above in the blue box, Instead, the change in consumption with respect to the change in income is approximated by:
$$
\frac{\Delta cons}{\Delta inc}\approx\beta_{1}+2\beta_{2}inc
$$
The marginal effect of income on consumption depends on both $\beta_{1}$ and $\beta_{2}$!!!

#### General Setup:

- __Input__ : $y$, $x_{1} \dots x_{k}$, three variables representing some population
- __Goal__: study how *how $y$ varies with $x_{1} \dots x_{k}$*
- **Equation**: for the multiple regression model with $k$ variables:
  $$
y=\beta_0+\beta_1x_1+\beta_2x_2 + \dots + \beta_{k}x_{k} +u
$$
- **Number of (unknown) parameters** $= k+1$

>[!notice]
>As in the simple case a fundamental assumption in MLR is the **zero conditional mean assumption**:
> $$ \mathrm{E}(u|x_{1},x_{2},\ldots,x_{k})=0
$$



## Ordinary Least Squares (OLS) Estimates

**Setup**: 
Given a random sample of data $\{x_{i}, y_{i}: i=1,\dots,n\}$ we can estimate $\beta_{0}, \dots \beta_{k}$ , finding $\hat{\beta}_{0} \dots \hat{\beta}_{k}$.

**Idea**:
The $k+1$ OLS estimates are chosen to minimize the *sum of squared residuals*:
$$
\sum_{i=1}^{n}(y_{\mathrm{i}}-\hat{\beta}_{0}-\hat{\beta}_{1}x_{i1}-...-\hat{\beta}_{k}x_{ik})^{2}
$$

**Procedure**:
This minimization problem lead to the resolution of the OLS **first order conditions**, i.e. $k+1$ equations in $k+1$ variables $\hat{\beta}_{0} \dots \hat{\beta}_{k}$:
$$
\begin{cases}
\sum_{i=1}^{n}(y_{i}-\hat{\beta}_{0}-\hat{\beta}_{1}x_{i1}-...-\hat{\beta}_{k}x_{ik})=0\\\sum_{i=1}^{n}x_{i1}(y_{i}-\hat{\beta}_{0}-\hat{\beta}_{1}x_{i1}-...-\hat{\beta}_{k}x_{ik})=0\\\sum_{i=1}^{n}x_{i2}(y_{i}-\hat{\beta}_{0}-\hat{\beta}_{1}x_{i1}-...-\hat{\beta}_{k}x_{ik})=0\\\sum_{i=1}^{n}x_{ik}(y_{i}-\hat{\beta}_{0}-\hat{\beta}_{1}x_{i1}-...-\hat{\beta}_{k}x_{ik})=0
\end{cases}
$$
The OLS first order conditions can be solved using the assumptions:
$$
\begin{cases}
\mathbb{E}[u]=0 \\ \\
\mathbb{E}[x_{j}u]=0 \space \space ,\space j=1,2,\dots,k
\end{cases}
$$
Thus we obtain the OLS regression:
$$
\hat{y}=\hat{\beta}_0+\hat{\beta}_1x_1+\hat{\beta}_2x_2+...+\hat{\beta}_kx_k
$$
or in terms of changes:
$$
\Delta\hat{y}=\hat{\beta}_{1}\Delta x_{1}+\hat{\beta}_{2}\Delta x_{2}+...+\hat{\beta}_{k}\Delta x_{k}
$$

thus the **prediction** and the **residuals** for the single $i$-th example are respectively:
$$
\hat{y}_{i}=\hat{\beta}_{0}+\hat{\beta}_{1}x_{i1}+\hat{\beta}_{2}x_{i2}+...+\hat{\beta}_{k}x_{ik}
$$
$$
\hat{u}_i=y_i-\hat{y}_i
$$

>[!notice]
>The coefficient on x1 measures the change in yˆ due to a one-unit increase in x1, holding all other independent variables fixed. That is:
> $$
\Delta\hat{y}=\hat{\beta}_1\Delta x_1
$$

>[!warning]
> The power of MRL is that it provides this ceteris paribus interpretation even though the data have not been collected in a ceteris paribus fashion.
> In other words it allows us to do in **nonexperimental** environments what natural scientists are able to do in a controlled laboratory setting: keep other factors fixed!

###### Properties of $\hat{y}_{i}$ and $\hat{u}_{1}$:

1. $\bar{y}=\bar{\hat{y}}$
2. $Cov(\hat{y}_{i},\hat{u}_{i})=0$
3. $\bar{y}=\hat{\beta}_0+\hat{\beta}_1\bar{x}_1+\hat{\beta}_2\bar{x}_2+...+\hat{\beta}_k\bar{x}_k$

###### "Partialling-out " interpretation of MLR
Consider the case with $k=2$ where the MLR is given by $\hat{y}=\hat{\beta}_{0}+ \hat{\beta}_{1} + \hat{\beta}_{2}$. We can express the OLS estimate of $\beta_{1}$ in a closed form:
$$
\hat{\beta}_{1}= \frac{\left|\sum_{i=1}^{n}\hat{r}_{i1}y_{i}\right|}{\left|\sum_{i=1}^{n}\hat{r}_{i1}^{2}\right|}
$$
where $\hat{r}_{i1}$ are the OLS residuals from a simple regression of $x_{1}$ on $x_{2}$ (we can then do a simple regression of $y$ on $\hat{r}_{1}$ to obtain $\hat{\beta}_{1}$). 

>[!tips]
> The residuals $\hat{r}_{i1}$ are the part of $x_{i1}$ that is uncorrelated with $x_{i2}$ have been **partialled out**.
> 

In the general model with k explanatory variables, $\beta_{1}$ can still be written as above but the residuals $\hat{r}_{i1}$ come from the regression of $x_1$ on $x_2, ..., x_k$.

###### Some more info on OLS estimates...

If we consider:
	a) the simple regression: $\tilde{y}=\tilde{\beta}_{0}+\tilde{\beta}_{1}x_{1}$
	b)  the multiple regression: $\hat{y}=\hat{\beta}_{0}+\hat{\beta}_{1}x_{1}+\hat{\beta}_{2}x_{2}$
	
there is the following relationship between $\tilde{\beta}_{1}$ and $\hat{\beta}_{1}$:
$$
\tilde{\beta}_{1}=\hat{\beta}_{1}+\hat{\beta}_{2}\tilde{\delta}_{1}
$$
where:
- $\tilde{\delta}_{1}$ is the slope coefficient from the simple regression of $x_{i2}$ on $x_{i_{1}}$ for $i=1,\dots,n$
- $\hat{\beta}_{2}\tilde{\delta}_{1}$ 







