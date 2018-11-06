---
layout: note
chapter: "Introduction"
title: "The Newton idea"
---
* TOC
{:toc}

If you've seen Newton's (or the Newton-Raphson) method for a root of a univariate $F(x)$ before, then you know that the idea is to replace $F$ with a model approximation whose root we can find exactly. That is, given a tentative value $x_c$ to estimate the root $r$, define an improved (?) value $x_+$ by solving the linear model $F(x_c) + F'(x_c)(x-x_c)$ for $x$. If we now interpret this multidimensionally, we get

> Solve $F'(x_c)s = -F(x_c)$ for $s$. Then let $x_+=x_c+s$. 

In this simple form, Newton's method turns the nonlinear system problem into a sequence of linear systems.

In the case of minimization, a linear model in the neighborhood of $x_c$ would be $f(x_c) + g(x_c)^T(x-x_c)$. But if we head in the direction of $-g$, this decreases forever. So instead we consider the quadratic model

$$q(x) = f(r) + g(x_c)^T (x-x_c) + \frac{1}{2} (x-x_c)^T H(x_c) (x-x_c).$$

Sufficient conditions for a minimizer of $q$ are a zero of 

$$ \nabla q(x) = g(x_c) + H(x_c)(x-x_c),$$

and the positive definiteness of $\nabla^2 q(x)=H(x_c)$. There's not much we can do about the latter condition; if it does not hold, we will need to address that later. But it should hold "close enough" to the true minimizer, if it satisfies sufficient conditions. And we can make the gradient of $q$ zero at a unique point,suggesting the iteration

> Solve $H(x_c)s=-g(x_c)$ for $s$, then set $x_+=x_c+s$.

So the details differ, but in both cases you solve a linear system to get a "pure" *Newton step* $s$, which is used to increment the solution. This is the theme on which a lot of algorithms riff. 