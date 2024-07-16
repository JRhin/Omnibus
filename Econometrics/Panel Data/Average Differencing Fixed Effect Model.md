It is another method for estimating unobserved effects panel data models, at least as common as [[First Differencing Model]]

**Idea**:
Instead of eliminating the fixed effect term through *first differencing*, we apply a so called **fixed effect transformation** given by the subtraction with the average sample value (*averaging over time*)

**Procedure**:
1. Starting from the [[Pooled Multiple Regression Model]]:
$$
\begin{equation}
y_{i t}=\beta_1 x_{i t 1}+\beta_2 x_{i t 2}+\ldots+\beta_k x_{i t k}+a_i+u_{i t}, \quad t=1,2, \ldots, T \quad i=1,\dots,N
\end{equation}
$$
2. We compute the average equation, also called the **between estimator**:
$$
\begin{equation}
\bar{y}_i=\beta_1 \bar{x}_i+a_i+\bar{u}_i
\end{equation}
$$
3. We apply the fixed effect transformation by removing the average equation for each record in our dataset, deriving the following **within estimator**:
$$
\begin{align}
y_{i t}-\bar{y}_i&=\beta_1\left(x_{it1}-\bar{x}_{i1}\right) +\ldots+\beta_k \left(x_{itk}-\bar{x}_{ik}\right) +u_{i t}-\bar{u}_i, \quad t=1,2, \ldots, T \quad i=1,\dots,N \\ \\
\\
\implies \ddot{y}_{it}&=\beta_{1}\ddot{x}_{it1}+\beta_{2}\ddot{x}_{it2}+...+\beta_{k}\ddot{x}_{itk}+\ddot{u}_{it},\quad t=1,2,...,T \quad i=1,\dots,N
\end{align}
$$
4. Now we can estimate the within estimator coefficients by using Pooled OLS

>[!danger] Where are the dummy variables gone?
>Notice how the first practical difference with [[First Differencing Model]]s is that we do not include the years dummy variables.

>[!tip] Strict Exogeneity and other assumptions
>- Under a strict exogeneity assumption on the explanatory variables, the fixed effects estimator is **unbiased**
>- other assumptions needed for a straight OLS analysis to be valid are that the errors $u_{it}$ are:
>	- homoscedastic 
>	- serially uncorrelated

>[!Note]
>The fixed effects estimator allows for arbitrary correlation between $a_{i}$ and the explanatory variables in any time period

>[!tip] Degrees of freedom
>When we estimate the time-demeaned equation by pooled OLS, we have:
>- $NT$ total observations
>- $k$ independent variables
>- for each $i$ the demeaned errors $\ddot{u}_{it}$ add up to zero when summed across $t$ $\implies$ we lose one degree of freedom for each of the $N$ cross-sectional samples.
>  Thus we get: $$df = NT - N - k = N(T-1) -k$$

## FE Assumptions

1. **Fixed Effect Model Assumption** <mark style="background: #ADCCFFA6;">FE.1</mark>: For each $i$, the model is:
$$
y_{it} = \beta_1 x_{it1} + \ldots + \beta_k x_{itk} + a_i + u_{it}, \quad t = 1, \ldots, T,
$$
	where the $\beta_j$ are the parameters to estimate and $a_i$ is the unobserved effect.

2. **Random Sample Assumption** <mark style="background: #ADCCFFA6;">FE.2</mark>: We have a random sample from the cross section.

3. **Time Variation Assumption** <mark style="background: #ADCCFFA6;">FE.3</mark>: Each explanatory variable changes over time (for at least some $i$), and no perfect linear relationships exist among the explanatory variables.

4. **Strict Exogeneity Assumption** <mark style="background: #ADCCFFA6;">FE.4</mark>: For each $t$, the expected value of the idiosyncratic error given the explanatory variables in all time periods and the unobserved effect is zero: $E(u_{it} \mid x_{itk}, a_i) = 0$.

