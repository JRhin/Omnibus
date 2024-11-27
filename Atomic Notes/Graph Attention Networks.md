---
tags: []
---
Graph Attention networks (GAT) are trainable neural architectures that learn filter coefficients and graph weights in a joint and task-oriented fashion.

The Order 1 GAT is defined as:
$$
x_i=\sigma\left(\sum_{j\in\mathcal{N}_i}\alpha_{ij}Wx_j\right)
$$
Where $\alpha_{ij}$ is the [[Softmax|softmax]] of $e_{ij}$:
$$
\alpha_{ij}=\text{softmax}_j(e_{ij})=\frac{\exp(e_{ij})}{\sum\limits_{k\in\mathcal{N}_i}\exp(e_{ik})}
$$
The GAT uses as a [[Atomic Notes/Graph Shift Operator|shift operator]] $S=\{\alpha_{ij}\}^N_{i,j=1}$.
## Self-Attention
Having input $X=\{x_1,x_2,\dots,x_N\}$ with $x_i\in\mathbb{R}^F$, then the **self-attention** $e_{ij}$ is defined as:
$$
e_{ij}=a(Wx_i,Wx_j) \qquad j\in\mathcal{N}_i
$$
Where $a(\cdot)$ is an attention function and $W\in\mathbb{R}^{F'\times F}$ is a learnable weight matrix.