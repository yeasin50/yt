---
title: "Number Guessing Game in C"
date: 2025-10-26T20:00:00+06:00
weight: 2
draft: false
future: true
tags: ["c", "project", "beginner", "bangla"]
categories: ["C"]
---

## How random works?

{{< youtube o73cg8mFTo0 >}}

<br>

```c
#include <stdlib.h>
int r = rand();
```

- Generates a pseudo-random number between `0` and `RAND_MAX`.
- Without seeding, the sequence is **the same every run**.

#### 🌱 Seeding with `srand()`

```c
#include <time.h>
srand(time(0));
```

- `srand()` sets the **starting point (seed)** for `rand()`.
- `time(0)` and `time(NULL)` both give current time in seconds since 1970.
- Using time as a seed ensures **different sequences each run**.
  "By using the current time as a seed, we make the numbers look random every time the program runs."

#### Random Numbers in a Range

To generate a number between `min` and `max`:

```c
int r = (rand() % (max - min + 1)) + min;
```

- `rand() % (max-min+1)` gives a number between `min` and `(max-min)`.
- Adding `min` shifts it to `[min, max]`.

---

## 🎯 Number Guessing Game

Learn how to make a fun **number guessing game** in C using loops and randomization.

You’ll generate random numbers with `rand()`, use conditions to check guesses, and keep the loop running until the correct number is guessed!

{{< youtube kh92_yFqkX0 >}}

## Final code

```c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int target, guess;

    // Initialize random number generator
    srand(time(NULL));
    target = rand() % 100 + 1; // random number between 1 and 100

    printf("Welcome to the Number Guessing Game!\n");
    printf("I have picked a number between 1 and 100.\n");

    while (1) {
        printf("Enter your guess: ");
        scanf("%d", &guess);

        if (guess == target) {
            printf("Congratulations! You guessed the number %d correctly.\n", target);
            break;
        } else if (guess < target) {
            printf("Too low! Try again.\n");
        } else {
            printf("Too high! Try again.\n");
        }
    }

    return 0;
}
```
