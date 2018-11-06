---
layout: note
chapter: "Basics of Newton-like methods"
title: "Nonlinear least squares"
---
* TOC
{:toc}

Let $F$ be a real map from $n$ to $m$ variables, with $m\ge n$. Minimizing the function

$$ f(x) = \frac{1}{2} \|F(x)\|^2 $$

is called a *nonlinear least squares* (NLS) problem. It's a generalization of both nonlinear systems of equations ($m=n$) and the linear least squares problem ($F(x)=Ax-b$). 

A common source of these problems is to estimate some unknown parameters in a computational model by comparing to observations of the system over time. Here $x$ would be a vector of the parameters, and $F(x)$ is the vector of differences between the observations and the outputs of your model. 

NLS can be solved using standard minimization applied to $f$, but there are some alternatives based on the particular form it has. 

## Series expansion 

First we point out that

$$ \frac{\partial f}{\partial x_i} = \sum_k F_k(x)  \frac{\partial F_k}{\partial x_i} = \sum_k F_k(x) J_{ki}(x),$$

so

$$ \nabla f(x) = F'(x)^T F(x).$$

Hence the FON condition requires $F(x)$ to be in the null space of $F'(x)^T$, which is the orthogonal complement of $F'(x)$. This space has dimension $m-n$. 

The Hessian is messier:

$$ \frac{\partial^2 f}{\partial x_i \partial x_j} = \sum_k \frac{\partial F_k}{\partial x_i}  \frac{\partial F_k}{\partial x_j} + \sum_k F_k(x)  \frac{\partial^2 F_k}{\partial x_i \partial x_j},$$

from which we get

$$ \nabla^2f(x) = F'(x)^TF'(x) + \sum_k F_k(x)^T \nabla^2 F_k(x).$$

(Writing this more compactly would just make us tensor.) Computing those component Hessians is clearly something we want to avoid. 

## Gauss-Newton

If the residual $\|F\|$ is small, or the curvature (as measured by Hessians of the components of $F$) is small, we should be able to drop the ugly terms from the Hessian above and use  $ \nabla^2f(x) \approx F'(x)^T F'(x) .$ Doing so makes the Newton step problem turn into

$$ (F'(x_c)^T F'(x_c))s = - F'(x_c)^T F(x_c).$$

These are the normal equations for the *linear* LS problem $F'(x_c)s \approx -F(x_c)$, which in turn is just a generalization of the standard Newton step in the square case $m=n$! This is the *Gauss-Newton* method. It turns the NLS problem into a sequence of linear least squares problems. 

Asymptotically the convergence of Gauss-Newton is characterized by Theorem 2.4.1, which states

$$ \| x_+ - r  \| \le K(  \|x_c-r\|^2 + \|F(r)\| \cdot\|x_c-r\| ).$$

Thus, once $\\|x_c-r\\|$ is reduced to about the size of the minimum residual, convergence slows to linear. Gauss-Newton can work pretty well if that final residual is small and the initial guess is good. Otherwise it needs some major help, as discussed in the next chapter.
