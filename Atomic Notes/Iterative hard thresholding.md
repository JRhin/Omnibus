---
tags: []
---
Initialization:
$$
x_0=0
$$
Repeat until a stopping criterion is met:
$$
x_{n+1}=\mathcal{H}_s(x_n+A^T(y-Ax_n))
$$
Output:
$$
x^\#=x_{n+1}
$$
## The main idea
$$
\begin{gather}
Ax=y\\
A^TAx=A^Ty\\
x-x+A^TAx=A^Ty\\
x-(I-A^TA)x=A^Ty\\
x=(I-A^TA)x+A^Ty\\
\Downarrow\\
x_{n+1}=(I-A^TA)x_n+ATy\\
x_{n+1}=x_n+A^T(y-Ax_n)
\end{gather}
$$