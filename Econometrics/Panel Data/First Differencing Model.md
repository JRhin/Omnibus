#### Setup with $t=2$ periods of time
**Idea**:
Because the Fixed Effect $a_{i}$ is constant over time, we can difference the data across the two years. 

**Procedure**:
1. In particular, for a cross-sectional observation $i$ over the $t=2$ periods we have:
$$
\begin{equation}
\left\{\begin{array}{l}
y_{i 2}=\left(\beta_0+\delta_0\right)+\beta_1 x_{i 2}+a_i+u_{i 2} \quad(t=2) \\
y_{i 1}=\beta_0+\beta_1 x_{i 1}+a_i+u_{i 1} \quad(t=1) .
\end{array}\right.
\end{equation}
$$
2. subtract the second equation form the first one:
$$
\begin{equation}
\begin{gathered}
\left(y_{i 2}-y_{i 1}\right)=\delta_0+\beta_1\left(x_{i 2}-x_{i 1}\right)+\left(u_{i 2}-u_{i 1}\right) \\
\\
\implies \Delta y_i=\delta_0+\beta_1 \Delta x_i+\Delta u_i
\end{gathered}
\end{equation}
$$
3. Notice how the Fixed Effect Term just disappeared from our equation

>[!tip] Assumptions to apply OLS to the First Differencing equation
>1. **Strict Exogeneity** $\implies$ $\Delta u_{i}$ uncorrelated with $\Delta x_{i}$ $\iff$ **idiosyncratic error** from original equation $u_{it}$ is uncorrelated with $x_{it}$ *in both time periods* 
>2. **Temporal variation** of $\Delta x_{i}$  across $i$ $\implies$ it fails if explanatory variable never changes over time
>3. **Homoskedasticity** is needed (otherwise we have to correct it)

>[!danger] Main drawbacks
>1. Panel data sets are harder to collect than a single cross section, especially for individuals (e.g. units such as firms, some will go bankrupt or merge with other firms)
>2. The differencing used to eliminate $a_{i}$ can greatly reduce the variation in the explanatory variables $\implies$ also if $x_{it}$ has substantial variation in the cross section, this might not be true for $\Delta x_{i}$ $\implies$ little variation can lead to large standard errors for $\hat{\beta}_{j}$
>3. Qualitative information contained in dummy variables could be problematic since in that case we end-up with always $\Delta x_{i}=0$

>[!note] Suggestions
>1. To combat drawback 2. you can augment the variability in the differences by:
>	- using larger cross-sections
>	- using longer differences over time
>2. Organize panel data such that records for the same cross-sectional observations are adjacent and sorted by period

#### General setup with $t=T$ periods of time

**Procedure**:
0. We have a **Balanced** [[Panel Data]]set 
1. Start from general Fixed Effect model with $k$ variables and $T$ periods (introducing $T-1$ dummy variables) we can differentiate the records for adjacent periods:
$$
\begin{equation}
\begin{aligned}
\Delta y_{i t}= & \alpha_0+\alpha_3 d 3_t+\alpha_4 d 4_t+\ldots+\alpha_T d T_t+\beta_1 \Delta x_{i t 1}+\ldots +\beta_k \Delta x_{i t k}+\Delta u_{i t},\\
\\
&\quad t=2,3, \ldots, T \quad i=1,\dots,N
\end{aligned}
\end{equation}
$$
2. Notice that we have a total of $N(T-1)$ observations
3. It is simple to estimate the above regression by pooled OLS, provided the observations have been properly organized and the differencing carefully done

>[!warning] Number of dummy variables
>When $T$ is small we should introduce $T-1$ dummy variables, otherwise we may opt for less dummy variables.

**Problem**:
- When $T=2$ we have as correct assumption that $\operatorname{Cov}\left(x_{i t j}, u_{i s}\right)=0, \quad \text { for all } t, s, \text { and } j$ 
  This assumption is generally violated if we have omitted an important time-varying variable.
- When $T>2$ the above assumption is not enough since we need that $\Delta u_{it}$ are **uncorrelated over time** (serially uncorrelated)
- 
**Solution**:
We do not need $u_{it}$ to be serially uncorrelated but to follow a random walk since:
- if $u_{it}$ serially uncorrelated $\implies$ $Cor(\Delta u_{it},u_{i(t+1)})=-0.5$
- if $u_{it}$ follow a random walk (in time) $\implies$ serially uncorrelated $\Delta u_{it}$

>[!tip] Testing Serial Correlation of the errors
>1. Goal: to test serial correlation in the first-differenced equation
>2. Let's denote the **first difference of the error** as:
>$$r_{it}=\Delta u_{it}>$$
>3. Estimate the fist differencing equation to obtain the residuals $\hat{r}_{it}$
>4. Run a simple pooled OLS on adjacent residuals to evaluate the OLS coefficient $\hat{\rho}$, i.e.:
>$$\hat{r}_{it}=\rho \cdot \hat{r}_{i(t-1)} + e_{it}, \quad t=3,\dots,T, \; i=1,\dots,N>$$
>5. We know that $\hat{\rho}$ is consistent estimator of $\rho$
>6. We use the t test to test the first-order autocorrelation (AR(1)) of residuals
$$H_{0}: \rho=0$$
>7. We can correct for the presence of **AR(1) serial correlation** in $r_{it}$ by using [[Feasible Generalized Least Squares]] (Prais-Winsten transformation for time series ?)

>[!tip] Chow Test
>We might be interested in using [[Chow Test]]  as in the Pooled OLS setup in order to test whether **slope coefficients have changed over time** (by interacting the explanatory variables of interest with time-period dummy variables).
>
>While we cannot estimate the slopes on variables that do not change over time, we can test whether the partial effects of time-constant variables have changed over time.

>[!danger] First Differencing Main Issues
>1. When the key explanatory variables do not vary much over time
>2. When we do have sufficient time variation in the $x_{itj}$ observations FD estimation can be subject to serious biases
>3. Having more time periods generally does not reduce the inconsistency in the FD estimator when the regressors are not **strictly exogenous**
>4. The FD estimator is that it can be worse than pooled OLS if one or more of the explanatory variables is subject to measurement error (*nan* values). Differencing a poorly measured regressor reduces its variation relative to its correlation with the differenced error caused by classical measurement error.

