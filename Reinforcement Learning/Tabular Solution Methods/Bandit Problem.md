It is the simplest for of [[Reinforcement Learning]] problem, representing an **[[evaluative feedback]]** problem.

>[!info] Evaluative vs Instructuve
>- **evaluative** feedback $\rightarrow$ says how good the action taken was, but not whether it was the best or the worst action possible (depends entirely on the action taken)
>- **instructive** feedback $\rightarrow$ indicates the correct action to take, **independently** of the action actually taken

## $k$-armed Bandit problem

**Short description**:
- You are faced repeatedly with a choice of an action $a$ among $k$ different **actions**
- After each choice you receive a numerical **reward** chosen from a **stationary** probability distribution, depending on the selected action
- Objective: maximize the **expected total reward** over some time period (e.g. 100 timesteps)

**Idea**:
1. Suppose that at time step $t$ you to choose an action $A_{t}$
2. At time step $t$, each of the $k$ actions among which you can choose has:
	1. a **[[Reward]]** $R_{t}$ 
	2. a **[[Value]]**  $q_{*}(a)$$\rightarrow$ expected reward given the action
$$
q_*(a)\doteq\mathbb{E}[R_t\mid A_t=a]
$$
3. We do not generally know the value of each action (otherwise it would be trivial to maximize the reward by always choosing the higher-value action)
4. We maintain an estimate of the action value $Q_{t}(a)$, for each action $a$, timestep $t$
5. Having those estimates we can take choices according to two different strategies:
	1. **exploiting** $\rightarrow$ having the estimates, you choose actions with the higher estimated values, i.e., **greedy actions**  
	2. **exploring** $\rightarrow$ improve the estimates by selecting among the **nongreedy actions**

>[!warning] Exploration-Exploitation trade-off
>Usually we need some methods for balancing exploration and exploitation during the resolution of the $k$-armed Bandit problem

## Action-Value Methods

**Definition**
Methods used to solve the $k$-armed Bandit problem by: 
1. estimating the values of actions $\rightarrow$ **Simple-Average Method**
2. using the estimates to make action selection decision e.g.:
	1. **greedy** action selection
	2. **$\varepsilon$-greedy** action selection

### Simple-Average Method

- The true value of an action is the **mean reward** when that action is selected, i.e.:
$$
q_*(a)\doteq\mathbb{E}[R_t\mid A_t=a]
$$
- We estimate this mean is by averaging the rewards actually received, and getting an **empirical average** from the rewards of past action selections:
$$
Q_t(a)\doteq\frac{\text{sum of rewards when }a\text{ taken prior to }t}{\text{number of times }a\text{ taken prior to }t}=\frac{\sum_{i=1}^{t-1}R_i\cdot\mathbb{1}_{A_i=a}}{\sum_{i=1}^{t-1}\mathbb{1}_{A_i=a}}
$$
>[!warning]
>If the denominator is zero, then we instead define a default value for $Q_{t}(a)$

>[!danger] Convergence
>By the [[Law of Large Numbers]] $Q_{t}(a)$ converges to $q_{*}(a)$, when the number of samples (selected actions) goes to infinity

### Greedy action selection

- Select one of the actions with the highest estimated value, i.e., one of the **greedy actions**:
$$
A_{t}\doteq\arg\max_{a}Q_{t}(a)
$$
- If there is more than one greedy action, select one of them uniformly at random

>[!danger] Notice
>Greedy action selection always exploits current knowledge to maximize immediate reward

### $\varepsilon$-Greedy action selection

- Behave greedily most of the time, but every once in a while, say with small probability $\varepsilon$, instead select uniformly at random from among all the actions with equal probability, independently of the action-value estimates

>[!info] greedy vs $\varepsilon$-greedy
>- In the limit $\varepsilon$-greedy ensures that every action will be sampled an infinite number of times $\implies$ all the $Q_{t}(a)$ converge to $q_*(a)$
>- But we just have asymptotic guarantees of converges to the true value
>- It often happens that empirically the greedy method improves slightly faster than the other methods at the very beginning, but then levels-off at a lower level, performing worse in the long run $\implies$ due to the lack of exploration

