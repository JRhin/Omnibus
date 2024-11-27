- The **value** of a state is the total amount of reward an agent can ==expect== to accumulate over the future, starting from that state
- Values are useful for evaluating/taking decisions through **actions**
- **[[Reward]] vs Value**:
	- a state might always yield a low immediate reward but still have a high value (since the value function considers the high rewards of the successive states)
	- reward signal $\rightarrow$ what is good in an immediate sense
	-  value function $\rightarrow$ what is good in the long run

>[!warning] 
>- Values do NOT define the goal in [[Reinforcement Learning]] problems
>- [[Reward]]s are in a sense primary, whereas values, as predictions of rewards, are secondary
>- The only purpose of estimating values is to achieve more reward

>[!danger] Difficulty
>- Rewards are given directly by the environment
>- Values must be estimated and re-estimated from the sequences of observations an agent makes over its entire lifetime

