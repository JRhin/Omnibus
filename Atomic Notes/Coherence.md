---
tags: []
---
The general definition of coherence takes into account a $A\in\mathbb{C}^{m\times N}$ with $l_2$-normalized columns $a_1,\dots,a_N$. The coherence $\mu(A)$ is defined as:
$$
\mu(A):=\max_{1\le i\ne j\le N}|<a_i,a_j>|
$$
## The $l_1$-coherence
$$
\mu_1(S):=\max_{i\in[N]}\max_S\left\{\sum_{j\in S}|<a_i,a_j>|, S\subset[N],\#(S) = s, i\notin S\right\}
$$
If
$$
\mu<\frac{1}{2s-1}
$$
then
$$
\mu_1(s)+\mu_1(s-1)<1
$$
From the constrain on $\mu$:
$$
m>Cs^2
$$
## Theorem
Given a matrix $A\in\mathbb{C}^{m\times N}$ with $l_2$-normalized columns $a_1,\dots,a_N$, if:
$$
\mu_1(s)+\mu_1(s-1)<1
$$
Then every s-sparse vector $x$ is exactly recovered from the measurement vector $y=Ax$ via [[Basis Pursuit]] or after at most s iterations of [[Orthogonal Matching Pursuit]].

>Note: The results holds if $\mu<\frac{1}{2s-1}$