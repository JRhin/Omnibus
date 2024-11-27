**Problem**:
- Sometimes the partial effect (or elasticity/semi-elasticity) of the dependent variable $y$ w.r.t. an explanatory variable $x_{i}$, depends (also) on the magnitude of another variable $x_{j}$. 
- At this point we would need some coefficient to catch dependence of $y$ from $x_{i}, x_{j}$ **at the same time** $\implies$ we introduce a new variable $x_{k}=x_{i}\cdot x_{j}$ intro our linear model
- If the variables $x_{i}$ and $x_{k}$ are two categorical variables representing come [[Qualitative Information]], an interaction term $x_{k}=x_{i}\cdot x_{j}$ enables the model to distinguish between:
	- which effect has $x_{i}$ on $y$ if not joined with $x_{k}$
	- which effect has $x_{i}$ on $y$ when joined with $x_{k}$

**Example**:
- Consider the model:
$$
price=\beta_0+\beta_1sqrft+\beta_2bdrms+\beta_3sqrft\cdot bdrms+\beta_4bthrms+u
$$
- the partial effect of the number of bedrooms ($bdrms$) on $price$, is given by a more complicated factor $\implies$ we have to look at all the "coefficients" of the variables derived from $bdrms$, i.e.:
$$
\frac{\Delta price}{\Delta bdrms}=\beta_2+\beta_3sqrft
$$
- the coefficient $\beta_{3}$ measures how an additional bedroom ($bdrms$) ==affects the effect== of $sqrft$ on $price$ (or also how $sqrft$ affect the effect of $bdrms$ on $price$)
- the coefficient $\beta_{2}$ has a different interpretation if compared with the model without the interaction therm:
	- **WITHOUT interaction term** $\implies$ $\beta_{2}$ measures the effect of $bdrms$ on $price$
	- **WITH interaction term** $\implies$ $\beta_{2}$ measures the effect of $bdrms$ on $price$ when $sqrft=0$!

### Reparameterization with Interaction Terms

**Problem**:
- ==From the above example== you can notice that quite often (mostly with non-categorical variables), the parameters $\beta_{i}, \beta_{j}$ of the original variables $x_{i}, x_{j}$ are practically of poor interest when introducing the interaction term $x_{i} \cdot x_{j}$
- For instance we have that $\beta_{2}$ is the partial effect of $x_{2}$ on $y$ when $x_{1}=0$, in the following model:
$$
y=\beta_0+\beta_1x_1+\beta_2x_2+\beta_3x_1x_2+u
$$

**Solution**:
- We can solve this interpretation problem and make the coefficient of $x_{2}$ useful again!
- We can do data by reparametrizing the model with the interaction term
- The previous model assumes the following form:
$$
y=\alpha_{0}+ \delta_{1}x_{1} + \delta_{2}x_{2} + \beta_{3}(x_{1} - \mu_{1})(x_{2} - \mu_{2}) + u
$$
- Where:
	- $\mu_{1}$ $\implies$ population mean of $x_{1}$
	- $\mu_{2}$ $\implies$ population mean of $x_{2}$
- Now the coefficient $\delta_{2}=\beta_{2} + \beta_{3}\mu_{1}$ can be interpreted as the partial effect of $x_{2}$ on $y$ when $x_{1}=\mu_{1}$!

