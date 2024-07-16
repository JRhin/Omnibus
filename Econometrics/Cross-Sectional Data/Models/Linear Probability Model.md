
#### Problem:
- We have seen a [[Multiple Regression Model]] when [[Qualitative Information]] is added in form of dummy independent variables. Now we use multiple regression to *explain* a qualitative event $\rightarrow$ we introduce a **Binary Dependent Variable**
- Consider a general regression model: $$y=\beta_0+\beta_1x_1+\beta_2x_2 + \dots + \beta_{k}x_{k} +u$$
- Because $y$ can take on only two values $\implies$ $\beta_{j}$ cannot be interpreted as the change in $y$ given a one-unit increase in $x_{j}$ holding all other factors fixed $\implies$ $y$ either changes from zero to one or from one to zero (or no change)

#### Idea:
1. If <mark style="background: #ADCCFFA6;">MRL.4</mark> from the [[Gauss-Markov Assumptions]] holds $\implies$ $\mathrm{E}(y|\mathbf{x})=\beta_{0}+\beta_{1}x_{1}+\ldots+\beta_{k}x_{k}$ $
2. $y \in \{0,1\}$ $\implies$ the probability of success is $\mathrm{P}(y=1|\mathbf{x})=\mathrm{E}(y|\mathbf{x})$
3. We can model the **response probability**: $$\mathrm{P}(y=1|\mathbf{x})=\beta_{0}+\beta_{1}x_{1}+\ldots+\beta_{k}x_{k},$$
4. Interpretation on $\beta_{j}$ $\rightarrow$ measures the change in the probability of success when $x_{j}$ changes, holding other factors fixed: $$\Delta\mathrm{P}(y=1|\mathbf{x})=\beta_j\Delta x_j$$
5. The predicted probability of success is: $$\hat{y}=\hat{\beta}_0+\hat{\beta}_1x_1+\ldots+\hat{\beta}_kx_k$$
>[!danger] Problem 1: probability bounds
>**Problem**:
>For certain combinations of values for the independent variables, we can get predictions either $<0$ or $>1$
>
>**Solution**:
>Predicted probabilities outside the unit interval are a little troubling when we want to make predictions (simply thresholding the predictions!)

>[!danger] Problem 2: linearity in the parameters
>**Problem**:
>Probability cannot be linearly related to the independent variables for all their possible values.
>For example: for the probability of working, it seems more realistic that the first small child would reduce the probability by a large amount, but subsequent children would have a smaller marginal effect!
>
>**Solution**:
>It usually works well for values of the independent variables that are near the averages in the sample.

>[!warning] Heteroskedasticity
>Due to the binary nature of $y$, the linear probability model does violate the [[Heteroskedasticity]] assumption from the [[Gauss-Markov Assumptions]] since:
>$$\mathrm{Var}(y|\mathbf{x})=p(\mathbf{x})[1-p(\mathbf{x})]$$
>
>$\implies$ remember that this does not cause bias in the OLS estimators!

>[!tip] Generalization to non-strictly-binary variables
>**Change in the coefficients interpretation**:
>In general remember the interpretation of OLS as estimating the effects of the $x_{j}$ on the expected (or average) value of $y$ $\rightarrow$ $\beta_{j}$ is the effect of a ceteris paribus increase of $x_{j}$ on the expected value of $y$
>
>**Point**:
>when $y$ is discrete (non-binary) the linear model does not always provide the best estimates of partial effects on $\mathbb{E}(y|x_{1},\dots,x_{k})$ $\implies$ we need more advanced models (e.g. **Poisson Model**).

