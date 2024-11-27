- They represent the simplest form of [[Reinforcement Learning]] algorithms, where the **state** and **action** spaces are small enough for the approximate **[[Value]] functions** to be represented as *arrays*, or *tables*
- These methods can often find exact solutions, in terms of optimal [[Value]] and the optimal [[Policy]]

### Use cases

Tabular Methods are used for two different setup:
- when we only have a single state $\rightarrow$ formulated as a [[Bandit Problem]]
- more general problems with multiple states $\rightarrow$ formulated as a **Finite** [[Finite Markov Decision Process]]

### Classes of Tabular Methods for finite MDP

To generally solve problems defined as [[Finite Markov Decision Process]]es is possible to use 3 different classes of tabular methods:
1. [[Dynamic Programming]] methods
2. [[Statistics/Monte Carlo]] methods
3. [[Temporal-Difference Learning]] methods

>[!info] Combination of methods
>- [[Reinforcement Learning/Tabular Solution Methods/Monte Carlo|Monte Carlo]] can be combined with the strengths of [[Temporal-Difference Learning]] methods via [[Multi-Step Bootstrapping]] methods.
>- [[Temporal-Difference Learning]] methods can be combined with **model learning** and planning **methods** (such as [[Dynamic Programming]])

