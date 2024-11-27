
**Short description**:
- Reinforcement Learning (RL) consists in learning:
	1. we have an **Agent** in certain **Environment**
	2. the **Agent** faces different *situations* $\rightarrow$ it assumes a certain **State**
	3. by consequence it chooses which **Action** to take based on its actual **State**, i.e., it has to map *situations* to **Actions**
	4. he chooses which **Action** to take, based on the **Reward** it would receive from the **Environment** for taking that particular action
	5. the final **Goal** is to find a **Policy** (a set of **Actions**) that maximize a numerical **Reward** signal 
	6. and considering that **Actions**  may affect, not only the immediate **Reward**, but also the next situations, and thus the future **Rewards**
- The idea is to capture the most important aspects of the real problem facing a **learning agent** interacting ==over time== with its **environment** to achieve a **goal**.
- We can formalize the problem of RL using ideas from **[[Dynamical Systems]]** theory, specifically, as the optimal control of ==incompletely-known== **[[Finite Markov Decision Process]]**.

**Assumptions**:
The learning agent:
1. must be able to **sense the state** of its environment, and can consequently collect a **feedback** from it
2.  must be able to take **actions** that **affect the state**.
3. must have **goals** relating to the state of the environment.

**Basic elements of RL**:
- Agent
- Action
- [[Policy]] as a set of Actions
- [[Reinforcement Learning/Basic Elements/Reward]]
- [[Value]] Function
- [[Model]] of the Environment

### Main characteristics

1. **Trial-and-error search**:
	- The learner is **not told which actions to take**
	- The learner must discover which actions yield the most reward by trying them with a *trail-and-error process*, i.e.:
		1. it tries a certain action
		2. it receives a feedback from the environment in terms of reward
		3. it adjusts the learning process a choose a new action based on the received feedback
	- For this reason RL represents a different [[Machine Learning]] paradigm

| Supervised Learning                                                                                                                                                                                 | Unsupervised Learning                                                        | Reinforcement Learning                                                                                                                                                                  |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| The system learns from a training set of **labeled** *situations*, in order to extrapolate, or generalize, its responses so that it acts correctly in *situations* not present in the training set. | The system learns the structure hidden in collections of **unlabeled** data. | The system learns a set of **[[Actions]]** (**[[Policy]]**) from **unlabeled** data (but potentially with some knowledge about the environment), by maximizing a **[[Reward]]** signal. |

2. **Delayed reward**:
	actions may affect not only the immediate, but also the next situation and thus, all **subsequent rewards**
	
3. **Exploit vs Explore**:
	trade-off between exploration and exploitation:
	- agent must prefer actions that it has tried in the past and found to be effective in producing reward (**exploit**)
	- but to discover such actions, it has to try actions that it has not selected before (**explore**)

4. **Uncertainty of the environment**:
	we considers the whole problem of a goal-directed agent interacting with an uncertain environment (everything necessarily becomes **stochastic**)

### Algorithms

RL problems can be solved using two different classes of methods:
1. [[Tabular Solution Methods]]
2. [[Approximate Solution Methods]]