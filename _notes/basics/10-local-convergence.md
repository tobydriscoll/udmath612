---
layout: note
chapter: "Basics of Newton-like methods"
title: "Local convergence"
---
* TOC
{:toc}

For concreteness, let's stick to the problem of minimizing $f$. We seek a local minimizer $r$ such that $\nabla f(r)=0$ and $\nabla^2 f(r)$ is positive definite. For theoretical reasons it's convenient to add a Lipschitz condition, $\\| \nabla f(x) - \nabla f(y) \\| \le \gamma \\|x-y\\|$ for a constant $\gamma$ and all $x$, $y$ in a neighborhood of $r$. 

With these assumptions, Theorem 2.3.3 states that there is a ball $B$ around $r$ such that if one starts the Newton iteration inside $B$, it converges quadratically to $r$. But this is really the beginning of the story, not the end.

## Cheating on the Hessian

Consider that $f$ is a scalar, the gradient is an $m$-vector, and the Hessian is an $m\times m$ matrix. Even computing the Hessian (both writing and executing the code) sounds like a lot more work than computing $f$ itself. But we even have to solve a linear system with this matrix, which is $O(m^3)$ in the general case. So we are always looking for ways to cheat when it comes to the Hessian.

An extreme variation is to declare that you are only going to compute the Hessian (and its Cholesky factorization) once, then use it to define all the Newton steps. This is the *chord method*, and per Theorem 2.3.5, your laziness knocks the convergence rate all the way down to linear.

So maybe we should back down a bit and consider what happens if we do things imprecisely. So suppose that at every iteration we get the Hessian wrong by a matrix $E$ and the gradient by a vector $\epsilon$. Theorem 2.3.4 states that for sufficiently close, etc., there is a constant $K$ such that

$$\|x_+-r\| \le K\left( \|x_c-r\|^2 + \| E\| \|x_c-r\| + \|\epsilon\|\right ).$$

Thus the gradient error $\epsilon$ puts a hard absolute limit on how accurate we can get. Things are more forgiving with the Hessian: if we can get $\\|E\\|\to 0$ as the iteration proceeds, we will get back to superlinear convergence. 


## Finite differences

When the objective function $f$ is very complicated (say, including numerical integrations or solutions of differential equations), writing code to compute $g$ and $H$ is at best difficult and error-prone. One response is to approximate derivatives by finite differences. 

Consider a scalar univariate function $y(x)$. Two classic finite difference approximations are

$$ \frac{y(x_c+\delta) - y(x_c)}{\delta} = y'(x_c) + O(\delta)$$

and 

$$ \frac{y(x_c+\delta) - y(x_c-\delta)}{2 \delta} = y'(x_c) + O(\delta^2).$$

In both cases, the truncation error vanishes as the step size $\delta\to 0$, but at different rates. However, in this limit these numerators are getting poisoned by subtractive cancellation. Indeed, if we can evaluate $y$ to an accuracy of about $\varepsilon$, then roundoff error contributes roughly $O(\varepsilon/\delta)$ in both formulas. So there is an optimal $\delta$ in each formula that balances truncation and roundoff. For the first-order case it's $\delta=O(\varepsilon^{1/2})$, and for the second-order formula it's $\delta=O(\varepsilon^{1/3})$, for an error that is $O(\varepsilon^{2/3})$. That is, the higher-order formula uses more of the available precision.

So why not always use the more accurate formula? In a multidimensional situation, the perturbations $x_c\pm \delta$ all necessiate a fresh evaluation of $y$, but $y(x_c)$ remains the same in all dimensions (and is something we are computing anyway). So the 2nd order differences are about twice as expensive to evaluate. 

Hence if we use FD for the gradient, we can expect accuracy no better than $\varepsilon^{1/2}$ or $\varepsilon^{2/3}$. Remember, this limits how accurate the final result can possibly be. Differencing those again to get the Hessian means taking another $1/2$ or $2/3$ power, which can mean too little left to rely on. Standard advice is to use exact gradients if at all possible, with FD of those to get the Hessian. 

## Automatic differentiation

There are methods of *automatic differentiation* for computing derivatives numerically but exactly (within precision). One method (forward AD) is to essentially carry along both $O(1)$ and $O(\epsilon)$ terms. For example, if we set $x=2+1\epsilon$, then $x^4 = 16 + 4(2^3)\epsilon$, and we read off the derivative as 32. This can be programmed for all the functions used to evaluate expressions numerically. A dual technique (reverse AD) records a history of a sequence of calculations, then computes the derivative backward through the sequence. In machine learning this is called *back propagation*. A third option is *source transformation*, in which a metacompiler converts your code for a function into code for the derivative. 

There are some AD software tools that are pretty easy to use. In Julia there are ForwardDiff, ReverseDiff, Nabla, Zygote, and others. Using them well and efficiently, though, usually requires an investment of time. 