---
layout: note
chapter: "Globalizing convergence"
title: "Armijo rule"
---
* TOC
{:toc}

In GD we looked to improve our situation by restricting our attention to a ray from the current point in the direction of the negative gradient. More generally we might allow any direction $d$ that simply ensures descent, i.e., one for which $g(x_c)^Td < 0$. For example, we might use a *quasi-Newton* method with a quadratic model 

$$q(x) = f(r) + g(x_c)^T (x-x_c) + \frac{1}{2} (x-x_c)^T H_c (x-x_c),$$

for a positive definite matrix $H_c$ meant to be or approximate the Hessian. If the model minimizer $d=-H_c^{-1}g(x_c)$ is a descent direction, it could offer better local convergence than the gradient would. 

Since we have already shown that even exact minimization along the descent direction isn't necessarily going to give fast asymptotic convergence, we shift goals into seeking to *globalize* an asymptotically fast method. When we are far from the minimizer, the step chosen by the Newton method can be very poor and even lead to divergence of the iteration. (In fact, the step isn't even well defined when the model Hessian isn't positive definite.) So we just look to make a little progress in the direction of $d$ instead. Specifically, we assume that we can find $\lambda >0$ satisfying the *Armijo rule*

$$ m(\lambda) - f(x_c) <  \alpha \lambda (g(x_c)^Td) < 0,$$

for a constant $\alpha\in(0,1)$. The traditional choice is $\alpha=10^{-4}$; the main point is to keep it small (and so not very demanding) but bounded away from zero. The idea of seeking such a $\lambda$ is called a *line search* strategy.

The recommended approach to finding $\lambda$ is to use *backtracking*: If $\lambda=1$ is successful, use that; otherwise choose a constant $\beta<1$ and find the smallest integer $k$ such that $\lambda=\beta^k$ satisfies Armijo. If an iteration built on this rule converges, then it will converge to a point satisfying the necessary conditions for minimization (provided the Hessians used above are uniformly positive definite.

Another well-known strategy is to build a cubic interpolant to $m$ and minimize that to find $\lambda$. See section 3.2.1 of Kelley for details. 