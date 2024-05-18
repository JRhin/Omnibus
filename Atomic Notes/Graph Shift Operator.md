---
tags: []
---
A Graph Shift Operator is any matrix $S$ whose sparsity encodes the topology of the graph.
When you multiply a signal to a Shift Operator you're diffusing it over the graph.
$$
x^{(1)}=Sx^{(0)}
$$
Applying more time this multiplication mimic process over the graph:
$$
x^{(k)}=S^kx^{(0)}
$$
where $k$ is the order of the diffusion.