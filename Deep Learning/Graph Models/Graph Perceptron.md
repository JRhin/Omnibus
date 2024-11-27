**Assumptions**:
- **Graph domain** $\mathcal{G(V,E)}$
- **Training set** of observation pairs $T=\{ (\mathbf{x}, \mathbf{y})|\mathbf{x} \in \mathbb{R}^V, \mathbf{y} \in \mathbb{R}^V\}$ both defined over the nodes of the graph
	- $\mathbf{x}$ $\rightarrow$ input graph signal
	- $\mathbf{y}$ $\rightarrow$ output (target) signal, after processing over the graph
-  **Model** consisting in a function $\phi \in \mathcal{C}$, where $\mathcal{C}$ is a certain **class of functions**
-  **Predicted output** signal $\hat{\mathbf{y}}=\phi(\mathbf{x})$
- **Loss** function $l(\mathbf{\hat{y}}, \mathbf{y})$

**Learning Goal**:
Empirical Risk Minimization with graph data $\iff$ find the function $\phi^*$ s.t.:
$$
\phi^*=\underset{\phi}{\arg\min} \sum_{(\mathbf{x},\mathbf{y})\in T} l(\phi(\mathbf{x}), \mathbf{y})
$$
**Idea**:
1. Since $\mathbf{x}$ are graph signals, we want to exploit the geometry under the data to induce some **relational bias** in the model.
2. We can use our prior knowledge about the graph such as the [[Atomic Notes/Graph Shift Operator]] $S$
3. We bias our model by restricting the class of functions in which we search our solution $\phi^*$ , to the set of [[Signal Processing/Graph Signal Processing/Graph Filter|Graph Filter]] functions (we like the properties of this class of functions for graph signals), i.e.: $$\phi(\mathbf{x})= \sum_{k=0}^K h_{k} S^k \mathbf{x}= \phi(\mathbf{x},S,\mathbf{h})$$
4. Now we map the problem from finding the best function $\phi^*$ to finding the best parameters $\mathbf{h}^*$ that describe the desired function, i.e.: $$\mathbf{h}^*=\underset{\mathbf{h}}{\arg\min} \sum_{(\mathbf{x},\mathbf{y})\in T} l(\phi(\mathbf{x}, S, \mathbf{h}), \mathbf{y})$$
5. Finally we simply add some non-linearity $\sigma(\cdot)$ to the function $\phi(\cdot)$, gaining more expressive power through a larger class of functions, i.e.: $$\mathbf{h}^*=\underset{\mathbf{h}}{\arg\min} \sum_{(\mathbf{x},\mathbf{y})\in T} l(\underbrace{\sigma(\phi(\mathbf{x}, S, \mathbf{h}))}_{\mathbf{\hat{y}}}, \mathbf{y})$$
![[Pasted image 20241116220107.png]]