>[!tip]
>Is possible to reduce $\varepsilon$ over time (as for learning rate scheduling in [[Deep Learning]]), to reflect the fact that we generally need less exploration in the last iterations of the algorithm

>[!danger] Nonstationarity
>A bit of exploration is almost always needed to fight the general **nonstationarity** of values (i.e. true values change over time) 

### Incremental Implementations

**Problem**:
- Simple-Average method estimate action values as sample averages of observed rewards
- We have to maintain a record of all the rewards and then perform this computation whenever the estimated value was needed
- How these averages can be computed in a computationally efficient manner?
	- with constant memory
	- constant per-timestep computation

**Solution**:
- Devise incremental formulas for updating averages with small, constant computation
- We seek for a general updating rule given by:
$$
\text{NewEstimate}\leftarrow\text{OldEstimate }+\text{ StepSize }\underbrace{\left[\text{Target}-\text{OldEstimate}\right]}_{\text{estimation error}}
$$

##### 1. Incremental Simple Average

- Given:
	- the $n$-th estimated value $Q_{n}$
	- the $n$-th reward $R_{n}$
	- a new average of all the $n$ rewards can be evaluated with a *recursive* computation:
$$
\begin{aligned}
Q_{n+1}& =\quad\frac1n\sum_{i=1}^nR_i \\
&=\quad\frac1n\left(R_n+\sum_{i=1}^{n-1}R_i\right) \\
&=\quad\frac{1}{n}\left(R_n+(n-1)\frac{1}{n-1}\sum_{i=1}^{n-1}R_i\right) \\
&=\quad\frac1n\Big(R_n+(n-1)Q_n\Big) \\
&=\quad\frac1n\Big(R_n+nQ_n-Q_n\Big) \\
&=\quad Q_{n}+\frac1n\Big[R_{n}-Q_{n}\Big],
\end{aligned}
$$
- This implementation requires only memory for $Q_{n}$ and $n$ and a small computation given the new reward $R_{n}$

>[!danger] Variable step-size
>Note that in this particular incremental implementation the step size changes from timestep to timestep, being a function of the timestep itself!

**In practice**
We can use this incremental version of the simple average, in combination with $\varepsilon$-greedy action selection, getting the following overall procedure

![[Pasted image 20241125174830.png]]

##### 2. Incremental Exponential Recency-Weighted Average

- The simple-average incremental method fails to handle nonstationary, considering only the bandit problem where we assume rewards probabilities do not change over time
- With nonstationary makes sense to give more weight to recent rewards than to long-past rewards
- We slightly modify the previous updating rule by defining a new step-size s.t. the weight of past rewards exponentially decays in the timesteps, i.e., having $\alpha \in (0,1]$, we get:
$$
\begin{aligned}
Q_{n+1} &=\quad Q_n+\alpha\Big[R_n-Q_n\Big] \\
&=\quad\alpha R_n+(1-\alpha)Q_n \\
&=\quad\alpha R_{n}+(1-\alpha)\left[\alpha R_{n-1}+(1-\alpha)Q_{n-1}\right] \\
&=\quad\alpha R_n+(1-\alpha)\alpha R_{n-1}+(1-\alpha)^2Q_{n-1} \\
&=\quad\alpha R_{n}+(1-\alpha)\alpha R_{n-1}+(1-\alpha)^{2}\alpha R_{n-2}+ \cdots+(1-\alpha)^{n-1}\alpha R_{1}+(1-\alpha)^{n}Q \\
&=\quad(1-\alpha)^nQ_1+\sum_{i=1}^n\alpha(1-\alpha)^{n-i}R_i.
\end{aligned}
$$
>[!info] Convergence
>- Define $\alpha_{n}(a)$ to be the step size parameter for the $n$-th time we select action $a$
>- The convergence conditions are that:
>	1. steps are large enough to eventually overcome any initial conditions or random fluctuations $$\sum_{n=1}^\infty\alpha_n(a)=\infty$$
>	2. eventually the steps become small enough to assure convergence $$\begin{aligned}\sum_{n=1}^\infty\alpha_n^2(a)<\infty\end{aligned}$$

