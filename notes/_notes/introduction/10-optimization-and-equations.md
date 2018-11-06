---
layout: note
chapter: "Introduction"
title: "Optimzation and nonlinear equations"
---
* TOC
{:toc}

## Two major problems

There are two ways to extend from linear algebra into nonlinear problems. One of these is the *nonlinear rootfinding problem*:

> Given a map ${F}$ from $\mathbb{R}^m$ to itself, find ${r}$ such that ${F}({r})={0}$. 

The other is the *minimization problem*:

> Given a map $f$ from $\mathbb{R}^m$ to $\mathbb{R}$, find ${r}$ such that $f(r)$ is minimized.

These can be translated back and forth, to some extent. For example, given a vector-valued $F$ whose root we want to find, we can instead seek a minimium of the scalar-valued function $f(x)=\|F(x)\|^2/2$. This is called a *nonlinear least squares problem*. Conversely, given an $f$ we want to minimize, we can search for a root of the gradient $\nabla f$. Thus, statements and algorithms in one of these worlds can be translated into the other. However, the two problems have some distinct features, and for the most part they should be considered separately. 

## Multidimensional expansions

Our main tool will be to assume sufficient smoothness in $F$ or $f$ so that we can expand and truncate a series about a given value. For $F$ this looks like

$$ F(x) = F(r) + F'(r)(x-r) + O(\|x-r\|^2),$$

where $F'(r)$ is the Jacobian matrix. In the case of minimization we have 

$$ f(x) = f(r) + \nabla f(r)^T (x-r) + \frac{1}{2} (x-r)^T \nabla^2f(r) (x-r) + o(\|x-r\|^2),$$

where $\nabla f$ is the *gradient vector* and $\nabla^2f$ is the symmetric *Hessian matrix* of all second partial derivatives. 

## Conditioning

It's worth taking a moment to consider what we can expect when solving these problems in finite precision. 

For the rootfinding problem, the "data" is the function $F$. Thus we are interested in the variation of the root $r$ with respect to $F$; i.e. the inverse of the Jacobian matrix $F'(r)$. (Or in the expansion above, a perturbation in the value is linked to $(x-r)$ by the inverse of $F'(r)$.) So for instance, if $F'(r)$ is singular, then we know that a perturbation of the root in a singular direction will remain (to first order) a root, so the root is ill-posed. The condition number of $F'(r)$ is more generally a good indicator of root sensitivity. Note that this generalizes what we already know from the linear problem $F(x)=Ax-b$.

For the minimization problem, at a smooth minimizer $r$ we have $\nablaf=0$ in the expansion above. Thus a perturbation to $f$ of size $\epsilon$ suggests that $\|x-r\|=O(\sqrt{\epsilon})$. In other words, even in the best case we are going to lose half of machine precision. Furthermore, the $O()$ hides a constant that grows as the Hessian nears singularity. 