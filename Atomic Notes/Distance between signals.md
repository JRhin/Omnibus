---
tags: []
---
Given two signals in continuous time with:

- Domain: $t\in\left(-\frac{T}2, \frac{T}2\right]$
- $<x,y>:=\int_{-\frac{T}2}^{\frac{T}2} x^*(t)y(t)dt$
- Finite [[Energy of a signal|energy]]: $\mathcal{E}_x=||x||^2<\infty$

Their distance is defined as:
$$
\begin{align}
d(x,y):&= <x-y,x-y>\\
&= ||x-y||^2\\
&=\int_{-\frac{T}2}^{\frac{T}2}|x(t)-y(t)|^2dt\\
&=||x||^2+||y||^2-2\mathfrak{R}\{<x,y>\}
\end{align}
$$