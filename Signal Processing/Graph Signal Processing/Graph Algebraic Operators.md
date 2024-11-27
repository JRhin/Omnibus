---
title: Graph Algebraic Operators
created: 2024-11-25
authors:
  - Engrima
tags:
  - Graph_Signal_Processing
  - Signal_Processing
---
Consider a [[Graph]] $\mathcal{G(V,E)}$, where:
- $V=|\mathcal{V|}$ $\implies$ number of nodes
- $E = |\mathcal{E}|$ $\implies$ number of edges

A graph structure can be fully represented by its corresponding algebraic operators. 
In practice each algebraic operator consists of a matrix encoding information about the graph itself, e.g.:
- adjacency (node-node) relation $\implies$ adjacency matrix
- boundary/incidence (node-edge) relation $\implies$ incidence matrix

### Adjacency Matrix

Is the matrix $A \in \mathbb{R}^{V \times V}$ that encodes the adjacency relations between the nodes of a graph, i.e.:
$$
A[i,j] = a_{ij}=
    \begin{cases} 
        1 \space\space\space &,(i,j) \in \mathcal{E} \\
        0 &, \textit{othw}
    \end{cases}
$$
**Properties**:
- $A^k[i,j]$ $\implies$ number of paths of length $k$ from node $i$ to node $j$
- $A^k[i,i]$ $\implies$ number of loops of length $k$ on node $i$
- $\operatorname{Tr}(A^k)$ $\implies$ number of loops of length $k$ in the whole graph
- $\frac{\operatorname{Tr}(A^3)}{6}$ $\implies$ number of triangles in the graph
- $d_i=\sum_j A[i,j]$ $\implies$ degree of node $i$

>[!danger] Weighted Adjacency Matrix
>If the graph is a **weighted graph**, i.e. a weight $w_{ij}$ is assigned to each edge $(i,j) \in \mathcal{E}$, we can define the **Weighted Adjacency Matrix** as $W \in \mathbb{R}^{V \times V}$ s.t.: 
>$$ W[i,j] = \begin{cases} w_{ij} \space\space\space &,(i,j) \in \mathcal{E} \\ 0 &, \textit{othw} \end{cases} $$

### Degree Matrix

The **degree** of a node $i$ is the number of edges with an end in $i$.

>[!danger] Node degree for directed graphs
>In directed graphs we have to differentiate between:
>- **indegree** $\implies$ number of edges having $i$ as head
>- **outdegree** $\implies$ number of edges having $i$ as tail

Is the diagonal matrix $D=\operatorname{diag}(d_{1},\dots, d_{V}) \in \mathbb{R}^{V \times V}$ indicating the degree of each node in the graph, i.e.:
$$
d_i=\sum_j a_{ij} \quad \forall i \in \mathcal{V}
$$
### Incidence Matrix

Is the matrix $\mathbf{B} \in \mathbb{R}^{V \times E}$ relating the nodes and the edges of a graph.
- For directed graphs (*oriented incidence matrix*):
$$
\mathbf{B}[i,j] = b_{i,j} = \begin{cases}
1 \;, \text{node} \; i \; \text{is the tail of edge} \; (i,j) \\
-1 \;, \text{node} \; i \; \text{is the head of edge} \; (i,j)  \\
0 \;, \text{otherwise}
\end{cases}
$$
$$

$$
- For undirected graphs:  
$$
\mathbf{B}[i,j] = b_{i,j} = \begin{cases}
1 \;, \text{if} \; (i,j) \in \mathcal{E}\\
0 \;, \text{otherwise}
\end{cases}
$$

### Laplacian Matrix

Is the matrix $\mathbf{L} \in \mathbb{R}^{V \times V}$ given by:
$$
\mathbf{L}[i,j] = \begin{cases}
\operatorname{d_{i}} \;, \text{if} \; i=j \\
-1 \;, \text{if} \; i\neq j \\
0 \;, \text{otherwise}
\end{cases}
$$
In other words:
$$
\mathbf{L} = D -A
$$
or also:
$$
\mathbf{L=BB^T}
$$
**Properties**:
The main properties of the Laplacian matrix are very important for a number of tasks in Graph Signal Processing, i.e. when dealing with [[Graph Signal]].
1. $\mathbf{L}$ is **symmetric** and **semi-definite** (**when the graph is undirected!**)
2. The smallest eigenvalue of $\mathbf{L}$ is $\lambda_{1}=0$ with corresponding eigenvector $\underline{1} \in \mathbb{R}^V$
3. $\mathbf{L}$ has eigenvalues $\lambda_{1} \leq \lambda_{2} \leq \dots \leq \lambda_{V}$
4. If $\mathcal{G}$ is a weighted undirected graph s.t. $w_{ij} \in \mathbb{R_{+}}$, then the multiplicity of the smallest eigenvector $\lambda_{1}$, is $\mu_{1}=k$, and represents the number of connected components of the graph $\mathcal{G}$
	1. $\implies$ $\operatorname{Rank(\mathbf{L})=V-k}$
	2. $\implies$ given the k connected components $A_{1},\dots, A_{k}$, the eigenspace of $\lambda_{1}$ is spanned by the connected components indicator vectors $\mathbb{I}_{A_{1}},\dots,\mathbb{I}_{A_{k}}$

>[!info] Laplacian for Disagreement computation
>The Laplacian matrix, thanks to its just mentioned properties, is a great tool to perform [[Spectral Clustering]], [[Graph Fourier Transform]] and to build [[Graph FIlter]]s. In particular it can be used to evaluate the so-called **Disagreement** of a graph signal $\mathbf{x} \in \mathbb{R}^V$, i.e.: $$ \mathbf{x^{T}Lx}= \frac{1}{2} \sum_{i,j} a_{ij}(x_{i}-x_{j})^2$$