>[!tip] Notice
>- For the simple-average incremental implementation $\alpha_{n}(a)=\frac{1}{n}$ respects both the above conditions
>- A constant step size $\alpha_{n}(a)=\alpha$ violates both the conditions

>[!tip] Optimistic Initial Values
>- All the methods in this note are biased by the some values $Q_{1}(a)$
>- By using **optimistic initial values** (more extreme initial values) we can stress some more exploration in our overall procedure
>- This trick is not well-suited for nonstationary problems

### Upper-Confidence-Bound (UCB) Action Selection

**Problem**:
- Exploration is needed because there is always uncertainty about the accuracy of the action-value estimates
- **$\varepsilon$-greedy action selection** forces the non-greedy actions to be tried, but ==indiscriminately==, with no preference for those that are nearly greedy

**Solution**:
- Select among the non-greedy actions according to their potential for actually being optimal, taking into account:
	1. how **close** their estimates are to being maximal
	2. **uncertainties** in those estimates
- New selection rule:
$$
A_t\doteq\underset{a}{\arg\max}\left[Q_t(a)+c\sqrt{\frac{\ln t}{N_t(a)}} \right]
$$
- Where:
	- $N_{t}(a)$ $\rightarrow$ number of times that action $a$ has been selected prior to time $t$
	- $c>0$ $\rightarrow$ number of times that action $a$ has been selected prior to time $t$
	- if $N_{t}(a)=0$ $\implies$ $a$ is considered to be a maximizing action

>[!info] Interpretation
>- The square-root term is a measure of the uncertainty or variance in the estimate of $a$’s value
>- The quantity being max’ed over is thus a sort of upper bound on the possible true value of action $a$, with $c$ determining the confidence level
>- Dichotomy:
>	- each time $a$ is selected the uncertainty is presumably reduced
>	- each time an action other than $a$ is selected, $t$ increases but $N_{t}(a)$ does not

>[!tip] Summing-up
>All actions will eventually be selected, but actions with lower value estimates, or that have already been selected frequently, will be selected with decreasing frequency over time

>[!danger] Issues with UCB
>- difficulty in dealing with nonstationary problems
>- difficulty is in dealing with large state spaces

### Gradient Bandit

**Idea**:
- Incremental Average Methods and Upper-Confidence Bound Method both work only on the value estimates
- This time we want to learn a numerical **preference** $H_{t}(a)$ for each action $a$ at timestep $t$ s.t.
	1. the larger the preference $\implies$ more often that action is taken
	2. but preference has no interpretation in terms of reward
	3. only the relative preference of one action over the other is important, not the absolute value (preferences have only ordinal but not cardinal validity)

**Implementation**:
- Action preferences are determined according to a *softmax distribution*:
$$
\Pr\{A_t=a\}\doteq\frac{e^{H_t(a)}}{\sum_{b=1}^ke^{H_t(b)}}\doteq\pi_t(a)
$$
- where:
	- $\pi_{t}(a)$ $\rightarrow$ probability of taking action $a$ at time $t$
	- initially $H_{1}(a)=0 \, ,\forall a$
- The measure of performance is thus the expected reward (values in the previous methods):
$$
\mathbb{E}[R_t]=\sum_x\pi_t(x)q_*(x)
$$
- Each action preference $H_{t}(a)$ would be incremented proportional to the increment’s effect on the above performance according to the rule:
$$
H_{t+1}(a)\doteq H_t(a)+\alpha\frac{\partial\mathbb{E}\left[R_t\right]}{\partial H_t(a)}
$$
- Where the measure of the increment’s effect is the partial derivative of this performance measure with respect to the action preference $\frac{\mathbb{E}\left[R_t \right]}{\partial H_t(a)}$
- **Problem**: not possible to implement the above increment/updating rule (gradient ascent) exactly in our case because by assumption we do not know the true value function $q_{*}(a)$
- Thus, a natural algorithm for iteratively updating the preferences, in order to maximize the reward, is given by the **Stochastic Gradient Ascent**:
	1. Rewrite the partial derivative as:
