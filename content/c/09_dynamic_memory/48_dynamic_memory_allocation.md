---
title: "Dynamic Memory Allocation"
date: 2025-10-15T19:00:00+08:00
weight: 1
draft: false
future: true
tags: ["c", "Dynamic Memory", "beginner", "bangla"]
categories: ["C"]
---

{{< youtube jo-5T2JfkUg >}}

## Why do we need dynamic memory

When we create variable it uses static memory.
The size uses before running the program.
Sometimes we don't even know what the size will be.
And we can use dynamic memory.

> Dynamic memory is memory that is allocated after the program starts running.

Static memory is Compile time where as Dynamic memory is run time.

## Functions

We have few Functions to deal with dynamic memory.

> It is necessary to include the `<stdlib.h>` header to use them.

### `malloc()`

Allocate dynamic memory.

```c
ptr = (cast_type*) malloc(size_in_bytes);
```

### `calloc()`

We can also use `calloc()` to allocate dynamic memory but with zero, so it is little slower.

```c
ptr = (cast_type*) calloc(num_elements, size_of_element);
```

### `free()`

As a good programmer and to avoid memory leak make sure to clear the memory.

```c
free(ptr);
```

### `realloc()`

Sometimes we like to extend the size we have already have,
so we can reallocate the size.

```c
ptr = (cast_type) realloc(oldPrt, new_size);
```

It returns new null pointer which can be used to check if it is successfully created the memory.

```c
if (ptr == NULL){
    // error
} else {
    // success
    ptr = oldPrt
    free(oldPrt);
}
```

> Dynamic Memory does not have its own datatype :) It just sequence of bytes.
