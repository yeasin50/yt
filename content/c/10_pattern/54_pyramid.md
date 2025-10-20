---
title: "Pyramid Patterns in C"
date: 2025-10-22T20:00:00+06:00
weight: 2
draft: false
future: true
tags: ["c", "pattern", "beginner", "bangla"]
categories: ["C"]
---

## Pyramid Top to Bottom

{{< youtube jIxlEGrg5bA >}}

#### Print pyramid patterns from top to bottom.

```c
#include <stdio.h>

int main() {
  int n;
  printf("Enter Number of rows:");
  scanf("%d", &n);

  for (int i = 0; i < n; i++) {

    for (int s = 0; s < n - i - 1; s++)
      printf(" ");

    for (int j = 0; j < 2 * i + 1; j++) {
      printf("*");
    }

    printf("\n");
  }
  return 0;
}
```

## Upside Pyramid

{{< youtube At2owNhOJxQ >}}

#### Print upside-down pyramid patterns step by step.

```c

#include <stdio.h>

int main() {
  int n;
  printf("Enter Number of rows:");
  scanf("%d", &n);

  for (int i = 0; i < n; i++) {

    for (int s = 0; s < i; s++)
      printf(" ");

    for (int j = 0; j < 2 * (n - i) - 1; j++) {
      printf("*");
    }

    printf("\n");
  }
  return 0;
}

```

---

## Hollow Upside Pyramid

{{< youtube 6smqeA0gRK0 >}}

```c
#include <stdio.h>

int main() {
    int n ;
    printf("Enter Number of rows:");
    scanf("%d", &n);

    for (int i=0; i< n; i++){

        for(int s=0; s<i;s++)
            printf(" ");

        for(int j=0; j<2*(n-i)-1; j++){
           if(j==0||i==0 ||j==2*(n-i)-2 ) printf("*");
           else printf(" ");

        }

        printf("\n");
    }
    return 0;
}
```

## Pyramid with Space

{{< youtube orKQKoTmVUc >}}

#### Top to bottom

```c
#include <stdio.h>

int main() {
    int n ;
    printf("Enter Number of rows:");
    scanf("%d", &n);

    for (int i=0; i< n; i++){

        for(int s=0; s<n-i-1;s++)
            printf(" ");

        for(int j=0; j<2*i+1; j++){
           if(j==0||i==n-1 ||j==2*i) printf("*");
           else printf(" ");

        }

        printf("\n");
    }
    return 0;
}
```
