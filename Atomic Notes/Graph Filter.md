---
tags: []
---
A graph filter $\sigma$ associated to a graph signal is defined as:
$$
\sigma = U\Sigma U^H
$$
Where $\Sigma$ is a diagonal matrix that selects the frequencies to keep and the ones to filter out.

**Note**: A possible way to understand the most important frequencies of a signal is to average the frequency response of different samples of the same signal and then to keep the frequencies that correspond to the 95% of the cumulative energy.
## Applying the graph filter
So the resulting filtered signal $y$ associated to the original one $x$ is:
$$
\begin{align}
y & = \sigma x\\
& = U\Sigma U^H x
\end{align}
$$ 