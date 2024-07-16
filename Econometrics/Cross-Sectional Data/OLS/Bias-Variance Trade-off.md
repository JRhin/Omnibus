Bias and Variance are two measures of the estimation error resulting from fitting a model to a certain dataset. In general we cannot reduce both these quantities and the *choice of including or not a feature/independent variable in model* is led by this trade-off
#### Including irrelevant variables

Inclusion of an irrelevant variable or **overspecifying** the model means that one (or more) of the independent variables is included in the model even though it has *no partial effect* on y in the population.

Implications on the estimators $\hat{\beta}_{1},\dots,\hat{\beta}_{k}$:
- no effect in terms of unbiasedness
- undesirable effects on the variances

#### Omitting relevant variables

1. Suppose we suspect we have omitted a variable $x_{2}$ that actually belongs in the true (population) model we have:
- the *true model*:
$$y=\beta_{0}+\beta_{1}x_{1}+\beta_{2}x_{2}+u$$
-  the *misspecified model*:
$$
\tilde{y}=\tilde{\beta}_0+\tilde{\beta}_1x_1
$$
2. The difference between these two models recalls the above difference of MRL vs SRL model and we already noticed the interesting relation:
$$
\tilde{\beta}_{1}=\hat{\beta}_{1}+\hat{\beta}_{2}\tilde{\delta}_{1}
$$
3. Easy to check for the **unbiasedness** of $\hat{\beta}_{1}$:
$$
\begin{aligned}
\mathrm{E}(\tilde{\beta}_{1})& =\mathrm{E}(\hat{\beta}_{1}+\hat{\beta}_{2}\tilde{\delta}_{1})\\
&=\mathrm{E}(\hat{\beta}_{1}) + \mathrm{E}(\hat{\beta}_{2}) \tilde{\delta}_{1} \\
&=\beta_{1}+\beta_{2}\tilde{\delta}_{1},
\end{aligned} \implies \mathrm{Bias}(\tilde{\beta}_{1})=\mathrm{E}(\tilde{\beta}_{1})-\beta_{1}=\beta_{2}\tilde{\delta}_{1}
$$
4. We further decompose $\tilde{\delta}_{1}$ and rewrite the bias:
$$
\begin{align}
\mathrm{Bias}(\tilde{\beta}_{1})= \frac{\sum_{i=1}^n(x_{i1}-\overline{x}_1)x_{i_{2}}}{\sum_{i=1}^n(x_{i1}-\overline{x}_1)^2}
\end{align}
$$
	where:
	-  $\sum_{i=1}^n(x_{i1}-\overline{x}_1)x_{i_{2}} = \; \text{sample} \; Cov(x_{1},x_{2})$
	- $\sum_{i=1}^n(x_{i1}-\overline{x}_1)^2 = \; \text{sample} \; Var(x_{1})$ 

5. We get 2 different types of bias:
	1. $\mathrm{E}(\tilde{\beta}_{1})=\tilde{\beta}_{1}$ $\implies$ $\tilde{\beta}_{1}$ has **no bias** $\iff$ $Cor(x_{1},x_{2})=0$
	2. $\mathrm{E}(\tilde{\beta}_{1})>\tilde{\beta}_{1}$ $\implies$ $\tilde{\beta}_{1}$ has an **upward bias**
	3. $\mathrm{E}(\tilde{\beta}_{1})<\tilde{\beta}_{1}$ $\implies$ $\tilde{\beta}_{1}$ has an **downward bias**

>[!warning] 
>- The sign of the bias (and its existence) is dependent on the sign and the value of $Cov(x_{1},x_{2})$
>- The size of the bias is determined by the sizes of $\beta_{2}$ and $\tilde{\delta}_{1}$

>[!note] Generalization 1
>Notice that the above considerations are the same in the generalized case, when we have multiple independent variables $x_{1},\dots,x_{k}$ and we suspect that we omitted a variable $x_{j}$ that is correlated in some way with some included independent variable $x_{i}$ and we can study the bias induced on the coefficient $\tilde{\beta}_{i}$ by the omission of the correlated variable $x_{j}$.

>[!note] Generalization 2
>It is also possible to analyze the bias induced on a particular coefficient, given the omission of multiple variables, but we do not report it for simplicity.

**Point**:
- if we consider the bias is considered as the main (and unique) criterion for analyzing our model, the MRL would always be preferred to SRL because $\hat{\beta}_{1}$ wold be unbiased since we assumed the MRL model satisfies the [[Gauss-Markov Assumptions]] (while $\tilde{\beta}_{j}$ is biased)
- if we instead also consider the variance (conditioned on $x_{1}\;,x_{2}$):
$$
\begin{cases}
\mathrm{Var}(\hat{\beta}_1)&=\sigma^2/[\mathrm{SST}_1(1-R_1^2)] \\
\mathrm{Var}(\tilde{\beta}_1)&=\sigma^2/\mathrm{SST}_1
\end{cases}
\implies
\mathrm{Var}(\tilde{\beta}_1)<\mathrm{Var}(\hat{\beta}_1)
$$
>[!tip]
>Notice how:
>- $\mathrm{Var}(\tilde{\beta}_1)<\mathrm{Var}(\hat{\beta}_1)$ both if $\hat{\beta}_{1}$ is biased or not
>- if $\beta_{2}=0$ $\implies$ $\tilde{\beta}_{1}$ is preferred since $\hat{\beta}_{1}$ and $\tilde{\beta}_{1}$ would be both unbiased but the latter would have smaller variance

#### When to include or not a variable? **Use the Bias-Variance Trade-off**

1. If $\beta_{2}=0$ $\implies$ do not include $x_{2}$
2. If $\beta_{2}\neq0$ $\implies$ compare the likely size of the bias due to omitting $x_{2}$ with the reduction in the variance, thus:
$$\text{Omitting Bias vs Inclusion Variance} \iff \text{Size of} \; R_{1}^2$$
	In the latter case we would prefer to include $x_{2}$ in two cases:
	1. **Reducing variance for large sample size**
	   $\text{Var}(\tilde{\beta}_1)$ and $\text{Var}(\hat{\beta}_1)$ both shrink to zero as $n$ gets large $\implies$ the multicollinearity induced by adding $x_2$ becomes less important as $n$ grows $\implies$ In large samples, we would prefer $\hat{\beta}_1$.
	2. **Underestimated variance**
	   The formulation of $\mathrm{Var}(\tilde{\beta}_1)=\sigma^2/\mathrm{SST}_1$ is conditioned on both $x_{1}$ and $x_{2}$, but if we exclude $x_{2}$ and condition the previous variance only on $x_{1}$ we would get an higher $\mathrm{Var}(\tilde{\beta}_1)$ (the error would also contain part of $x_{2}$)