
The GSO is linear map $S:\mathbb{R}^V\rightarrow \mathbb{R}^V$, that causes the shift of the [[Graph Signal]] $\mathbf{x}\in \mathbb{R}^V$, i.e. the signal diffuses over the nodes of the graph according to the diffusion operator $S$.
The operator itself, $S \in R^{V \times V}$, indeed represents the structure of the related [[Graph]] and is such that:
$$
S[i,j]=0 \iff (i,j) \not\in \mathcal{E}, i \neq j
$$
The value of the shifted signal at node $i$ is given by:
$$
[S\mathbf{x}]_{i}= \sum_{j=1}^V S[i,j]\mathbf{x}=\sum_{j \in \{\mathcal{N_{i}}\cup i\}} S[i,j] \mathbf{x}
$$
>[!info] Examples:
>- Choosing the Adjacency matrix $A$ as GSO $\implies$ $A\mathbf{x}$ $\implies$ one-step propagation
>- Choosing the Laplacian matrix $\mathbf{L}$ as GSO $\implies$ $L\mathbf{x}$ $\implies$ the shifted signal is the result of a difference with the values of the signal at neighbouring nodes

