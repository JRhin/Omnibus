---
tags: []
---
A Graph Convolutional Filter is defined by:
- A [[Atomic Notes/Graph Shift Operator]] $S$.
- A series of coefficients $h_k$.
Mathematically it's a polynomial (series) on $S$:
$$
H(S)=\sum_{k=0}^\infty h_k S^k
$$
The result of applying the $H(S)$ filter to the signal $x$ is:
$$
y=H(S)x=\sum_{k=0}^\infty h_k S^k x
$$
In practice we stop the summation to a large $K$:
$$
y=\sum_{k=0}^K h_k S^k x
$$
## Frequency Response
Consider a graph filter $h=\{h_k\}^K_{k=0}$, a graph signal $x$ and the filtered signal $y=\sum_{k=0}^K h_k S^k x$.
The [[Graph Fourier Transform|GFTs]] $\tilde{y}=U^Hy$ and $\tilde{x}=U^Hx$ are related by:
$$
\tilde{y}=\sum_{k=0}^K h_k \Lambda^k\tilde{x}
$$
Being $\Lambda$ a diagonal matrix:
$$
\tilde{y}_i = \sum^K_{k=0}h_k\lambda^k \tilde{x}_i = \tilde{h}(\lambda_i)\tilde{x}_i
$$
So the **frequency response of a graph convolutional filter** is:
$$
\tilde{h}(\lambda)=\sum^K_{k=0}h_k\lambda^k
$$
### Proof
Considering $S^k=U\Lambda^kU^H$:
$$
\tilde{y}=U^Hy=U^H\sum^K_{k=0}h_kS^kx=\sum^K_{k=0}h_kU^HU\Lambda^kU^Hx
$$
But $U^HU=I$ and $U^Hx=\tilde{x}$:
$$
\tilde{y}=\sum^K_{k=0}h_k\Lambda^k\tilde{x}
$$
## Graph Filter Design
We have a desired graph frequency response obtained by a [[Atomic Notes/Graph Filter]] $\sigma$ for which we would like that:
$$
\tilde{h}(\lambda_i)\simeq \sigma_i \qquad i=1,\dots,N
$$
We can apply the least-squares criterion:
$$
\begin{align}
h^*&=\arg\min_h||\sigma-\Phi h||^2\\
&=\Phi^+ \sigma
\end{align}
$$
Where $\Phi^+$ is the [[Pseudo Inverse|pseudo inverse ]] of $\Phi$ and $\Phi$ is the Vandermonde Matrix:
$$
\Phi =
\begin{bmatrix}
1 & \lambda_1 & \lambda_1^2 & \dots & \lambda_1^K\\
1 & \lambda_2 & \lambda_2^2 & \dots & \lambda_2^K\\
\vdots & \vdots & \vdots & \ddots & \vdots\\
1 & \lambda_N & \lambda_N^2 & \dots & \lambda_N^K\\
\end{bmatrix}
$$
**Note**: $N>k+1$.