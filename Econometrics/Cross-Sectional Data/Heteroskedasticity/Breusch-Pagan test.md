1. Estimate the [[Multiple Regression Model]] by OLS, as usual. $$y=\beta_0+\beta_1x_1+\beta_2x_2 + \dots + \beta_{k}x_{k} +u$$
2. We assume <mark style="background: #ADCCFFA6;">MRL.1</mark> - <mark style="background: #ADCCFFA6;">MRL.4</mark> from the [[Gauss-Markov Assumptions]] and we want to test <mark style="background: #ADCCFFA6;">MRL.5</mark> $$\mathrm{H}_0{:}\;Var(u|x_1,x_2,...,x_k)=\mathbb{E}(u^2|x_1,x_2,...,x_k)=\mathbb{E}(u^2)=\sigma^2$$
3. Obtain the squared OLS residuals (one for each observation) as error estimates from the original MRL.
   **Idea**: We can recast the above assumption by writing the error as linear combination of the indep. variables and then testing if all the coefficients are zero, i.e.: 
   - given $$u^2=\delta_0+\delta_1x_1+\delta_2x_2+...+\delta_kx_k+\nu $$
   - recasted test $$\mathrm H_0\colon\delta_1=\delta_2=...=\delta_k=0$$
4.  Run the regression of the OLS residuals on the indep. variables
5. Keep the R-squared from this regression, $R_{\hat{u}^2}^2$.
6. Form either the F statistic or the LM statistic and compute the p-value:
$$\begin{cases}
F=\frac{R_{\hat{u}}^22/k}{(1-R_{\hat{u}}^22)/(n-k-1)} &\implies \sim F_{k, n-k-1} \\ \\
LM=n\cdot R_{\hat{u}^{2}}^{2} &\implies \sim \chi^2_k
\end{cases}$$
8. If the p-value is sufficiently small, that is, below the chosen significance level, then we reject the null hypothesis of homoskedasticity $\implies$ If the BP test results in a small enough p-value, some corrective measure should be taken.

>[!tip] Slight modification to the BP test
>If we suspect that heteroskedasticity depends only upon certain independent variables, we simply regress $\hat{u}^2$ on whatever independent variables we choose and carry out the appropriate F or LM test.

