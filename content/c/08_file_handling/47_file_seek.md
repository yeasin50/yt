---
title: File SEEK
date: 2025-11-27T19:00:00+08:00
weight: 2
draft: false
future: true
tags:
  - c
  - file
  - beginner
  - bangla
categories:
  - C
---

## Get & Update Cursor Position

**File Seek** ব্যবহার করে cursor position পাওয়া এবং update করা যায়। ভিডিওতে দেখানো হয়েছে ftell এবং fseek ব্যবহার, cursor move, text replace, এবং practical examples step by step। Beginners এবং self-learners এর জন্য সহজ ব্যাখ্যা।

{{< youtube cFiMC3mYEHQ >}}

## fseek() কী?

- `fseek()` দিয়ে ফাইল পয়েন্টারকে ফাইলের যেকোনো স্থানে সরানো যায়।
- Syntax:

```c
int fseek(FILE *stream, long int offset, int whence);
```

_offset_ হলো কত দূরে সরাতে হবে। _whence_ হলো কোন পয়েন্ট থেকে শুরু হবে:

- `SEEK_SET` — ফাইলের শুরু থেকে
- `SEEK_CUR` — বর্তমান অবস্থান থেকে
- `SEEK_END` — ফাইলের শেষে থেকে

## `ftell()` কী?

`ftell()` দিয়ে বর্তমান ফাইল পয়েন্টারের অবস্থান জানা যায়।

Syntax:

```c
long int ftell(FILE *stream);
```

## code

```c
#include <stdio.h>

int main() {

  FILE *newFile = fopen("my_file.txt", "r+");
  if (newFile == NULL) {
    printf("failed to open the file.\n");
    return 1;
  }

  fseek(newFile, 4, SEEK_SET);
  fputs("C lover", newFile);

  fclose(newFile);

  return 0;
}
```
