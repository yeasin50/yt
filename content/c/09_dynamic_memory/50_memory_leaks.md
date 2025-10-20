---
title: Memor leaks
date: 2025-10-15T19:00:00+08:00
weight: 7
draft: false
future: true
tags:
  - c
  - Dynamic Memory
  - beginner
  - bangla
categories:
  - C
---

Memory leak happens when create dynamic Memory but doesn't release :)
Means when we don't use `free` .

```c
    int *ptr = malloc(N);
    // and we don't use `free(ftr)`
```

## function Memory Leak

A common mistake of Memory leak happens when we create dynamic Memory inside function and forget to free it.

```c
void func(){
    int *ptr;
    ptr =  malloc(sizeof(*ptr));
    /// ..... rest code
    /// we should free ptr end of its uses.
}
```

## Reallocation Memory leak

We can often forget to free old pointer and set null which is better practice.

```c
int *newPtr = realloc(ptr,10);
if (newPtr == NULL){
    printf("failed to allocated\n");
}else {
    printf("reallocated\n");
    // we can assign and free new `ptr`
    ptr =  newPtr;
    free(newPtr);
}
```
