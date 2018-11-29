---
layout: note
chapter: "Secant-like methods"
title: "Secant method"
---
* TOC
{:toc}

For the moment consider the rootfinding problem for a scalar univariate function $F(x)$. The Newton update formula is 

$$ x_{k+1} = x_k - \frac{f(x_k)}{f'(x_k)},$$

which is quadratically convergent. We can avoid coding and evaluating $f'$, however, by substituting a finite difference based on the two most recent estimates:

$$ x_{k+1} = x_k - \frac{x_k-x_{k-1}}{f(x_k)-f(x_{k-1})}f(x_k).$$

This is called the *secant method*, because it replaces the local linear model based on a tangent line with one based on a secant line. Measured in terms of the iteration count, the convergence of the error drops from quadratic to superlinear of order $(1+\sqrt{5})/2\approx 1.62$. But if you consider evaluations of $f$ and $f'$ to be the expensive parts of the computation, then in terms of those evaluations it actually beats Newton, whose equivalent order is $\sqrt{2}\approx 1.41$. In any case, avoiding the need to code anything for $f'$ is reward enough.

## Secant Jacobians

The situation for a multidimensional system $F(x)$ is considerably less rosy. The Jacobian $F'$ is $m\times m$. If we are to approximate it finite-difference style, we need at least $m+1$ unique values of $F$ to do so. It turns out that using the most recent iterates $x_k,x_{k-1},\ldots$ to do this is not only very slow, but numerically unstable. 

Instead we will go for a different idea of *updating* the Jacobian. If we have a reasonable approximation $J_{k}\approx F'(x_{k})$, we then perturb or update it to get the next $J_{k+1}$. 
