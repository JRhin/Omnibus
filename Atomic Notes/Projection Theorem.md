---
tags: []
---
Given a vector $x(t)\in \mathcal{S}_N := \text{span}(u_0(t),\dots,u_{N-1}(t))$ and an orthonormal basis $\{u_o,\dots,u_{N-1}\}$, the best approximation of $x$ within the subspace spanned by the basis $\{u_0,\dots,u_{N-1}\}$ is the vector:  
  
$$\hat{x}_N := \sum\limits_{k=0}^{N-1}<u_k,x>u_k$$  
  
$\hat{x_N}$ is the vector that minimizes the square error $||x-\hat{x}_N||^2$ and yields an approximation error of:  
  
$$
e_N := x-\hat{x}_N \perp \mathcal{S}_N
$$