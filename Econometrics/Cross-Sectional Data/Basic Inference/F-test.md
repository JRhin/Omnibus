**Problem**:
- t statistic for the [[T-test]] associated with any OLS coefficient can be used to test whether the corresponding unknown parameter in the population is equal to any given constant
- Now, we wish to **test multiple hypotheses about the underlying parameters** $\beta_{0},\dots,\beta_{k}$
- Using separate t statistics to test a multiple hypothesis can be very misleading. We need a way to test the exclusion restrictions *jointly*.
$\implies$ **Multiple Hypotheses Test** / **Joint Hypotheses Test** for multiple **Exclusion Restrictions**

**Idea**:
1. **Hint**: The sum of squared residuals now turns out to provide a very convenient basis for testing multiple hypotheses
2. **Point**: how much the SSR increases when we drop the jointly tested variables from the model?

**Procedure**:
1. Write the **unrestricted model** for our general [[Multiple Regression Model]] with $k$ indep. variables: $$y=\beta_0+\beta_1x_1+\beta_2x_2 + \dots + \beta_{k}x_{k} +u$$
2. Suppose that we have $q$ **exclusion restrictions** to test $\implies$ the null hypothesis
states that the $q$  variables have zero coefficients: $$\mathrm{H}_{0}\colon\beta_{k-q+1}=0,\ldots,\beta_{k}=0,$$
3. Alternative hypothesis $\rightarrow$ at least one of the $q$ parameters is different from zero
4. We impose the restrictions under $H_{0}$ $\implies$ we define the **restricted model**: $$y=\beta_0+\beta_1x_1+...+\beta_{k-q}x_{k-q}+u$$
5. We now have to look at the relative increase in the SSR when moving from the unrestricted to the restricted model getting the **F statistic**: $$F\equiv\frac{(\mathrm{SSR}_r-\mathrm{SSR}_{ur})/q}{\mathrm{SSR}_{ur}/(n-k-1)}$$
   Alternatively we can report the R-squared form of the F statistic: $$F=\frac{(R_{ur}^{2}-R_{r}^{2})/q}{(1-R_{ur}^{2})/(n-k-1)}= \frac{(R_{ur}^{2}-R_{r}^{2})/q}{(1-R_{ur}^{2})/df_{ur}}$$
6. Where:
	- $SSR_{r}$ $\rightarrow$ sum of squared residuals from the restricted model
	- $SSR_{ur}$ $\rightarrow$ sum of squared residuals from the unrestricted model
	- $q$ $\rightarrow$ difference in degrees of freedom between the restricted and unrestricted models.
	- $F$ is always $\geq 0$
	- $\mathrm{SSR}_r-\mathrm{SSR}_{ur})/q$ $\rightarrow$ difference in the SSRs divided by $q$
	- $\mathrm{SSR}_{ur}/(n-k-1)$ $\rightarrow$ unbiased estimator of $\sigma^2=Var(u)$

7. We will reject $H_{0}$ in favor of $H_{1}$ when $F$ is sufficiently large: $$F>c$$
8. How large depends on our chosen *significance level*

![[Pasted image 20240716170401.png]]

>[!tip] F distribution
>It can be shown that:
>-under $H_{0}$
>- under [[Classical Linear Model Assumptions]]
>  
>  $\implies$ $F \sim F_{q,n-k-1}$

>[!info]
>It can be shown that $F$ is actually the ratio of two independent chi-square random variables, divided by their respective degrees of freedom.

#### Particular case 1: Variable are jointly significant but not individually
- This is general due to the fact that there is [[Multicollinearity]] among the tested variables
- The F statistic is less sensitive to multicollinearity
- For this reason the F statistic is often useful for testing exclusion of a group of variables when the variables in the group are highly correlated.

#### Particular case 2: One variable has a significant t statistic but the group of variables is jointly insignificant
- The F statistic is intended to detect whether a set of coefficients is different from zero, but it is never the best test for determining whether a single coefficient is different from zero
- The fact that we can sometimes hide a statistically significant variable along with some insignificant variables could lead to abuse if regression results are not carefully reported
- Often, when a variable is very statistically significant and it is tested jointly with another set of variables, the **set will be jointly significant**.

#### Particular case 3: F Statistic for Overall Significance of a Regression
- The $H_{0}$ this time states that **none of the explanatory variables has an effect** on $y$: $$\mathrm{H}_0\colon\beta_1=\beta_2=...=\beta_k=0$$
- The restricted model will be: $$y=\beta_{0}+u$$
- The F statistic can be written as: $$F= \frac{R^2/k}{(1-R^2)/(n-k-1)}$$
- Notice: seemingly small R-squared may result in a highly significant F statistic. That is why we must compute the F statistic to test for joint significance and not just look at the size of the R-squared.


