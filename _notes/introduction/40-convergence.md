---
layout: note
chapter: "Introduction"
title: "Convergence rates"
---
* TOC
{:toc}

There are some technicalities you must pay attention to (such as notions of q- and r-convergence) if you want to prove some theorems in this area. But we're going to skim on the surface of all that. The essence of the matter is the difference between linear and superlinear convergence. Convergence of the sequence $x_n$ to $r$ is *linear* if 

$$ \frac{\|x_{n+1}-r\|}{x_{n}-r\|} \to \sigma \in (0,1)$$

as $n\to\infty$, and it's *superlinear* if 

$$ \frac{\|x_{n+1}-r\|}{x_{n}-r\|} \to 0 $$

in the limit. You can give the convergence an order $\alpha>1$ if  

$$ \|x_{n+1}-r\| \le K \| x_{n}-r\|^\alpha $$

for constant $K$ and sufficiently large $n$. The case $\alpha=2$ is *quadratic convergence*. 

The major practical distinction is linear/superlinear, not the exact value of $\alpha$. Usually we are able to use algorithms that converge superlinearly, and linear convergence may be taken as a sign that something's wrong. 