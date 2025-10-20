---
title: "Triangle Patterns in C"
date: 2025-10-19T20:00:00+06:00
weight: 1
draft: false
future: true
tags: ["c", "pattern", "beginner", "bangla"]
categories: ["C"]
---

## Star Triangle

{{< youtube Hd6j4wOuOmk >}}

#### Left Triangle

```c
#include <stdio.h>

int main() {

    int n ;
    printf("Enter Number of rows:");
    scanf("%d", &n);

    for(int i=1; i<=n;i++){

        for(int j=1; j<=i; j++){
            printf("%c",64+j);
        }
        printf("\n");
    }

    return 0;
}
```

> In C, braces { } group multiple statements into a block. You can skip them for a single statement, but using { } is safer and improves readability.

## Right Triangle

{{< youtube 8ThmKqZjOjI >}}

#### Print right triangle patterns step by step.

```c
#include <stdio.h>

int main() {

  int n;
  printf("Enter Number of rows:");
  scanf("%d", &n);

  for (int i = 1; i <= n; i++) {

    for (int s = n - i; s > 0; s--)
      printf(" ");
    for (int j = 1; j <= i; j++) {
      printf("*");
    }
    printf("\n");
  }

  return 0;
}
```

## Upside Triangle

{{< youtube cdexY1uIVX0 >}}

#### Left Upside down

```c
#include <stdio.h>

int main() {

    int n ;
    printf("Enter Number of rows:");
    scanf("%d", &n);

    for(int i=n; i>0;i--){

        for(int j=1; j<=i; j++){
            printf("%c",64+j);
        }
        printf("\n");
    }

    return 0;
}
```

#### Right Upside down

```c
#include <stdio.h>

int main() {

    int n ;
    printf("Enter Number of rows:");
    scanf("%d", &n);

    for(int i=n; i>0;i--){
        for(int s= n-i; s>0; s--)
            printf(" ");

        for(int j=1; j<=i; j++){
            printf("%c",64+j);
        }
        printf("\n");
    }

    return 0;
}
```
