---
tags: []
---
In several applications, we deal with very large graphs so the need for **pooling** operators to reduce the size of the graph.

So the pooling operator is a function that maps a graph $G=(\mathcal{V},\mathcal{E})$ in another graph $G'=(\mathcal{V}', \mathcal{E}')$ where the cardinality of $\mathcal{V}$ and the one of $\mathcal{E}$ is smaller the the ones of $\mathcal{V}'$ and $\mathcal{E}'$.

The Pooling operator consists of 3 main operations:
- **Select**: a function that maps nodes of $G$ to nodes of $G'$ (called supernodes).
- **Reduce**: a function that computes the node attributes of $G'$ by aggregating the node attributes selected in each supernode $S_k$.
- **Connect**: a function that determines if for each pair of supernodes there is or not an edge.