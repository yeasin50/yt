---
title: "Calculator Project"
date: 2025-10-25T20:00:00+06:00
weight: 1
draft: false
future: false
tags: ["c", "project", "beginner", "bangla"]
categories: ["C"]
---

## Simple Calculator using Switch in C

A beginner-friendly **C project** where you’ll learn to build a **Calculator** using `switch` and `functions`.

Covers input handling, operator-based execution, and error fixing - everything explained clearly in Bangla.

{{< youtube xL1qNAaheGk >}}

<br>

#### First example code

<details>
 <summary> initial code </summary>

```c
#include <stdio.h>

/// Function prototypes
float add(float a, float b);
float subtract(float a, float b);
float multiply(float a, float b);
float divide(float a, float b);

int main() {

    float a, b, result;
    char op;

    printf("Enter a:");
    scanf("%f",&a);

    printf("Enter b:");
    scanf("%f",&b);

    printf("Choose operation(+, -, *, /):");
    scanf(" %c", &op);


    switch (op) {
        case '+':
           result = add(a, b);
           break;

        case '-':
           result = subtract(a,b);
           break;

        case '*':
           result = multiply(a,b);
           break;

        case '/':
           result = divide(a,b);
           break;
    }

    printf("%.2f %c %.2f = %.2f\n", a, op, b, result);

    return 0;

}

float add(float a, float b){
    return a + b;
}

float subtract(float a, float b){
    return a - b;
}

float multiply(float a, float b){
    return a * b;
}

float divide(float a, float b){
    return a /b;
}

```

</details>

### Validate number(float)

```c
    if(scanf("%f",&a) != 1){
        printf("Invalid input\n");
        return 0;
    }
```

### validate operator

```c
    if (op != '+' && op != '-' && op != '*' && op != '/'){
        printf("Invalid operation\n");
        return 0;
    }
```

### Final code

```c
#include <stdio.h>

// Function prototypes
float add(float a, float b);
float subtract(float a, float b);
float multiply(float a, float b);
float divide(float a, float b);

int main() {
  float num1, num2, result;
  char op;

  while (1) {
      // Input numbers
      printf("Enter first number: ");
      scanf("%f", &num1);
      printf("Enter second number: ");
      scanf("%f", &num2);

      // Display menu
      printf("\nChoose operation (+, -, *, /, = to exit): ");
      scanf(" %c", &op); // space before %c to skip whitespace

      if (op == 'q') {
          printf("Exiting program.\n");
          break;
      }

      switch (op) {
          case '+':
              result = add(num1, num2);
              printf("Result: %.2f\n", result);
              break;
          case '-':
              result = subtract(num1, num2);
              printf("Result: %.2f\n", result);
              break;
          case '*':
              result = multiply(num1, num2);
              printf("Result: %.2f\n", result);
              break;
          case '/':
              if (num2 != 0) {
                  result = divide(num1, num2);
                  printf("Result: %.2f\n", result);
              } else {
                  printf("Error: Division by zero!\n");
              }
              break;
          default:
              printf("Invalid operation! Try again.\n");
      }

      printf("\n"); // Extra line before next iteration
  }

  return 0;
}

// Function definitions
float add(float a, float b) { return a + b; }
float subtract(float a, float b) { return a - b; }
float multiply(float a, float b) { return a * b; }
float divide(float a, float b) { return a / b; }
```
