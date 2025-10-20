---
title: "Dynamic Memory uses"
date: 2025-10-15T19:00:00+08:00
weight: 2
draft: false
future: true
tags: ["c", "Dynamic Memory", "beginner", "bangla"]
categories: ["C"]
---

## Create

{{< youtube 3XQFVTTToy8 >}}

Lets create an integer array of 3 elements.

> Dynamic Memory behaves like an array, and its dataType specified by the type of pointer.

```c
int size  = 3 * sizeof(*int);
int *ptr = malloc(size);
```

Now we can use 0,1,2 indexes to access the Memory;

```c
ptr[0] =5;  // we can also  use `*ptr` while default it point to 1st index(0)
ptr[2] = 4;

printf("%d \n", ptr[2]);
```

> We can also use `calloc(3, sizeof(*ptr))`

## Extend the size

Let's increase the size and make it 10. Also make sure if there are any issues by checking null.

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