>[!tip] FE.1 - FE.4 $\implies$ Unbiasedness and Consistency
>Under these first four assumptions—which are identical to the assumptions for the first-differencing estimator—the fixed effects estimator is unbiased. Again, the key is the strict exogeneity assumption, FE.4. Under these same assumptions, the FE estimator is consistent with a fixed $T$ as $N \to \infty$.

5. **Heteroskedasticity Assumption** <mark style="background: #ADCCFFA6;">FE.5</mark>:
$$
\text{Var}(u_{it} \mid X_i, a_i) = \text{Var}(u_{it}) = \sigma_u^2, \quad \text{for all } t = 1, \ldots, T.
$$

6. **Serially Uncorrelated Errors Assumption** <mark style="background: #ADCCFFA6;">FE.6</mark>: For all $t \ne s$, the idiosyncratic errors are uncorrelated (conditional on all explanatory variables and $a_i$): 
$$
\text{Cov}(u_{it}, u_{is} \mid X_i, a_i) = 0.
$$

>[!tip] FE.1 - FE.6 $\implies$ BLUE
>Under Assumptions FE.1 through FE.6, the fixed effects estimator of the $\beta_j$ is the [[BLUE Estimator]]. 

>[!tip] FE.1 - FE.6 $\implies$ FE better than FD
>Since the FD estimator is linear and unbiased, it is necessarily worse than the FE estimator. The assumption that makes FE better than FD is FE.6, which implies that the idiosyncratic errors are serially uncorrelated.

7. **Normality of the Error Assumption** <mark style="background: #ADCCFFA6;">FE.7</mark>: Conditional on $X_i$ and $a_i$, the $u_{it}$ are independent and identically distributed as 
$$
\text{Normal}(0, \sigma_u^2).
$$

>[!tip] FE.1 - FE.7 $\implies$ Exact distributions for the FE Statistics
>Assumption FE.7 implies FE.4, FE.5, and FE.6, but it is stronger because it assumes a normal distribution for the idiosyncratic errors. If we add FE.7, the FE estimator is normally distributed, and $t$ and $F$ statistics have exact $t$ and $F$ distributions. Without FE.7, we can rely on asymptotic approximations. But, without making special assumptions, these approximations require large $N$ and small $T$.

## Goodness-of-fit

The $R^2$ inferred from the fixed effect model equation is interpreted as the amount of time variation in the that is explained by the time variation in the explanatory variables.

## FE with years dummy variables


## FE vs FD

**When $T=2$**:
- The FE and FD estimates and test statistics, are identical (same results)
- FD has the advantage of being straightforward to implement in any econometrics or statistical package
- It is easy to compute heteroskedasticity-robust statistics after FD estimation

**When $T>2$**:
- Similarities:
	- both are unbiased under Assumptions <mark style="background: #ADCCFFA6;">FE.1</mark> through <mark style="background: #ADCCFFA6;">FE.4</mark>
	- both are consistent
- Differences:
	- if $u_{it}$ (idiosyncratic errors) serially uncorrelated $\implies$ FE is used more than FD
	- if $u_{it}$ follow a random walk $\implies$ $\Delta u_{it}$ serially uncorrelated $\implies$ FD is better
	- if $\Delta u_{it}$ have negative serial correlation $\implies$ FE is probably better

**When $T>N$**:
We must exercise caution in using the fixed effects estimator since inference can be very sensitive to violations of the assumptions

**Summing-up**:
Inference with the fixed effects estimator is potentially more sensitive to
1. nonnormality, 
2. heteroskedasticity,
3. serial correlation in the idiosyncratic errors.
#### Testing Serial Correlation

**Problem**:
It is difficult to test $u_{it}$ serial correlation after FE estimate (it would be easy to test serial correlation for $\ddot{u}_{it}$)

**Solution**:
We test whether the differenced errors $\Delta u_{it}$ are serially correlated as we did when testing serial correlation in FD.
If there is negative serial correlation $\implies$ Fe is probably better