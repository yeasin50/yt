---
title: File append
date: 2025-11-27T19:00:00+08:00
weight: 2
draft: false
future: true
tags:
  - c
  - beginner
  - bangla
categories:
  - C
---

### Extend text file

কিভাবে **File Append** ব্যবহার করে ফাইলের শেষে নতুন text add করা যায়। ভিডিওতে step by step code example, practical demonstration এবং beginner-friendly explanation দেখানো হয়েছে।

{{< youtube uRTl8RpivKM >}}

<br>

#### Code

```c
 #include <stdio.h>

int main() {
    FILE *newFile = fopen("my_file.txt", "a+"); // append + read
    if (newFile == NULL) {
        printf("failed to open the file.\n");
        return 1;
    }

    // Write 10 lines
    for (int i = 0; i < 10; i++)
        fputs("something\n", newFile);

    // Rewind to start of file before reading
    rewind(newFile);

    char str[100];
    while (fgets(str, sizeof(str), newFile) != NULL) {
        puts(str);
    }

    fclose(newFile);
    return 0;
}
```
