---
title: "Recursive Fibonacci Explained"
date: 2025-09-24T19:00:00+07:30
weight: 1
draft: false
future: true
tags: ["c", "beginner", "bangla", "Practice-code", "function", "Recursion"]
categories: ["C"]
---

কীভাবে Nth Fibonacci বের করা, recursion কাজ করার প্রক্রিয়া, এবং পুরো Fibonacci series তৈরি করা step by step।

{{< youtube  4aV4AxLqhAY >}}

<br>

Recursive Factorial

```c
int fibonacci(int n){
    if (n==0 || n ==1 ) return n;

    else
        return fibonacci(n-1) +fibonacci(n-2);
}
```

#### How it works

When n is 4,

![steps](/yt/images/19_fibonacci.svg)
