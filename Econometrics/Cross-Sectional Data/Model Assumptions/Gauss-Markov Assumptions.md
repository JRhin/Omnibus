---
title: Gauss-Markov Assumptions
created: 2024-09-16
authors:
  - Engrima
tags:
  - Econometrics
  - Cross-Sectional_Data
  - Model_Assumptions
---
1. **Linearity in parameters** <mark style="background: #CACFD9A6;">(MLR.1)</mark> 
   $y$ is related to $x_{1},\dots,x_{k}$ and $u$ (all *random variables*) as:
$$
y=\beta_0+\beta_1x_1+\beta_2x_2+...+\beta_kx_k+u
$$
2. **Random Sampling** <mark style="background: #CACFD9A6;">(MLR.2)</mark>
   considering $n$ random samples $\{(x_i,y_i): i = 1, 2, ..., n\}$ drawn from the above population model, we can write:
$$
y_i=\beta_0+\beta_1x_{i1}+\beta_2x_{i2}+...+\beta_kx_{ik}+u_i,\quad i=1,2,...,n
$$ 
3. **No Perfect Collinearity** <mark style="background: #CACFD9A6;">(MLR.3)</mark>
   In the sample none of the independent variables is constant, and there are no exact linear relationships among the independent variables i.e., no independent variable is an exact linear combination of the other independent variables (no **Perfect Collinearity**).
4. **Zero Conditional Mean** <mark style="background: #CACFD9A6;">(MLR.4)</mark>
    the error $u$ has an expected value of zero given any value of the explanatory variable, i.e. :
   $$
\mathbb{E}(u|x_{1},\dots,x_{k})=0.
$$
5. **Homoskedasticity** <mark style="background: #CACFD9A6;">(MLR.5)</mark>: error u has the same variance given any value of the explanatory variable, i.e. :
$$
\mathrm{Var}(u|x_{1},\dots ,x_{k})=\sigma^2
$$