---
title: Instrumental Variables
created: 2024-09-16
authors:
  - Engrima
tags:
  - Econometrics
  - Cross-Sectional_Data
  - Endogeneity
---
## IV for the Simple Regression
#### Idea behind IV
Instrumental Variables approach **leaves the unobserved variable in the error term**, but rather than
estimating the model by OLS, it uses an estimation method that recognizes the presence of
the omitted variable [[Endogeneity]].

#### Procedure

1. Let's start from a simple example where we:
	1. use a [[Simple Regression Model]] $$y = \beta_{0}+ \beta_{1} x_{1} + u$$
	2. where we omitted a relevant variable $x_{2}$
	   
2. We thus assume that $Cov(x_{1},u) \neq 0$ (otherwise there would be no problem in using the OLS Estimators)
   
3. We can find an instrumental variable for $x_{1}$ and still use the above simple regression model with only $x_{1}$
   
4. Suppose we can find a variable $z$ that is an instrumental variable for $x$, i.e a variable s.t.:
   
	1. **Instrument Exogeneity**: $z$ is uncorrelated with $u$ $\implies$ $Cov(z,u) = 0$
	   $\implies$ $z$ should have no partial effect on $y$
	   
	2. **Instrument Relevance**:  $z$ is correlated with $x_{1}$ $\implies$ $Cov(z,x_{1}) \neq 0$
	   $\implies$ $z$ must be related to the *endogenous variable* $x_{1}$

5. We notice that in practice we cannot test the **Instrument Exogeneity** condition

6. But we can test **Instrument Relevance** condition by:

	1. Estimate a simple regression: $$x = \pi_{0} + \pi_{1} z + \nu$$
	2. because $\pi_{1}=\frac{Cov(z,x)}{Var(z)}$, the instrumental relevance ass. holds if we can reject: $$\begin{align} H_{0}:\pi_{1}=0\\ \\ H_{1}:\pi_{1}\neq0 \end{align}$$
7. By using the [[Parameter Identification]] procedure we can finally find the **IV Estimator** using the new-found instrumental variable: $$\begin{align} \hat{\beta}_{1}&=\frac{\sum_{i=1}^n(z_{i}-\bar{z})(y_{i}-\bar{y})}{\sum_{i=1}^n(z_{i}-\bar{z})(x_{i}-\bar{x})} \\ \\ \hat{\beta}_{0}&=\bar{y}-\hat{\beta}_{1}\bar{x} \end{align}$$

>[!info] Example
>1. Given the equation $$score = \beta_{0} + \beta_{1} skipped + u$$
>2. We **suspect we cannot use OLS estimates** since $Cov(x,u)\neq0$
>3. What might be a good IV variable for $skipped$? We need a variable that at the same time:
> 	  1. has no direct effect on $score$ (otherwise we would directly control for that variable in the equation)
> 	  2. is not correlated with $u$ (where $u$ in this case may contain variables such as $ability$ and $motivation$)
> 	  3. is correlated with $skipped$
> 4. A possible option is to use distance between living quarters and campus: some students at a large university will commute to campus, which may increase the likelihood of missing lectures

>[!danger] 
>in using the auxiliary simple regression in equation to test $H_{0}: \pi_{1}=0$, it is important to take note of the sign (and magnitude) of $\pi_{1}$ and not just its statistical significance. Arguments for why a variable z makes a good IV candidate for an endogenous explanatory variable $x$ should include a discussion about the nature of the relationship between $x$ and $z$.

>[!tip] Proxy Variables vs IV
>[[Proxy Variables]] for the omitted variable make poor IV Variables. A proxy variable must be as correlated as possible with the omitted variable $x_{2}$ while an instrumental variable must be uncorrelated with $x_{2}$ in order to be uncorrelated with $u$ (which actually contains the omitted relevant variable)...
>
>A proxy variable is a candidate substitute for the omitted variable, while an instrumental variable is an auxiliary variable to associate to a certain endogenous independent variable in order to mitigate the omitted variable bias.

>[!tip] OLS vs IV
>If we take the IV-based [[Parameter Identification]] procedure, we get the **IV Estimate** for the simple regression case: $$\hat{\beta}_{1}=\frac{\sum_{i=1}^n(z_{i}-\bar{z})(y_{i}-\bar{y})}{\sum_{i=1}^n(z_{i}-\bar{z})(x_{i}-\bar{x})}$$
>It is easy to note that if $z=x_{1}$ $\implies$ $x_{1}$ is **exogenous** $\implies$ it can be used as its own IV
>
>$\implies$ It this case we would get that the IV Estimator would coincide with the [[Ordinary Least Squares]] Estimator for the simple regression model: $$\hat{\beta}_1=\frac{\sum_{i=1}^n\left(x_i-\bar{x}\right)\left(y_i-\bar{y}\right)}{\sum_{i=1}^n\left(x_i-\bar{x}\right)^2}$$

