---
layout: note
chapter: "Basics of Newton-like methods"
title: "Stopping"
---
* TOC
{:toc}

How do you decide when to stop a Newton iteration? Suppose we have $x_1,x_2,\ldots$ that are hopefully converging to a local minimum $r$ of $f$. When should we halt the process? This can be a surprisingly vexing question in practice.

One issue is absolute versus relative criteria. Say we know $r$ exactly and so can compute the actual error. If we stop when $\\|x_n-r\\|$ is below some threshold, then we may not get a lot of accurate digits if $\\|r\\|$ is itself very small. If we try to avoid that by stopping when $\\|x_n-r\\|/\\|r\\|$ is below a threshold, then we are being unrealistic if $\\|r\\|$ is large but $\\|f(r)\\|$ is not. Usually we have to do an either/or test of the form

$$\text{error estimate} \le \epsilon_\text{abs} + \epsilon_{\text{rel}}\|x_n\|,$$

which enforces the weaker of the two conditions. 

Beyond that problem, though, is a deeper question of how to estimate the error. In practice, software typically lets you play with three different error measurements, stopping when any one is satisfied. Usually you get a return code that tells you which criterion was met, and it's a good idea to check it. 

### Small changes in $f$

One option is to stop when $\|f(x_{n+1})-f(x_n)\|$ is small enough. In theory this is a little perilous. We know there are series (like the harmonic series) whose terms vanish but whose sums diverge, so it's possible to engineer examples in which $f(x_n)=\sum (f(x_{k+1})-f(x_k))$ marches to infinity while the terms get as small as you like. In practice this is rare, but worth keeping in mind.

### Small gradient

Since first-order optimality requires $\nabla f$ to be zero, we could stop when $\\|\nabla f(x_n)\\|$ is small. In order to scale this as a relative criterion, we might use $\\|\nabla f(x_0)\\|$ or some externally provided number to determine the relative error.

### Small changes

In a pure Newton iteration, the errors decrease quadratically. Thus

$$ \| x_+ - x_c \| = \| (x_+-r) - (x_c-r) \| = \| (x_c-r) \| + O(\| (x_c-r) \|^2).$$

Thus if we demand that $\|x_+-x_c\|=O(\tau_s^{1/2})$, then

$$ \|x_+-r\| = O(\| (x_c-r) \|^2 ) = O( \| x_+ - x_c \|^2) = O(\tau_s).$$

