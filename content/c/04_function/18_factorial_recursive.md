---
title: Recursive Factorial Explained
date: 2025-09-23T19:00:00+07:00
weight: 3
draft: false
future: true
tags:
  - c
  - beginner
  - bangla
categories:
  - C
---

কীভাবে Factorial Function, এবং Recursive Approach ব্যবহার করে Factorial বের করা যায়।

{{< youtube  xspZsZNQOqw >}}

<br>

Recursive Factorial

```c
int factorial(int n){
    if (n==0) return 1;

    else
        return n * factorial(n-1);
}
```

#### How it works

When n is 5,

![steps](/yt/images/factorial_steps.svg)
