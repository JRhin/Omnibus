---
tags: []
---
The LASSO problem  (Least Absolute Shrinkage Selection Operator) is one of the approximating problems for getting the sparsest solution for $y=Ax$ type of problems:

$$
\begin{gather}
\min ||Ax-y||^{2}_{2}\\
\text{s.t.}\quad ||x||_1\le\tau
\end{gather}
$$
Is the dual problem of [[Quadratically Constrained Basis Pursuit]].