
#### Idea

- The *availability* of instrumental variable can be used to estimate consistently the parameters in a [[Multiple Regression Model]]
- For example the **Instrument Exogeneity** and **Instrument Relevance** can be used to identify the parameter $\beta_{1}$ in a [[Simple Regression Model]] of the type:
$$
y = \beta_{0}+ \beta_{1} x_{1} + u
$$
- Here we report the correct procedure for the **Identification** of $\beta_{1}$, which consists in writing the parameter $\beta_{1}$ in terms of the *population moments*
#### Procedure

1. Define $z$ as an Instrumental Variable for $x_{1}$ in the above Simple Regression Equation
2. Use the properties of the covariance operator: $$Cov(z,y)=\beta_{1}Cov(z,x) + Cov(z,u)$$
3. By the **Instrument Exogeneity** condition $Cov(z,u)=0$, thus: $$\beta_{1}=\frac{Cov(z,y)}{Cov(z,x)}$$
4. Estimate the 2 above covariances by their sample analog
5. We finally get the so-called **[[Instrumental Variables]] Estimators**: $$\begin{align}\hat{\beta}_{1}&=\frac{\sum_{i=1}^n(z_{i}-\bar{z})(y_{i}-\bar{y})}{\sum_{i=1}^n(z_{i}-\bar{z})(x_{i}-\bar{x})} \\ \\ \hat{\beta}_{0}&=\bar{y}-\hat{\beta}_{1}\bar{x} \end{align}$$
