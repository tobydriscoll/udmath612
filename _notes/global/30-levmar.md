---
layout: note
chapter: "Globalizing convergence"
title: "Levenberg-Mauquardt"
---
* TOC
{:toc}

When nonlinear least squares is solved by applying the Armijo rule to the usual Gauss-Newton step, the result is called *damped Gauss-Newton*. It's fine as long as the GN step is a descent direction, but this does not always work out in practice. 

A nice answer to that problem is the *Levenberg-Mauquardt* method, which may be the workhorse of nonlinear LS. Suppose we minimize $\\|F\\|$ for a map $F$ from $n$ variables to $m\ge n$ constraints. Recall that GN defines its search direction as the solution of the linear least squares problem $J(x_c)s \approx -F(x_c)$, where $J$ is the $m\times n$ Jacobian. Now we introduce a damping or penalty parameter $\mu \ge 0$ and instead solve

$$ \min \left \| \begin{bmatrix} J(x_c) \\ \mu I \end{bmatrix} s - \begin{bmatrix} -F(x_c) \\ 0 \end{bmatrix} \right \| $$

for the search direction $s$. As $\mu \to 0$, this is identical to GN. But as $\mu\to \infty$, the normal equations approach

$$ \mu^2 s = -J(x_c)^TF(x_c),$$

which puts $s$ in the direction of steepest descent for $\\|F\\|^2$! Informally, we want $\mu$ to increase (i.e., be more like GD) when we are having trouble making progress toward a minimum, and to decrease (i.e., revert back to standard Newton) when the backtracking steps become successful at $\lambda=1$. In fact, Theorem 3.2.7 shows that quadratic convergence is achieved if $\mu=O(\\|F\\|)$ as the iteration proceeds. 

(Technically this description is Levenberg's algorithm. Marquardt [who was an alum of UD's math graduate program] changed the $I$ above to be $\text{diagm}(\sqrt{\text{diag}(J^TJ)})$, which uses some curvature information even in the case of large $\mu$.)