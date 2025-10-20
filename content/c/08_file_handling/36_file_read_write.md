---
title: "Read & Write file"
date: 2025-11-27T19:00:00+08:00
weight: 1
draft: false
future: true
tags: ["c", "file", "beginner", "bangla"]
categories: ["C"]
---

### Write Files

আমরা জানব `fopen()`, `fclose()`, `fscanf()`, এবং `fprintf()` ফাংশনগুলো কীভাবে ব্যবহার করতে হয়।

{{< youtube SF8ePZ76Es8 >}}

##### ফাইল ওপেন এবং ক্লোজ

- `fopen()` ফাইল ওপেন করার জন্য।
- `fclose()` ফাইল ক্লোজ করার জন্য।
- `fopen()` এর সিঙ্কট্যাক্স:

```c
FILE *fp = fopen("filename.txt", "mode");
```

- `mode` হতে পারে:
- `r` - পড়ার জন্য
- `w` - লেখার জন্য (ফাইল থাকলে ওভাররাইট হবে)
- `a` - যোগ করার জন্য (append)

ফাইল থেকে পড়া: fscanf()
fscanf() ব্যবহার করে ফাইল থেকে ফরম্যাটেড ডেটা পড়া যায়।

```c
int num;
fscanf(fp, "%d", &num);
```

ফাইল লিখা: fprintf()
fprintf() ব্যবহার করে ফাইলে ফরম্যাটেড ডেটা লেখা যায়।

```
fprintf(fp, "Number: %d\n", num);
```

`gcc product.c -o product.exe`

#### Code

```c
#include <stdio.h>

int main() {
    FILE *fp = fopen("data.txt", "w");
    if (fp == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    fprintf(fp, "Hello, Bangla Tutorial!\n");
    fclose(fp);

    fp = fopen("data.txt", "r");
    if (fp == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    char str[100];
    fscanf(fp, "%[^\n]", str);
    printf("Read from file: %s\n", str);
    fclose(fp);

    return 0;
}
```

## Read full text

```c
#include <stdio.h>

int main() {
    FILE *fp = fopen("my_text_file.txt", "r");
    if (fp == NULL) {
        perror("Error opening file");
        return 1;
    }

    char str[100];

    while (fgets(str, sizeof(str), fp) != NULL) {
        puts(str);
    }

    fclose(fp);
    return 0;
}
```
