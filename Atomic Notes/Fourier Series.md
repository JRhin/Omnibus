---
tags: []
---
 The series of Fourier takes as input a periodic function.
## Real Signals
A real signal $x(t)$ defined in $[-\frac{T}{2},\frac{T}{2}]$, satisfying the Dirichlet conditions:
- $\int_{-\frac{T}2}^{\frac{T}2}|x(t)|dt<\infty$
- the number of discontinuities of $x(t)$ in the definition interval is finite
- the number of maximum and minimum points of $x(t)$ in the definition interval is finite
Can be expressed as:
$$
x(t)=a_0+\sum\limits_{n=1}^{\infty}a_n\cos\left(2\pi\frac{nt}{T}\right)+\sum\limits_{n=1}^{\infty}b_n\sin\left(2\pi\frac{nt}{T}\right)
$$
where $f_0 :=\frac1T$ is the fundamental frequency and:
$$
a_0=\frac1T\int_{-\frac{T}2}^{\frac{T}2}x(t)dt
$$
$$
\begin{align}
a_n &= \frac2T\int_{-\frac{T}2}^{\frac{T}2} x(t)\cos\left(2\pi\frac{nt}{T}\right)dt\\
&= \frac1{||\cos\left(2\pi\frac{nt}{T}\right)||^2}<x(t), \cos\left(2\pi\frac{nt}{T}\right)>
\end{align}
$$
$$
\begin{align}
b_n &= \frac2T\int_{-\frac{T}2}^{\frac{T}2} x(t)\sin\left(2\pi\frac{nt}{T}\right)dt\\
&= \frac1{||\sin\left(2\pi\frac{nt}{T}\right)||^2}<x(t), \sin\left(2\pi\frac{nt}{T}\right)>
\end{align}
$$
## Complex Signals
A complex signal $x(t)$ defined in $[-\frac{T}{2},\frac{T}{2}]$, satisfying the Dirichlet conditions:
- $\int_{-\frac{T}2}^{\frac{T}2}|x(t)|dt<\infty$
- the number of discontinuities of $x(t)$ in the definition interval is finite
- the number of maximum and minimum points of
- $x(t)$ in the definition interval is finite
Can be expressed as:
$$
x(t) =\sum\limits_{n=-\infty}^{\infty}X_ne^{j2\pi\frac{nt}{T}}
$$
where :
$$
X_n = \frac1T\int_{-\frac{T}2}^{\frac{T}2}x(t)e^{-j2\pi\frac{nt}{T}} dt
$$