>[!warning] Bias and Consistency of the IV Estimator
>- Application of the law of large numbers $\implies$ IV Estimator is a **consistent** estimator for $\beta_{1}$
>- When $x$ and $u$ are actually correlated $\implies$ substantial bias for small samples

#### Inference with IV Estimators

##### IV Variance
- To make inference we impose the **Homoskedasticity assumption** (as in the OLS case) with slight variation, in the sense that we **condition on instrumental variable** $z$ instead of $x$: $$\mathbb{E}(u^2|z)=\sigma^2=\operatorname{Var}(u)$$
- **Instrument exogeneity**, **relevance** and **homoskedasticity** imply the following **asymptotic variance**: $$Var(\hat{\beta}_{1})=\frac{\sigma^2}{n\cdot\sigma^2_{x} \rho_{x,z}^2}$$
	where:
	- $\sigma_{x}^2$ $\rightarrow$ population variance of $x$
	- $\sigma^2$ $\rightarrow$ population variance of $u$
	- $\rho_{x,z}^2$ $\rightarrow$ squared population correlation between $x$ and $z$

##### IV standard error
- The **IV Variance** provides a way to obtain a **standard error for the IV estimator**
- We estimate:
  - $\sigma_{x}^2$ $\rightarrow$ with sample variance of $x$, i.e. $SST_{x}$
  - $\sigma^2$ $\rightarrow$ using the **IV residuals** $\hat{u}_{i}=y_{i}- \hat{\beta}_{0}-\hat{\beta}_{1} x_{i}$ we can estimate $\sigma^2$ with: $$\hat{\sigma}^2=\frac{1}{n-2} \sum_{i}\hat{u}_{i}^2$$
  - $\rho_{x,z}^2$ $\rightarrow$ with $R_{x,z}^2$ obtained from regressing $x_{i}$ on $z_{i}$
- the estimate of the **asymptotic variance** will be : $$se(\hat{\beta}_{1})= \frac{\hat{\sigma}^2}{SST_{x} \cdot R_{x,z}^2 }$$ 
- the **asymptotic standard error** will be: $$se(\hat{\beta}_{1})= \frac{\hat{\sigma}}{\sqrt{SST_{x}} \cdot \sqrt{ R_{x,z}^2 }}$$

>[!tip] OLS variance vs IV variance
>They differ only in that $R_{x,z}^2$ appears in the denominator of the IV variance. Some implications:
>1. IV variance always larger than OLS variance (IV main drawback)
>2. highly correlated $x$ and $z$ $\implies$ $R_{x,z}^2$ closer to $1$ $\implies$ smaller IV variance
>3. in case $z=x$ $\implies$ $R_{x,z}^2=1$ $\implies$ OLS equal to IV

#### Weak Instruments issue

- We provide a first comparison between OLS and IV in terms of asymptotical behaviour in order to highlight the importance of the IV assumption that we used about the correlations between variables:
$$
\begin{cases}
plim \;\hat{\beta}_{1,IV}=\beta_{1}+ \frac{Cor(z,u)}{Cor(z,x)} \cdot \frac{\sigma_{u}}{\sigma_{x}}\\ \\
plim \; \hat{\beta}_{1,OLS}=\beta_{1}+ Cor(x,u) \cdot \frac{\sigma_{u}}{\sigma_{x}}
\end{cases}
$$
- it is important that $Cov(z,u)=0$, since also for a weak correlation we would get an inconsistent estimator. The above comparison demonstrates some important properties:
	- better to use IV than OLS if the correlation between $z$ and $u$ is smaller than that between $x$ and $u$.
	- the direction of the asymptotic biases can be different between IV and OLS
	- more problematic when the direction of the biases is the same and the correlation between $z$ and $x$ is small
	- when $z$ and $x$ are not correlated at all, things are especially bad, whether or not $z$ is uncorrelated with $u$.

>[!danger] IV $R^2$
>1. Consider $R^2=1 - \frac{SSR}{SST}$
>2. $SSR$ is the sum of squared IV residuals, and $SST$ is the total sum of squares of $y$
>3. For IV , it might happen that $SSR>SST$ $\implies$ it can be that $R^2_{IV}<0$ (unlike $R^2_{OLS}$)
>4. This implies that $R^2_{IV}$ cannot be used to compute an [[F-test]]
>5. IV methods are intended to provide better estimates of the ceteris paribus effect of $x$ on $y$ when $x$ and $u$ are correlated $\implies$ goodness-of-fit is not a factor.

