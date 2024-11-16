A GNN, or better, a **Multiple-output multiple-input (MIMO) GNN**, generalizes the idea of [[Deep Learning/Graph Models/Graph Perceptron|Graph Perceptron]] by:
1. stacking $L$ different [[Graph Perceptron]] layers
2. each [[Graph Signal]] observation is given by a matric $\mathbf{X}\in \mathbb{R}^{V \times F}$, where:
	- $V$ is the number of nodes of the graph on which data is defined
	- $F$ is the number of features at each node (now we have vectors, no more single values, for each node in the graph)

![[Pasted image 20241116225857.png]]

Thus, for an $L$-layer MIMO GNN we get that:
$$
\begin{cases}
\mathbf{Z_{1}}= \sum_{k=0}^K S^k \mathbf{X}H_{k}^1 \\
\mathbf{X_{1}}=\sigma_{1}(\mathbf{Z}) \\
\vdots \\
\mathbf{Z}_{l}= \sum_{k=0}^K S^k \mathbf{X}_{l-1}H_{k}^l \\
\mathbf{X}_{l}=\sigma_{l}(\mathbf{Z}_{l}) \\ \\
\vdots \\
\mathbf{Z}_{L}= \sum_{k=0}^K S^k \mathbf{X}_{L-1}H_{k}^l \\
\mathbf{X}_{L}=\sigma_{L}(\mathbf{Z}_{L}) \\
\end{cases}
$$
where $\forall l=1,\dots,L$:
- $\mathbf{Z}_{l}\in \mathbb{R}^{V \times G_{l}}$, $l = 1,\dots,L$ $\rightarrow$ the $l$-th layer activations
- $H_{k}^l \in \mathbb{R}^{G_{l-1} \times G_{l-1}}$ for $k=0,\dots,K$ $\rightarrow$ the $l$-th layer parameters
- $\sigma_{l}(\cdot)$ $\rightarrow$ the $l$-th layer element-wise activation function
- $G_{l}$ $\rightarrow$ the $l$-th layer feature dimensionality (e.g. $G_{0}=V$, $G_{1}=F$)

>[!danger] GNN as a generalization of MLP
>the introduced MIMO GNN can be reduced to a simple [[Multilayer Perceptron]] if:
>1. we set the filter order $K=1$ for each layer
>2. we don't use any prior knowledge to restrict the class of functions $\mathcal{C}$ and simply set $S=\mathbf{I}$
