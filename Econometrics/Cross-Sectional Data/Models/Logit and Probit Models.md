
**Setup**:
We have a dependent variable that is constrained in its domain (e.g. a binary or discrete vraible) and we need to model a probability (e.g. of success) related to this variable.

**Problem**:
The [[Linear Probability Model]] is an example of model which is able to leverage the relations with discrete dependent variables. This LPM models are actually linear in the parameters and eventually we need some more flexibility in describing the casual effect of the considered independent variables on $y$ $\iff$ we may want to generalize our setup to **non-constant** partial effects of the explanatory variables.

**Solution**:
- For instance, with binary dependent variables ($y$) w can use more sophisticated **binary response models** i.e., where the interest is in modeling the **response probability**: $$P(y=1|x)=P(y|x_{1},..,x_{k})$$
- We expand the assumption of linearity in the parameters by imposing a general $G(z)$ ($0<G(z)<1$): $$\mathrm{P}(y=1|\mathbf{x})=G(\beta_0+\beta_1x_1+...+\beta_kx_k)=G(\beta_0+\mathbf{x}\boldsymbol{\beta}),$$
- We thus differentiate the:
	- Logit model: $$$$