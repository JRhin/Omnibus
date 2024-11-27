---
tags: []
---
A GNN is a stack of [[Atomic Notes/Graph Perceptron]], if we consider a GNN with $L$ layers then its output is:
$$
X_L=\Phi(x;S,h_1,\dots,h_L)=\Phi(x;S,H)
$$
Where the *filter matrix $H=(h_1,\dots, h_L)$* is the trainable parameter, while the [[Atomic Notes/Graph Shift Operator]] $S$ is prior information.

## Training
We want to solve the following problem:
$$
H^*=\arg\min_H \sum_{(x,y)\in\mathcal{T}}l(y,\Phi\left(x;S,H)\right)
$$
## Add-ons
- [[Atomic Notes/Graph Pooling]]
- [[Graph Attention Networks]]