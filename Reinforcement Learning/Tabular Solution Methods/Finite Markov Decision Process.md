**Idea**:
- Expands the Multi-armed [[Bandit Problem]] by involving both:
	- evaluative feedback
	- associative aspect $\implies$ choosing different actions in different situations
- MDPs are a classical formalization of sequential decision making with **delayed reward**
- In MDPs we want to estimate one of the two following aspects:
	1. $q_{*}(s,a)$ $\rightarrow$ the value of each action $a$ in each state $s$
	2. $v_{*}(s)$ $\rightarrow$ the value of each state $s$ ==given optimal action selections==

**Formalization**:
- **Problem**: learning from interaction to achieve a goal
- The notation is founded on the [[Basic Elements]] of [[Reinforcement Learning]], starting from the definition of two "main objects":
	1. an *agent* $\rightarrow$ a learner interaction with the environment (things outside the agent) through *actions*
	2. an *environment* $\rightarrow$ responding to the agent interactions with *rewards* and presenting new *states*
- To be more specific, at each timestep $t$:
	1. agent receives some representation of the environment’s state $S_{t} \in \mathcal{S}$
	2. on that basis selects an action $A_{t} \in \mathcal{A}(s)$
	3. receives a numerical reward from the environment $R_{t+1} \subset \mathcal{R} \in \mathbb{R}$
	4. fonds itself in a new state $S_{t+1}$
- We can define an overall *trajectory* $S_{0}, A_{0}, R_{1}, S_{1}, A_{1}, R_{2}, S_{2}, \dots$

![[Pasted image 20241127113536 1.png]]

>[!info] Why Finite MDPs?
>In Finite MDPs the set of states, actions, and rewards ($\mathcal{S}, \mathcal{A}, \mathcal{R}$) all have a finite number of elements (are countable)

### MDP Dynamics

- $R_{t}$ and $S_{t}$ have discrete probability distributions dependent only on the preceding state $s$ and action $a$
- There is a probability $p$ that defines the **dynamics** of the MDP system, which describes the joint prob. of particular values of the above r.V.s $s' \in \mathcal{S}, r \in \mathcal{R}$, conditioned on the previous values of state $s$ and action $a$, i.e.:
$$
p(s^{\prime},r | s,a) \doteq \mathrm{Pr}\{S_{t}=s^{\prime},R_{t}=r | S_{t-1}=s,A_{t-1}=a\}
$$
- the probabilities given by $p$ completely characterize the MDP system

>[!tip] **Markov Property**
> The probability of each possible value for $S_t$ and $R_t$, depends only on the immediately preceding state and action, $S_{t-1}$ and $A_{t-1}$,  not on earlier states and actions!

- From the dynamics we can derive all the info that we need, e.g.:
	- **state-transition probabilities**:
$$
p(s'| s,a) \doteq \Pr\{S_{t}=s'\mid S_{t-1}=s,A_{t-1}=a\} = \sum_{r\in\mathbb{R}}p(s',r | s,a)
$$
	- **Expected rewards for state-action pairs**
$$
r(s,a) \doteq \mathbb{E}[R_{t}\mid S_{t-1}=s,A_{t-1}=a] = \sum_{r\in\mathcal{R}}r \sum_{s^{\prime}\in\mathcal{S}}p(s^{\prime},r | s,a)
$$
	- **Expected rewards for state-action-next-state triples**
$$
r(s,a,s^{\prime}) \doteq \mathbb{E}[R_{t}\mid S_{t-1}=s,A_{t-1}=a,S_{t}=s^{\prime}] = \sum_{r\in\mathbb{R}}r \frac{p(s^{\prime},r | s,a)}{p(s^{\prime} | s,a)}
$$

>[!tip] MDP framework
>any problem of learning goal-directed behavior can be reduced to three signals passing back and forth between an agent and its environment:
>1. *actions* $\rightarrow$ the actions made by the *agent*
>2. *states* $\rightarrow$ basis on which the choices are made
>3. *rewards* $\rightarrow$ designed to define the agent's goal

### Transition graph

- It is often useful to design a schema to represent an MDP formulation of a problem $\rightarrow$ *trasition graph*:
	- *state nodes* $\rightarrow$ for each possible state
	- *action nodes* $\rightarrow$ for each possible state-action pair
- Dynamics:
	1. Starting in state $s$ and taking action $a$ moves you along the line from state node $s$ to action node $(s, a)$
	2. environment responds with a transition to the next state’s node via one of the arrows leaving action node $(s, a)$ 
		- each arrow represents a triple $(s',s,a)$
		- we label the arrow with 
			1. the transition probability, $p(s' |s, a)$
			2. the expected reward $r(s',s,a)$
- Example page 52 of Barto&Sutton:

![[Pasted image 20241127120155 1.png]]


### Policies and Value Functions




