#### Idea:
Random samples are drawn *at each time period*, pooling the resulting random samples gives us an independently pooled cross section i.e., [[Pooled Cross-Sectional Data]]. We thus fit the always same [[Multiple Regression Model]] on the pooled dataset adding the **year dummy variables**

#### Why?
We use independently pooled cross sections to *increase the sample size*
$\implies$ we can get more precise estimators and test statistics with more power.

>[!danger]
>Pooling is helpful $\iff$ the relationship between $y$ and at least some of the independent variables remains **constant over time**.

#### Setup:
1. To reflect the fact that a population may have different distributions in different time periods, we **allow the intercept to differ across periods** (usually years).
2. We accomplish this change in the intercept by **including year dummy variables** (for all the years but 1, to avoid [[Perfect Collinearity]])
3. We fit the MLR model on the pooled (vertically stacked) dataset having $k$ variables sampled over $t$ different periods (notice how we do not include the variable $\text{yr}_{1}$):
$$
y=\beta_0+\beta_1x_1+\beta_2x_2 + \dots + \beta_{k}x_{k} + \delta_{0}\text{yr}_{2}+ \dots+\delta_{t-1}\text{yr}_{t} +u
$$
4. Sometimes, the pattern of coefficients on the year dummy variables is itself of interest.

>[!note] More complex example
>We report a case of pooled MLR that is more complicated than the general case in order to play with some interpretations. 
>
Consider a $log(wage)$ equation pooled across the years 1978 and 1985: 
$$\begin{aligned}\log(wage)&=\beta_{0}+\delta_{0}y85+\beta_{1}educ+\delta_{1}y85\cdot educ+\beta_{2}exper\\&+\beta_{3}exper^{2}+\beta_{4}union+\beta_{5}female+\delta_{5}y85\cdot female+u\end{aligned}$$
> 
> Interpretations:
> - $\beta_{0}$ $\implies$ the intercept for 1978
> - $\beta_{0}+\delta_{0}$ $\implies$ the intercept for 1985
> - $\delta_{1}$ $\implies$ measures how return of another year of education is changed over 7 years
> - $\beta_{5}$ $\implies$ $log(wage)$ differential between men and women in 1978
> - $\beta_{5}+\delta_{5}$ $\implies$ $log(wage)$ differential between men and women in 1985
> - $\delta_{5}$ $\implies$ is related to gender differential comparison over the 7 years
> ... and so on...

#### In practice
Out of some important caution for the interpretation of the parameters, the **Pooled MLR** undergoes the same statistical properties we have seen for [[Multiple Regression Model]] and [[Linear Probability Model]].

The only news is in the use of the [[Chow Test]] (sort of [[F-test]]) to determine whether a *multiple regression function differs across two groups*.