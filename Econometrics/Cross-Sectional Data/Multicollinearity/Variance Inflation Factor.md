The VIF is a statistic for individual coefficients of [[Multiple Regression Model]] aimed to measure the **[[Multicollinearity]]** level for a particular independent variable.

Given a general MLR model:
$$
y=\beta_0+\beta_1x_1+\beta_2x_2 + \dots + \beta_{k}x_{k} +u
$$

The VIF for $j$-th **OLS coefficient** $\hat{\beta}_{j}$ is given by:
$$
\mathrm{VIF_{j}}=\frac{1}{1-R_{j}^2}
$$
where $R_{j}^2$ is R-squared from regressing $x_{j}$ on all the other independent variables.

>[!info] Interpretation with the OLS Variance
>Here we report the formulation which explains the relation between the variance of the $j$-th OLS coefficient:
>$$\mathrm{Var}(\hat{\beta}_j)=\frac{\sigma^2}{\mathrm{SST}_j}\cdot\mathrm{VIF}_j$$
>The term in $\text{Var}(\hat{\beta}_j)$ that is determined by the correlation between $x_j$ and the other explanatory variables.

>[!tip] VIF cutoff value
>Setting a cutoff value for VIF above which we conclude multicollinearity is a “problem” is arbitrary and not especially helpful. Often the value 10 is chosen: if $\mathrm{VIF}_{j} > 10$ (equivalently, $R^2_j>0.9$) then we conclude that multicollinearity is a “problem” for estimating $\hat{\beta}_{j}$

>[!danger]
>$\mathrm{VIF}_{j}$ above 10 does not mean that the standard deviation of $\hat{\beta}_{j}$ is too large to be useful because the standard deviation also depends on $\sigma$ ans $\mathrm{SST}_{j}$