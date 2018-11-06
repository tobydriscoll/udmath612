---
layout: note
chapter: "Globalizing convergence"
title: "Steepest descent"
---
* TOC
{:toc}

Pure Newton is great and all, but success is guaranteed only asymptotically and when starting "sufficiently close" to the solution. In practice finding a good starting point is often the hardest part of the problem. We need to marry Newton with some techniques that keep us making progress until the superlinear magic kicks in.

There are two major types of globalizing techniques: *line search* and *trust region*. Optimization pros seem to like trust regions more, but I am hard pressed to find clear-cut advantages manifested consistently in practice. Both approaches seem to have lots of life left in them.

To kick things off with line searches in function minimization, we consider a non-Newton method called *steepest descent*. 