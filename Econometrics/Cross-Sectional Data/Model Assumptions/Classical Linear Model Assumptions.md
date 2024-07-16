1. **Linearity in parameters** <mark style="background: #CACFD9A6;">(MRL.1)</mark> 
   $y$ is related to $x_{1},\dots,x_{k}$ and $u$ (all *random variables*) as:
$$
y=\beta_0+\beta_1x_1+\beta_2x_2+...+\beta_kx_k+u
$$
2. **Random Sampling** <mark style="background: #CACFD9A6;">(MRL.2)</mark>
   considering $n$ random samples $\{(x_i,y_i): i = 1, 2, ..., n\}$ drawn from the above population model, we can write:
$$
y_i=\beta_0+\beta_1x_{i1}+\beta_2x_{i2}+...+\beta_kx_{ik}+u_i,\quad i=1,2,...,n
$$ 
3. **No Perfect Collinearity** <mark style="background: #CACFD9A6;">(MRL.3)</mark>
   In the sample none of the independent variables is constant, and there are no exact linear relationships among the independent variables i.e., no independent variable is an exact linear combination of the other independent variables (no **Perfect Collinearity**).
4. **Zero Conditional Mean** <mark style="background: #CACFD9A6;">(MRL.4)</mark>
    the error $u$ has an expected value of zero given any value of the explanatory variable, i.e. :
   $$
\mathbb{E}(u|x_{1},\dots,x_{k})=0.
$$
5. **Homoskedasticity** <mark style="background: #CACFD9A6;">(MRL.5)</mark>: error $u$ has the same variance given any value of the explanatory variable, i.e. :
$$
\mathrm{Var}(u|x_{1},\dots ,x_{k})=\sigma^2
$$
6. **Normality** <mark style="background: #ADCCFFA6;">(MRL.6)</mark>: error $u$ is *independent of the explanatory variables* $x_1, x_2, \ldots, x_k$ and is *normally distributed* with zero mean and variance $\sigma^2$, i.e.: 
$$u \sim \text{Normal}(0, \sigma^2)$$

>[!tip] Summing-up
>All of the above assumptions can be summarized in:
>$$y|\mathbf{x}\sim\mathrm{Normal}(\beta_0+\beta_1x_1+\beta_2x_2+...+\beta_kx_k,\sigma^2)$$
>![[Pasted image 20240707192009.png]]

>[!info]
>The CRL Assumptions are an extension of [[Gauss-Markov Assumptions]] to simplify some Inference Analysis on OLS Estimators.

>[!info] Why the normal distribution?
>Because $u$ is the sum of many different unobserved factors affecting $y$, we can invoke the [[Central Limit Theorem]] to conclude that $u$ has an *approximate normal distribution*.

>[!danger] Problems
>1. CRL assume that all unobserved factors affect $y$ in a separate, additive fashion. If $u$ is a complicated function of the unobserved factors, then the **CLT** argument does not really apply.
>2. If $y$ takes on just a few values it cannot have anything close to a normal distribution (cannot use Central Limit Theorem).

