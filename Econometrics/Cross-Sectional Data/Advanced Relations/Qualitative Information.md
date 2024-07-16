
We must incorporate qualitative factors int a general [[Multiple Regression Model]]

#### Case 1: Single Dummy Independent Variable

**Example**:
- Regression model: $$wage=\beta_0+\delta_0female+\beta_1educ+u$$
- $female$ $\rightarrow$ dummy variable s.t. $female=0$ when the person is male
- Interpretation of $\delta_{0}$:
	- $\delta_{0}$ $\rightarrow$ difference in hourly wage between females and males, **given the same amount of education** (and the same error term u)... always remember the ceteris paribus.
	- $\delta_{0}<0$ $\implies$ for the same level of other factors, women earn less than men on average
	- it encodes the gender gap for this model
	- if MRL.4 holds we have that: $$\delta_{0}=\mathrm{E}(wage|female=1,educ)-\mathrm{E}(wage|female=0,educ)$$
	- the situation can be depicted graphically as an **intercept shift** between males and females, i.e.:
		- intercept for males $\rightarrow$ $\beta_{0}$
		- intercept for females $\rightarrow$ $\beta_{0}+\delta_{0}$

![[Pasted image 20240716140619.png]]

>[!warning] Obs. 1: same slopes
>the intercept difference does not depend on the amount of education, and this explains why the wage-education profiles for women and men are parallel.

>[!warning] Obs. 2: dummy variable trap
>Using two dummy variables would introduce [[Perfect Collinearity]] because $female + male = 1$,

>[!tip] With more independent variables
>Nothing changes... BUT attention to the interpretation of the dummy variable coefficient:
>including more variables, in our example, gives a more reliable ceteris paribus estimate of the gender gap

>[!info] Policy analysis as an interesting use case
>Introducing a dummy variable to distinguish between a **control** and **treatment** group in the population allows for a suitable *policy analysis* or *program evaluation*

>[!tip] Dummy variable coeff. when we have $\log(y)$
>- Given the dummy variable $x_{1}$ and its coefficient estimate $\hat{\beta}_{1}$
>- The exact percentage difference in the predicted $y$ when $x_{1} = 1$ versus when $x_{1} = 0$ is: $$100 \cdot [\exp(\hat{\beta}_{1})-1]$$


#### Case 2: Multiple (Category) Dummy Independent Variables

**Idea**:
- If the regression model is to have different intercepts $g$ groups or categories, we need to include $g - 1$ **dummy variables** in the model along with **an intercept**
- The **intercept for the base group** $\rightarrow$ the overall intercept
- Dummy variable coefficient for a particular group $\rightarrow$ the estimated difference in intercepts between **that group** and the **base group** (not all the other groups!)


## Allowing for Different Slopes

Idea:
1. **Multiple Dummy Independent Variables** $\rightarrow$ different intercepts for any number of groups in a multiple regression model
2. **Interacting dummy variables with other dummy variables** $\rightarrow$ equivalent to creating more possible sub-categories starting from different base categories (e.g. interacting $female$ and $married$ dummy variables to create 4 derived categories)
3. **Interacting dummy variables with explanatory variables that are not dummy variables** $\rightarrow$ allows for a *difference in slopes*

Example:
- Given the model:
  $$\log(wage)=(\beta_0+\delta_0female)+(\beta_1+\delta_1female)educ+u$$
- We have that:
	- intercept for males $\rightarrow$ $\beta_{0}$
	- slope for males $\rightarrow$ $\beta_{1}$
	- intercept for females $\rightarrow$ $\beta_{0}+\delta_{0}$
	- slope for females $\rightarrow$ $\beta_{1}+\delta_{1}$
	- $\delta_{0}$ $\rightarrow$ measures the difference in intercepts
	- $\delta_{1}$ $\rightarrow$ measures the difference in return to education
- To apply OLS we must write the above equation with the explicit interaction terms: $$\log(wage)=\beta_0+\delta_0female+\beta_1educ+\delta_1female\cdot educ+u.$$
- **Interaction term interpretation**: $female\cdot educ$ is zero for any man in the sample and equal to the level of education for any woman in the sample.


## Testing for differences across groups

**Idea**:
We can use the introduction of multiple dummy variables and interaction terms for testing differences across groups for a particular phenomenon of interest

**Example**:
1. Take a simple model such as the one to describe the cumulative gpa:
  $$cumgpa=\beta_{0}+\beta_{1}sat+\beta_{2}hsperc+\beta_{3}tothrs+u$$
2. If we are interested in testing whether there is any difference between men and women, then we must allow a model where the intercept and all slopes can be different across the two groups: $$\begin{aligned}cumgpa&=\beta_{0}+\delta_{0}female+\beta_{1}sat+\delta_{1}female\cdot sat+\beta_{2}hsperc\\&+\delta_{2}female\cdot hsperc+\beta_{3}tothrs+\delta_{3}female\cdot tothrs+u\end{aligned}$$
3. If one of the $\delta_{j}$ is different from zero, then the model is different for men and women $\rightarrow$ we simply have to test: $$\mathrm{H}_{0}\colon\delta_{0}=0,\delta_{1}=0,\delta_{2}=0,\delta_{3}=0$$
>[!tip] Chow test when we have too many variables
>**Problem**:
>In a model with three variables, $sat$, $hsperc$, and $tothrs$, it is pretty simple to add all of the interactions to test for group differences. In some cases, many more explanatory variables are involved, and then it is convenient to have a different way to compute the statistic. 
>
>**Solution**:
>It turns out that the sum of squared residuals form of the F statistic can be computed easily even when many independent variables are involved. So:
>- we have a general model with:
>	- $k$ independent variables
>	- $g$ groups
>- we write an equation for each group $y=\beta_{g,0}+\beta_{g,1}x_{1}+\beta_{g,2}x_{2}+...+\beta_{g,k}x_{k}+u$
>- The hypothesis that each $\beta_{ij}$ is the same across the two groups involves $k + 1$ restrictions
>- Suppose $g=2$ $\rightarrow$ the sum of squared residuals from the unrestricted model can be obtained from two separate regressions, (one for each group) $\rightarrow$ $SSR_{1}, \, SSR_{2}$
>- $SSR_{ur} = SSR_{1}+SSR_{2}$
>- $SSR_{P}$ $\rightarrow$ restricted sum of squared residuals frompooling the groups and estimating a single equation
>- Finally we get the **Chow statistic**: $$F=\frac{[\mathrm{SSR}_{P}-(\mathrm{SSR}_{1}+\mathrm{SSR}_{2})]}{\mathrm{SSR}_{1}+\mathrm{SSR}_{2}}\cdotp\frac{[n-2(k+1)]}{k+1}$$
>  
