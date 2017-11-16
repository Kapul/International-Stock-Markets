# International-Stock-Markets

Part of MATLAB codes for a comprehensive analysis of international stock markets, in particular, how broad stock market returns of developed and developing countries are affected by different factors. I investigate on-time co-movement of all countries with China and US stock markets by calculating rolling window realized correlations between them. Finally, I perform LASSO regressions to choose a set of best predictors (with a penalty for a number of regressors) for each country in-sample and validate its out-of-sample performance relative to the historical average.

File "lassocoef" (function for coefficients search) contains efficient LASSO algorithm, so you can adjust it for your needs. In general, it works as regular out-of-the-box LASSO procedure but gives flexibility for additional features.

File "icrossvalidation" calculates cross-validation error for a certain level of lambda. 

File "crossvalidation" optimizes a lambda to minimize a cross-validation error.

File "realizedcorrelations" contains yearly measure of realized correlation between any of 2 stock markets. The idea is that a degree of market integration could be inferred by co-movements in stock returns. To investigate integrations of these markets, I construct a model-free yearly measure of returns correlation.
