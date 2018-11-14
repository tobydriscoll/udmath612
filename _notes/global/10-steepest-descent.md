---
layout: note
chapter: "Globalizing convergence"
title: "Steepest descent"
---
* TOC
{:toc}

Pure Newton is great and all, but success is guaranteed only asymptotically and when starting "sufficiently close" to the solution. In practice finding a good starting point is often the hardest part of the problem. We need to marry Newton with some techniques that keep us making progress until the superlinear magic kicks in.

There are two major types of globalizing techniques: *line search* and *trust region*. Optimization pros seem to like trust regions more, but I am hard pressed to find clear-cut advantages manifested consistently in practice. Both approaches seem to have lots of life left in them.

To kick things off with line searches in function minimization, we consider a non-Newton method called *steepest descent*, or *gradient descent*. The method is simple: since the negative gradient is the direction of local maximum decrease, use that as a "search direction" and make the problem one-dimensional. That is, operate with the model

$$ m(\lambda) = f(x_c - \lambda g(x_c)), \quad \lambda > 0.$$

It's tempting to try to simply minimize $m$, but that's probably too much effort relative to its fidelity to the true $f$. Instead we typically settle for a "good enough" reduction in $f$, in a sense to be made precise in the next section. 

Asymptotically the convergence of GD is linear, and the lack of curvature information about $f$ makes it slow when the variable components have very different scalings. For example, consider the bivariate function

$$f(x,y) = (\epsilon x^2 + y^2)/2,$$

whose minimizer is the origin. It's easy to work out $m(\lambda)=[x_c^2(1-\epsilon\lambda)^2 + y_c^2(1-\lambda)^2  ]/2$. Even if we minimize $m$ to get the next iterate $(x_+,y_+)$, we find that $x_+=x_c(1 - \epsilon)+O(\epsilon^3)$, which is painfully slow progress as $\epsilon\to 0$. 

More generally, if $H$ is the Hessian of $f$ at the minimizer, then the convergence of GD is linear with rate $(\kappa(H)-1)/(\kappa(H)+1)$. See section 3.2.2 of Kelley for a longer discussion. 

Historically GD was described as a "bad" algorithm. But that's misguided on at least two counts. First, since it does guarantee a local decrease in $f$, it can and does provide a safe backup search direction when one is far from a minimizer and the Newton step direction is poor. Second, GD has gotten new life in optimization methods for machine learning, where it has some advantages in terms of continuously updating for new information and massive parallelism when the number of variables is very large. 