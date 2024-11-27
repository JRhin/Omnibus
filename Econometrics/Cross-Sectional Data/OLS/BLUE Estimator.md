---
title: BLUE Estimator
created: 2024-09-16
authors:
  - Engrima
tags:
  - Econometrics
  - Cross-Sectional_Data
  - OLS
---
BLUE is the acronym of **Best Linear Unbiased Estimator**

#### Estimator
It a rule that can be applied to any sample of data to produce an estimate of a certain statistic.

#### Unbiased
An estimator such that its mean is exactly equal to the statistic it want to estimate, i.e.:
$$
\mathbb{E}(\tilde{\beta}_{j})=\beta_{j}
$$

#### Linear
If it can be expressed as a linear function of the data on the dependent variable, i.e.:
$$
\tilde{\beta}_j=\sum_{i=1}^nw_{ij}y_i
$$

#### Best
According to the Gauss-Markov Theorem, the best estimator is the estimator with *smallest variance* among all the estimators that are **linear** and **unbiased**.

### Gauss-Markov Theorem

Under Assumptions [[Gauss-Markov Assumptions]], $\hat{\beta}_0, \hat{\beta}_1, \ldots, \hat{\beta}_k$ are the **best linear unbiased estimators** (BLUEs) of $\beta_0, \beta_1, \ldots, \beta_k$, respectively.