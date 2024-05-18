---
tags: []
---
The Fourier transform takes as input all types of function (not only periodic).

Sufficient condition for the existence of the FT is:
$$
\int_{-\infty}^{\infty}|x(t)|dt<\infty
$$
The Fourier Transform of a signal $x(t)$ defined for $t\in\left(-\infty,\infty\right)$, is:
$$
X(f)=\int_{-\infty}^{\infty}x(t)e^{-j2\pi ft}dt
$$
The inverse Fourier Transform is:
$$
x(t)=\int_{-\infty}^{\infty}X(f)e^{j2\pi ft}dt
$$
## From Fourier Series to Fourier Transform
We want to stretch the domain $[-\frac{T}{2},\frac{T}{2}]$ over which the [[Fourier Series]]  is defined to infinite $T \to \infty$,.
So from FS:

$$
X_n = \frac1T\int_{-\frac{T}2}^{\frac{T}2}x(t)e^{-j2\pi\frac{nt}{T}} dt
$$
we set $\omega_n = \frac{2\pi n}T=\Delta \omega n$.

$$
X_n = \frac{\Delta \omega}{2\pi}\int_{-\frac{\pi}{\Delta \omega}}^{\frac{\pi}{\Delta \omega}}x(t)e^{-j\Delta \omega nt}dt
$$
$$
\begin{align}
\mathcal{F}^{-1}(x(t)) &= \lim_{\Delta \omega\to0} \sum_{n=-\infty}^{\infty}\left(\frac{\Delta \omega}{2\pi}\int_{-\frac{\pi}{\Delta \omega}}^{\frac{\pi}{\Delta \omega}}x(t)e^{-j\Delta \omega nt}dt\right)e^{j\Delta \omega n t}\\
&=\frac{1}{2\pi}\int_{-\infty}^{\infty}\left(\int_{-\infty}^{\infty}x(t)e^{-j \omega t}dt\right)e^{j \omega t}d\omega\\
&= \frac{1}{2\pi}\int_{-\infty}^{\infty}\mathcal{F}(x(t))e^{j\omega t}d\omega
\end{align}
$$
Inside the parenthesis there is the definition of $\mathcal{F}(\cdot)$ .
## Convolution integrals
Defining the convolution of two functions as:
$$
(f*g) = \int_{-\infty}^{\infty}f(x-\xi)g(\xi)d\xi
$$
We want to show that:
$$
\mathcal{F}(f*g)=\mathcal{F}(f)\cdot \mathcal{F}(g) = \hat{f}\hat{g}
$$
$$
\mathcal{F}^{-1}(\hat{f}\hat{g})=\frac1{2\pi}\int_{-\infty}^{\infty}\hat{f}(\omega)\hat{g}(\omega)e^{j\omega x}d\omega
$$
Where $\omega=2\pi f$ and $j=\sqrt{-1}$.

Proof:
$$
\begin{aligned}
\mathcal{F}^{-1}(\hat{f}\hat{g}) &= \frac1{2\pi}\int_{-\infty}^{\infty}\hat{f}(\omega)\hat{g}(\omega)e^{j\omega x}d\omega\\
&= \frac1{2\pi}\int_{-\infty}^{\infty}\hat{f}(\omega)\left(\int_{-\infty}^{\infty}g(\xi)e^{-j\omega\xi}d\xi\right)e^{j\omega x}d\omega\\
&=\frac1{2\pi}\int_{-\infty}^{\infty}\int_{-\infty}^{\infty}\hat{f}(\omega)g(\xi)e^{j\omega(x-\xi)}d\omega d\xi\\
&=\int_{-\infty}^{\infty}g(\xi)\frac1{2\pi}\left(\int_{-\infty}^{\infty}\hat{f}(\omega)e^{j\omega(x-\xi)}d\omega\right)d\xi\\
&=\int_{-\infty}^{\infty}g(\xi)f(x-\xi)d\xi
\end{aligned}
$$