## IV for the Multiple Regression

#### Case 1: one endogenous explanatory variable  and one exogenous explanatory variable

- Given the new notation for the Multiple Regression:
	- $y_{1}$ $\rightarrow$ dependent endogenous variable
	-  $y_{2}$ $\rightarrow$ independent endogenous variable $\rightarrow$ suspected of being correlated with $u_{1}$
	-  $z_{1}$ $\rightarrow$ independent exogenous variable 
$$
y_{1}=\beta_{0}+\beta_{1}y_{2} + \beta_{2}z_{1} + u_{1}
$$
- Assume as always that $\mathbb{E}(u_{1})=0$
- If we use OLS for this model we get a biased estimator *because of the endogeneity* of $y_{2}$
- **Important**: we cannot use $z_{1}$ as IV for $y_{2}$ since $z_{1}$ is already included
- We need to select another exogenous variable $z_{2}$ that:
	1. is uncorrelated with $u_{1}$
	2. is correlated with $y_{2}$
- We derive new set of conditions:
	1. $\mathbb{E}(u_{1})=0$
	2. $Cov(z_{1},u_{1})=0$
	3. $Cov(z_{2},u_{1})=0$
- We finally use the **method of moments** and the above conditions to get the IV Estimators $\hat{\beta}_{0}, \hat{\beta}_{1},\hat{\beta}_{2}$:
$$
\begin{cases}
\sum_{i=1}^{n}(y_{i1}-\hat{\beta}_{0}-\hat{\beta}_{1}y_{i2}-\hat{\beta}_{2}z_{i1})=0\\\sum_{i=1}^{n}z_{i1}(y_{i1}-\hat{\beta}_{0}-\hat{\beta}_{1}y_{i2}-\hat{\beta}_{2}z_{i1})=0\\\sum^{n}z_{i2}(y_{i1}-\hat{\beta}_{0}-\hat{\beta}_{1}y_{i2}-\hat{\beta}_{2}z_{i1})=0
\end{cases}
$$

>[!tip] IV vs OLS
>If we think $y_{2}$ is exogenous and choose $z_{2}=y_{2}$, the above equations are the **OLS first order conditions**!

- As for the simple regression setup, we can check the Instrumental Relevance condition ($z_{2}$ and $y_2$ are actually correlated), by:
  1.  writing the endogenous explanatory variable $y_{2}$ as a linear function of the exogenous variables and an error term (*reduced form equation*): $$y_{2}= \pi_{0} + \pi_{1}z_{1}+ \pi_{2}z_{2}+\nu_{2}$$
  2. By construction we know that: $$\begin{cases}\mathbb{E}(\nu_{2})=0 \\ \\ Cov(z_{1},\nu_{2})=Cov(z_{2},\nu_{2})=0\end{cases}$$
  3. We need to check that $\pi_{2}\neq_{0}$ $\implies$ after partialling out $z_{1}$, $y_{2}$ and $z_{2}$ are still correlated
	   $\implies$ we do that by estimating the eq. at point 1 by OLS and then testing $\pi_{2}$

#### Case 2: one endogenous explanatory variable  and multiple exogenous explanatory variable

- Nothing is particularly different if we are in a setup with $k-1$ exogenous (good) independent variables $z_{1},\dots,z_{k-1}$ and always one endogenous (bad) independent variable $y_{2}$: $$y_{1}=\beta_{0}+\beta_{1}y_{2}+\beta_{2}z_{1}+\dots+\beta_{k}z_{k-1}+u$$

- We simply:
1. consider a candidate instrumental variable $z_{k}$ that we think to satisfy the IV conditions
2. assume that $\mathbb{E}(u)=0$ and $Cov(z_{j},u)=0 \; \forall j=1,\dots,k$
3. check that there is some correlation between $z_{k}$ and $y_{2}$ by
	1. using the reduced form equation , i.e.: $$y_{2}=\pi_{0}+\pi_{1}z_{1}+\dots+\pi_{k}z_{k}+\nu_{2}$$
	2. and the [[T-test]] on the correct variable ($\pi_{k}\neq{0}$)
	   $\implies$ we do not care about the other $\pi_{j}$
4. the only practical difference for the multiple exogenous variables case is that we have a minor additional assumption of **no perfect collinearity among exogenous variables**

>[!warning] The other possible cases
>The two following cases are covered in the IV-based approach given by the [[Two-Stage Least Squares]] Estimates:
>-  we have more than one exogenous variable excluded from the model
>  $\implies$ we have multiple valid IVs
>- we have more than one endogenous (variable) in the model 
>  $\implies$ multiple variables are correlated with the error

