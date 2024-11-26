---
title: Logarithmic form
created: 2024-09-16
authors:
  - Engrima
tags:
  - Econometrics
  - Cross-Sectional_Data
  - Advanced_Relations
---
**Problem**:
- The change in the interpretation when having the dependent variable in log form is generally given by the percentage change
- We provide a more exact interpretation

**Example**:
- Consider: $$\widehat{\log(y)}=\hat{\beta}_0+\hat{\beta}_1\mathrm{log}(x_1)+\hat{\beta}_2x_2$$
- We can get exact percentage change in the predicted $y$ by: $$\begin{align}
\Delta\widehat{\log(y)}&=\hat{\beta}_{2}\Delta x_{2} \\ \\
\implies \%\Delta\hat{y}&=100\cdot[\exp(\hat{\beta}_{2}\Delta x_{2})-1] \\ \\
\implies \%\Delta\hat{y}&=100\cdot[\exp(\hat{\beta}_2)-1], \quad\text{when} \; \Delta x_{2}=1
\end{align}$$
- **Notice**: this adjustment is not as crucial for small percentage changes!

#### Advantages of the log form
1. Logs leads to coefficients with appealing interpretations $\rightarrow$ e.g. elasticity
2. We can be ignorant about the units of measurement of variables appearing in logarithmic form because the slope coefficients are invariant to rescalings
3. When $y > 0$, models using $log(y)$ often satisfy the [[Classical Linear Model Assumptions]] more closely than models using the level of y.
   **Motivation**: Strictly positive variables often have conditional distributions that are *heteroskedastic* or *skewed* $\implies$ the log can mitigate, if not eliminate, both problems.
4. Log of a variable often narrows its range $\implies$ OLS estimates less sensitive to outliers

#### Use of the log in practice
1. When a variable is a positive dollar amount, the log is often taken
2. Variables such as population, total number of employees, and school enrollment (large integer values) often appear in logarithmic form
3. Variables that are measured in years usually appear in level form (no log)
4. Proportions or a percentages can appear in either original or logarithmic form (tendency to the level form to avoid the log of zero)
5. Log cannot be used if a variable takes on **zero** or **negative** values
6. In cases where a variable $y\geq_{0}$ but can take on the value $0$ $\implies$ $log(1+y)$ is sometimes used.