$$
\begin{aligned}
\frac{\partial\mathbb{E}[R_t]}{\partial H_t(a)}& =\frac{\partial}{\partial H_t(a)}\left[\sum_x\pi_t(x)q_*(x)\right] \\
&=\sum_xq_*(x)\frac{\partial\pi_t(x)}{\partial H_t(a)} \\
&=\sum_x\left(q_*(x)-B_t\right)\frac{\partial\pi_t(x)}{\partial H_t(a)}
\end{aligned}
$$
	where we included the baseline $B_{t}$ without changing the equality (gradient sums to 0)
	2. multiply each term of the sum by $\pi_{t}(x) / \pi_{t}(x)$ and we then recognize the form of an expectation (remember the **[[Law of Lazy Statistician]]**):
$$
\begin{aligned}
\frac{\partial\mathbb{E}[R_t]}{\partial H_t(a)}&=\sum_{x}\pi_t(x)\big(q_*(x)-B_t\big)\frac{\partial\pi_t(x)}{\partial H_t(a)}/\pi_t(x) \\
&=\mathbb{E}\big[\big(R_{t}-\bar{R}_{t}\big)\pi_{t}(A_{t})\big(\mathbb{1}_{a=A_{t}}-\pi_{t}(a)\big)/\pi_{t}(A_{t})\big] \\
&=\mathbb{E}\big[\big(R_{t}-\bar{R}_{t}\big)\big(\mathbb{1}_{a=A_{t}}-\pi_{t}(a)\big)\big]
\end{aligned}
$$
	where we:
	-  introduced the average reward as baseline $\bar{R}_{t}$
	- substituted $R_t$ for $q_{*}(A_{t})$ since $\mathbb{E}[R_t|A_t] = q_*(A_t)$
	- used the definition of derivative of a softmax function for the partial derivative:
$$
\frac{\partial\pi_{t}(x)}{\partial H_{t}(a)} = \pi_{t}(x)(\mathbb{1}_{a=x}-\pi_{t}(a))
$$
	3. Substituting a sample average for the above expectation for the performance gradient, we get:
$$
H_{t+1}(a)=H_t(a)+\alpha\big(R_t-\bar{R}_t\big)\big(\mathbb{1}_{a=A_t}-\pi_t(a)\big),\quad\text{ for all }a,
$$
	or in other words, the updating rule of the stochastic gradient ascent will be:
$$
\begin{cases}
H_{t+1}(A_t)&\doteq H_t(A_t)+\alpha'\big(R_t-\bar R_t\big)\big(1-\pi_t(A_t)\big),\quad&\text{and}\\H_{t+1}(a)&\doteq H_t(a)-\alpha\big(R_t-\bar R_t\big)\pi_t(a),\quad&\text{for all }a\neq A_t
\end{cases}
$$

>[!tip] Interpretation of the SGA
>- If the reward is higher than the baseline, then the probability of taking $A_t$ in the future is increased
>- if the reward is below baseline, then probability is decreased

>[!tip] Why to introduce a baseline in the formulation
>The choice of the baseline does not affect the expected update of the algorithm, but it does affect the variance of the update and thus the rate of convergence

### Contextual Bandit

**Problem**:
- **Non-associative** task $\rightarrow$ no need to associate different actions with different situations
	- task is stationary $\rightarrow$ learner tries to find a single best action
	- task is non-stationary $\rightarrow$ tries to track the best action as it changes over time
- **Associative** task $\rightarrow$ there is more than one situation, and the goal is to learn a [[Policy]]

**Contextual Bandit assumptions**:
- there are several different k-armed bandit tasks
- on each step you confront one of these chosen at random
- bandit task changes randomly from step to step $\rightarrow$ this would appear to you as a single, **nonstationary** **k-armed bandit** task whose true action values change randomly from step to step

**Idea**:
- suppose when a bandit task is selected for you, you are given some distinctive clue about its identity
- now you can learn a policy associating each task with the best action to take when facing that task
- this is an example of an **associative search task**, so called because it involves both
	1. **search** $\rightarrow$  trial-and-error learning to search for the best actions
	2. **association** $\rightarrow$ association of these actions with the situations in which they are best

>[!info] 
>Associative search tasks are intermediate between the k-armed bandit problem and the full reinforcement learning problem... here we still have that each action affects only the immediate reward!

