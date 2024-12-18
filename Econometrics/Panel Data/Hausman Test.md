---
title: Hausman Test
created: 2024-09-16
authors:
  - Engrima
tags:
  - Econometrics
  - Panel_Data
---
- It is used to compare the [[Average Differencing Fixed Effect Model]] (or simply Fixed Effect Model) with the [[Random Effect Model]]
- The null hypothesis is: $$H_{0}:\; \mathrm{Cov}(x_{itj},a_{i})=0,\quad t=1,2,...,T;j=1,2,...,k$$
- A failure to reject $H_{0}$ means:
	- either that the RE and FE estimates are sufficiently close so that it does not matter which is used
	- or the sampling variation is so large in the FE estimates that one cannot conclude practically significant differences are statistically significant
- Generally a rejection of the Hausman test $\implies$ the key assumption of RE is not valid $\implies$ is better to use FE
