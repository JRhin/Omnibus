---
tags: []
---
An undirected graph to be considered a Markov Random Field has to satisfy three properties called the **Markov Properties**:
1. Pairwise Markov Property.
2. Local Markov Property.
3. Global Markov Property.
## Pairwise Markov Property
If two nodes $u$ and $v$ are not connected in a graph $G$ than:
$$
X_u \perp\mkern-10mu\perp X_v |X_{V/\{u,v\}}
$$
## Local Markov Property
$$
X_u \perp\mkern-10mu\perp X_{V/N(u)} | X_{N(u)}
$$
## Global Markov Property
Given two disjoint subset of V, $A$ and $B$, then if we call the separating set as $S$ we have that:
$$
X_A \perp\mkern-10mu\perp X_B|X_S
$$
with:
$$
\begin{gather}
A\subset V\\
B\subset V\\
A\cap B = \emptyset\\
S=V/\{A,B\}
\end{gather}
$$
## Markov Random Fields and Gibbs distribution
We define the joint probability distribution as:
$$
p_X(x)=\frac1Z \prod_{c\in C}\Phi_c(x_c)
$$
where $C$ is the set of cliques.
If the product is positive for any $x$, by introducing the function $V_c(x_c):=-\log\phi_c(x_c)$, the pdf can be written in exponential form:
$$
p_X(x)=\frac1Z\exp\left\{-\sum_{c\in C}V_c(x_c)\right\}
$$
which is known in physics as the Gibbs distribution with interaction potential $V_c(x_c)$ and energy $U_X(x)=\sum\limits_{c\in C}V_c(x_c)$.