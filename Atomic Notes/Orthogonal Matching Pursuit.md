---
tags: []
---
Initialization:
$$
\begin{gather}
S^0=\emptyset\\
x^0=0
\end{gather}
$$
Repeat until a stopping criterion is met:
$$
\begin{gather}
j_{n+1}:=\arg\max\{|(A^H(y-Ax_n))_j|\}\\
S_{n+1}=S_n\cup\{j_{n+1}\}\\
x_{n+1}:=\arg\min_z\{||y-Ax||_2,\sup(z)\subset S_{n+1}\}
\end{gather}
$$
Output:
$$
x^\#=x^{n+1}
$$