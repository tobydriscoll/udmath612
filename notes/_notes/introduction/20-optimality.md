---
layout: note
chapter: "Introduction"
title: "Optimality conditions"
---
* TOC
{:toc}

It's easy to know when we have arrived at a root of the vector-valued $F$: its value is zero! But characterizing a minimum of the scalar $f$ is a bit more nuanced. 

Keep in mind the expansion (for an $f$ with two continuous derivatives)

$$ f(x) = f(r) + g^T (x-r) + \frac{1}{2} (x-r)^T H (x-r) + o(\|x-r\|^2),$$

where $g=\nabla f(r)$ is the gradient and $H=\nabla^2f(r)$ is the symmetric Hessian matrix.

## Necessary conditions

Theorem 1.3.1 states that if $r$ is a minimizer of $f$, then $g=0$ and $H$ is positive semidefinite. Semidefiniteness modifies positive definiteness to allow $u^THu$ to be zero for nonzero vectors $u$. These conditions together imply that in the expansion above, there are no ways to get smaller than $f(r)$ using the linear and quadratic terms. 

The condition $g=0$ is called the *first-order necessary condition* for a minimum. When it holds then we might say $r$ is a *stationary point*.

## Sufficient conditions

Unfortunately, the ignored higher-order terms in the expansion can cause a decrease in value when $g=0$ and we choose $x-r$ to be a direction in which the quadratic term is zero. If we can rule out those zero directions, we have sufficient conditions. This is stated in Theorem 1.4.1: given $g=0$ and a positive definite $H$, then $r$ is a local minimizer of $f$.

This is usually the situation we assume in our algorithms. 