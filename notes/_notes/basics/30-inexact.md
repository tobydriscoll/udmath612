---
layout: note
chapter: "Basics of Newton-like methods"
title: "Inexact Newton"
---
* TOC
{:toc}

The whole Newton premise is to build and solve a locally valid model approximation of the actual function. It's worth considering whether we really need to solve that subproblem very accurately, since the model itself is just approximate. This line of thought leads to *inexact Newton* methods.

## Inner iterations 

Considering that the model subproblems come in the form of linear systems, this is an ideal situation for iterative Krylov methods! This creates a setup of "outer" Newton iterations wrapped around "inner" Krylov iterations. In the minimization case we have a symmetric matrix, so MINRES or (given our assumption so far of definiteness) CG should be used. For nonlinear equations we probably need to stick with GMRES or something similar. 

In addition to all the usual questions about which Krylov method, sparsity, preconditioning, etc., the new element is deciding what error tolerance to require of the inner solver. In the minimization case, the criterion for finding the Newton step $s$ is

$$ \| H_c s + g_c \| \le \eta_c \|g_c\|,$$

while for nonlinear systems it's

$$ \| J_c s + F(x_c) \| \le \eta_c \|F(x_c)\|.$$

In both cases you want the "forcing constant" $\eta_c \to 0$. This guarantees superlinear convergence. In practice it can be tricky to balance between having $\eta_c$ approach zero slowly (so that we don't over-solve inaccurate models) and quickly (to be able to capture the asymptotic quadratic convergence). A typical formula is 

$$ \eta_c \ \frac{1}{2} \min\left\{  1, \sqrt{\|g_c\|/\|g_0\|}  \right}.$$

This helps to make $\eta_c$ get small when we get close to optimality. 

## Black-box finite differences

Another potential advantage of using inner Krylov iterations is that we don't need to build full Hessian/Jacobian matrices. In the nonlinear system case, for example, all we need is the ability to compute $J_cu$ for any vector $u$. This is essentially a directional derivative. The finite difference version could look like

$$J(x_c) u \approx \frac{F(x_c+\delta u) - F(x_c)}{\delta},$$

which requires just one new evaluation of $F$. Sometimes it's recommended that one use $u/\|u\|$ in place of $u$. 

For minimization, if we have exact gradients, then we can use the formula above with $\nabla f$. If not, then AFAIK there's no way in general to avoid doing $m$ differences to get the gradient, then doing a directional difference as above. 

