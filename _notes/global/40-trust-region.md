---
layout: note
chapter: "Globalizing convergence"
title: "Trust region methods"
---
* TOC
{:toc}

The main alternative to a line search strategy is the *trust region subproblem*. 

Suppose we are given a quadratic model $q(x)$ based on data at a point $x_c$. We trust the model somewhat, but much less as we get far from $x_c$. So suupose we constrain the mimimization of the model as follows: 

$$\text{argmin}_{\|s\|\le \Delta} q(xc+s),$$

where $\Delta$ is a parameter known as the *trust radius*. 

Assuming that the solution of the TR subproblem can be found readily, it leaves us with two choices: whether to accept $x_c+s$ as the next iterate (i.e., some kind of sufficient decrease criterion), and whether to adjust $\Delta$ for the next subproblem. The details of these choices and not simple and matter quite a bit, but we won't get into them here. 

## The dogleg

It's typical to suggest that a precise solution of the TR subproblem is not necessary (it's only a model). Again, the full details are quite messy, but the idea is to constrain the problem along the direction of gradient descent point (that again!), the Newton step direction, or some piecewise linear path based on these two directions (the "dogleg"). When it's all done right, you can guarantee superlinear convergence. 

## The L-M connection

Theorem 3.3.3 states an intriguing connection to the Levenberg-Marquardt idea of a "damped" Hessian. If $g$ and $H$ are the gradient and Hessian of the quadratic model $q$, then the solution $s$ of the TR subproblem satisfies

$$(H+\mu I)s=-g,$$

where either $\mu=0$ or $\|s\|=\Delta$. In the former case, the Hessian is positive definite and the global minimizer of $q$ lies within the trust region. This is our asymptotic expectation. The alternative is that the TR constraint is "active." This would be necessary if $H$ has negative eigenvalues and thus $q$ has no global minimum, but it can also happen that $H$ is PD and our limited faith in the model is decisive. 

The downside is that while $\mu$ and $\Delta$ are related, the relationship is not known explicitly. However, it means that in the LM algorithm we don't need to use Armijo and line search. Since using $\mu$ is equivalent to the TR subproblem, the TR convergence theory guarantees that it is enough to adjust $\mu$ and meet the general TR criteria.
