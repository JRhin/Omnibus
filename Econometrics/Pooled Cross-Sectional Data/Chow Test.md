1. Obtain the **Restricted SSR** from the pooled estimation
2. Obtain the **Unrestricted SSR** as the sum of the SSRs for the two separately estimated time periods
3. Use the [[F-test]] with those particular restricted and unrestricted models in mind

>[!warning] Another way to compute the Chow test for two time periods
>1.  Interact each variable with a year dummy for one of the two years 
>2. Test for joint significance (F-test) of the year dummy and all of the interaction terms
>3. Since the intercept in a regression model often changes over time in pooled data 
>   $\implies$ more interesting to:
>	1. allow for an intercept difference
>	2. then to test whether certain slope coefficients change over time

>[!tip] Chow test for multiple periods of time
>We can test the constancy of slope coefficients generally by:
>1. interacting all of the time-period dummies (except that defining the base group) with one, several, or all of the explanatory variables
>2. test the joint significance of the interaction terms
