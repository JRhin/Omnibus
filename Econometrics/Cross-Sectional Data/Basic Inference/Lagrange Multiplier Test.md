
**Idea**:
- It is an alternative to the [[F-test]]
- Consider the usual [[Multiple Regression Model]] with $k$ independent variables: $$y=\beta_0+\beta_1x_1+\beta_2x_2 + \dots + \beta_{k}x_{k} +u$$
- We would like to test: $$\mathrm{H}_0\colon\beta_{k-q+1}=0,...,\beta_k=0$$
- **Hint**: 
  If the omitted variables $x_{k-q+1}$ through $x_k$ truly have zero population coefficients
  $\implies$ at least approximately, $\tilde{u}$ should be uncorrelated with each of these variables in the sample 
  $\implies$ this suggests running a regression of these residuals on those independent variables excluded under $H_0$.

**Procedure**:
1. Regress $y$ on the restricted set of independent variables and save the residuals $\tilde{u}$: $$y=\tilde{\beta}_{0}+\tilde{\beta}_{1}x_{1}+...+\tilde{\beta}_{k-q}x_{k-q}+\tilde{u}$$
2. Regress $\tilde{u}$ on all of the independent variables with an **auxiliary regression** and obtain $R_{u}^2$
3. Compute the **LM statistic**: $$LM = nR_{u}^2 \sim \chi_{q}^2 $$
4. Evaluate the p-value

>[!warning]
>The df in the unrestricted model plays no role because of the asymptotic nature of the LM statistic!

