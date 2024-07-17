#### Endogenous Variable
An endogenous variable is a variable in a statistical model that is changed or determined by its relationship with other variables within the model:
- $\implies$ it correlates with other factor within the system being studied 
- $\implies$ usually in [[Multiple Regression Model]]s this is characterized by the **correlation with the error term in the regression model** (obv. the dependent variable $y$ is endogenous by definition)

#### Exogenous Variable
Endogenous variables are the opposite of exogenous variables, which are independent variables or outside forces. However, exogenous variables can have an impact on endogenous factors.

#### Possible Causes of Endogeneity
- **Simultaneity** $\implies$ the dependent variable affects one of the independent variables.
- **Measurement Error** $\implies$ there is error in measuring one of the variables.
- **Omitted Variable Bias** $\implies$ an important variable that influences both the independent variable and the dependent variable is left out of the model.

#### Omitted Variable Bias
Omitted variable bias occurs when a model **leaves out one or more relevant variables**. This omission can lead to biased and inconsistent [[Ordinary Least Squares]] Estimates of the coefficients in the regression model. 

Specifically, omitted variable bias arises when:

1. The omitted variable is a **determinant** of the dependent variable.
2. The omitted variable is **correlated with one or more of the included independent variables**.

>[!info]
>This second point is the one we analyzed when studying the Omitted Variable Bias in the [[Bias-Variance Trade-off]] section, where the bias was practically determined by the correlation between the omitted variable and one of the independent variables in the regression equation!

**Roadmap of Omitted Variables Problem**:
1. We can derive the Omitted Variable Bias on the OLS estimators
2. With omitted variables the OLS generally will be **inconsistent**
3. Omitted Variable Bias can be mitigated/eliminated by either:
	-  including the relevant variables we omitted or other **control variables**
	  $\implies$ practically very difficult
	- using suitable [[Proxy Variables]]
	  $\implies$ not always possible to find good proxy variables
	- using [[Panel Data]] Models to eliminate the effect of *time-constant omitted variables*
	  $\implies$ they do not solve the problem when the omitted variables are *time-varying*
	  $\implies$ not always we can collect panel data
	- using **[[Instrumental Variables]] (IV)** or **[[Two-Stage Least Squares]] (2SLS)**
