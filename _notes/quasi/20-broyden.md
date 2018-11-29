---
layout: note
chapter: "Quasi-Newton methods"
title: "Broyden's method"
---
* TOC
{:toc}

At iteration $k$, we solve the linear model $M_k(x)= F(x_k) + J_k(x-x_k)$ for some known Jacobian approximation $J_k$. This is solved to give $x_{k+1}$, or alternatively, a step $s_k=-J_k^{-1}F(x_k)$. The next step will be based on the new linear model 

$$M_{k+1}(x)= F(x_{k+1}) + J_{k+1}(x-x_{k+1}).$$

But we need something to help determine $J_{k+1}$. The spirit of the secant method suggests that we require $M_{k+1}(x_k) = F(x_k)$ (so that the model at least interpolates the two most recent points). This leads to 

$$ F(x_k) = F(x_{k+1}) + J_{k+1}(x_k-x_{k+1}),$$

or

$$ y_k = J_{k+1} s_k,$$

where we define $y_k = F(x_{k+1}) - F(x_k).$ 

That's one vector condition on $J_{k+1}$, which is too little to specify it uniquely. So we also declare that the update in the Jacobian be of rank one: $J_{k+1} = J_k + uv^T.$ Using the secant constraint, we easily find that

$$ u(v^T s_k) = y_k - J_ks_k.$$

so that $u$ is the right-hand side, divided by $v^Ts_k$. Clearly it won't do to have $v$ orthogonal to $s_k$, and there are ways to justify (e.g., minimize the Frobenius norm of $uv^T$) that indeed we want $v=s_k$. In the end we get

$$ J_{k+1} = J_k + \frac{ (y_k - J_ks_k)s_k^T }{ s_k^Ts_k }.$$

This is known as *Broyden's update*. 

One advantage of the rank-one update is that there are well-known $O(m^2)$ methods for updating the $QR$ factorization as well, saving a lot of effort in solving the linear systems. In practice one combines this update with a line search or trust region strategy. Typically one starts the iteration with a finite-difference Jacobian from the initial point, and reapplies finite differences if the iteration progress bogs down too much. 
