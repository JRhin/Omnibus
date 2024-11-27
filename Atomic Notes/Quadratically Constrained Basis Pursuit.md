---
tags: []
---
The Quadratically Constrained Basic Pursuit problem  is one of the approximating problems for getting the sparsest solution for $y=Ax$ type of problems:
$$
\begin{gather}
\min ||x||_1\\
\text{s.t.}\quad ||Ax-y||_2\le\eta
\end{gather}
$$
It's a particular reformulation of the [[Basis Pursuit]] and the dual problem of [[LASSO]].