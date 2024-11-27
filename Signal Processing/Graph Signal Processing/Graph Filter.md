---
title: Graph Filter
created: 2024-11-25
authors:
  - Engrima
tags:
  - Graph_Signal_Processing
---
### Filters

Classical [[Discrete Filter]]s are information processing architectures/procedures which store and manipulate signals. They are often used to preserve only relevant content of the signal in input, based on the task at hand.

>[!danger] Filtering in science
>- filtering in Signal Processing $\implies$ preserving specific spectral content of the input
>- filtering in Machine Learning $\implies$ extract relevant patterns from / induce some relational bias in learning architectures.
>	- example 1: **PCA** $\iff$ low-pass filter in the correlation matrix, only part of data contributing to the **directions of largest variance** are preserved
>	- example 2: **CNN** $\iff$ use an operator that exploits the structural invariance of the input

### Graph Filters

Information processing architectures tailored to graph-structured data (generalization of classical filters). 

The concept of **Convolutional Graph Filter** is strictly related to the notion of **[[Atomic Notes/Graph Shift Operator]] (GSO)**. Given a graph signal $\mathbf{x} \in \mathbb{R}^V$, and a Graph Shift Operator $S$, a $K$-th order Convolutional Graph Filter can be equivalently described as:
- a linear mapping $\mathcal{H}:\mathbb{R}^V \rightarrow \mathbb{R}^V$ 
- a *linear combination of $K$ shifted signals*
- a convolution with a *polynomial kernel*
- (in practice) a multiplication with a polynomial function of the shift operator $S$
$$
\mathcal{H}(\mathbf{x})= \underbrace{\sum_{k=0}^K h_{k} S^k}_{\mathcal{H}(S)} \mathbf{x}
$$

>[!warning] Notice
>- the polynomial filtering matrix $\mathcal{H}(S)$ is dependent on the choice of the GSO
>- each parameter $h_{k}$ weights how much importance I want to give to the *$k$-th order neighbourhood* in the sum
>- output of a filtering operation is a linear combination of signal values located at most up to $k$-hops away

**Properties**:
1. **Linearity**: given two input signals $\mathbf{x}_{1}$, $\mathbf{x}_{2} \in \mathbb{R}^V$ $$ \alpha \mathcal{H}(S)\mathbf{x_{1}} +\beta \mathcal{H}(S)\mathbf{x_{2}} = \mathcal{H}(S) (\alpha \mathbf{x_{1}}+\beta \mathbf{x_{2}}) $$
2. **Shift Invariance**: given two graph conv. filter $\mathcal{H_{1}}(S)$, $\mathcal{H_{1}}(S)$, we can switch them without changing the result $$\mathcal{H_{1}}(S) \cdot \mathcal{H_{2}}(S) \cdot \mathbf{x}= \mathcal{H_{2}}(S) \cdot \mathcal{H_{1}}(S) \cdot \mathbf{x} $$
3. **Permutation Equivariance**: 
	1. given the set of permutation matrices $\mathcal{P}=\{P \in \{0,1\}^{V \times V}| P  \underline{1}=\underline{1}, P^T  \underline{1}=\underline{1}\}$
	2. given the GSO for the permuted graph $\hat{S}= P^TSP$
	3. given the permuted signal $\hat{\mathbf{x}}= P^T\mathbf{x}$
	we have that:
	$$\mathcal{H}(\hat{S})\mathbf{x}= P^T\mathcal{H}(S)\mathbf{x}$$
4. **Parameter Sharing**: all nodes share the convolution parameters $\mathbf{h}=[h_{1},\dots, h_{k}]^T$
5. **Locality**: shift $\mathbf{z}^k = S^k\mathbf{x}$ can be evaluated recursively, i.e.: $$\mathbf{z}^k = S(S^{k-1}\mathbf{x})= S \mathbf{z}^{k-1}$$
6. **Linear Complexity**: can be proved that the graph filtering operation can be applied in $\mathcal{O}(kV + kE)$


>[!info] Classical VS Graph Filters
>- Similarities:
>	- linearity
>	- shift invariance
>	- parametric function of the input
>- Differences:
>	- equivariant to the permutation in the support
>	- enjoy a distributed implementation
>	- can assume different generalization forms (e.g. node or edge varying)
>
