---
title: Scaling
created: 2024-09-16
authors:
  - Engrima
tags:
  - Econometrics
  - Cross-Sectional_Data
  - Advanced_Relations
---
When variables are rescaled, the coefficients, standard errors, confidence intervals, t statistics, and F
statistics change in ways that preserve all measured effects and testing outcomes.

### Rescaling the dependent variable
If we multiply $y$ by $\frac{1}{c}$ in the [[Multiple Regression Model]]:
- all the OLS estimates will be automatically rescaled by $\frac{1}{c}$
- also the standard errors are rescaled by $\frac{1}{c}$ (same for the endpoints of CI)
- no effect on how statistically important the independent variables are
- $R^2$ is unchanged
- $SSR$ and $SER$ actually change in magnitude since the squared residuals are scaled by $\frac{1}{c^2}$

### Rescaling an independent variable
If we multiply by $\frac{1}{c}$ any variable $x_{j}$ in the [[Multiple Regression Model]]:
- $\beta_{j} \rightarrow c \cdot \beta_{j}$
- all the other independent variables and corresponding coefficients are unaffected
- all the statistics are the same

>[!tip] Rescaling when log forms
>- Given that that $log(c \cdot y_{i}) = log(c) + log(y_{i})$ for any constant $c>0$ 
>  $\implies$ we get a new intercept $\log(c)+ \beta_{0}$
>- Also the log form of a scaled indep. variable only affects the intercept


