---
layout: note
chapter: "Quasi-Newton methods"
title: "BFGS"
---
* TOC
{:toc}

Now we turn to the minimization of $f(x)$. Of course we could define $F=\nabla f$ (so that $F'=\nabla^2 f$) and apply Broyden's method to update a Hessian approximation. The secant condition in the new notation is $y_k = H_{k+1} s_k$, where now $y_k=\nabla f(x_{k+1}) - \nabla f(x_{k})$. The problem here is that by following the Broyden template, the new $H_{k+1}$ will not generically be symmetric, much less positive definite. 

So instead we set $H_{k+1}=L_{k+1}L_{k+1}^T$ to ensure the SPD structure. This can be used in a slightly more complicated way than before to suggest that $L_{k+1}$ is a rank one update to a similar factor for $H_k$. (Moreover, if we had $H_k=L_k L_k^T$ as a Cholesky factorization in the previous step, then while $L_{k+1}$ is not triangular, it can be updated to be so in $O(m^2)$ operations.) 

However, it's interesting to look at what the update process does to the Hessian itself:

$$ H_{k+1} = H_k + \frac{ y_ky_k^T}{y_k^Ts_k} - \frac{H_ks_ks_k^TH_k }{ s_k^TH_k s_k }. $$

This is a rank-two update, known by the initials BFGS. 

## The inverse

It may not shock you to learn that the rank-two update for $H$ is equivalent to a (relatively) simple update for $H^{-1}$:

$$ H_{k+1}^{-1} = B_k^T H_k^{-1} B_k  + \frac{ s_k s_k^T}{y_k^Ts_k},  \qquad B_k = I - \frac{y_ks_k^T}{ y_k^T s_k }.$$

This tempts us to a heresy: use the inverse of a matrix! That's not exactly the right call, but the formula is important. To find $H_{k+1}^{-1}$ times a vector, we only need to do some vector operations with $s_k$ and $y_k$, plus the ability to apply $H_{k}^{-1}$ to a vector. That lets us dispense with matrices for the Hessian altogether and use a simple recursion to find the newest search direction.

There is one more important variation. In situations like machine learning where the dimension is very high, storing matrices or even a large and growing collection of vectors is out of the question. The *limited memory BFGS*, or L-BFGS, only keeps a fixed number of the most recent $y$ and $s$ vectors, discarding the oldest pair each time. This unfortunately knocks the convergence rate down to linear, but it seems to be a popular method in ML nonetheless. 