---
title: "BMI calculator"
date: 2025-10-29T20:00:00+06:00
weight: 6
draft: false
future: true
tags: ["c", "project", "bangla", "beginner"]
categories: ["C"]
---

We convert feet & inches to meters, calculate BMI, and show BMI category/status step by step — perfect for beginners learning C programming.

{{< youtube fsE2LyQs_9s >}}

<br>

## Final code

```c
#include <stdio.h>

/// convert feet and inch  to meter
float convertFeetInchToMeter(int feet, int inch) {
  return (feet * .3048) + (inch * .0254);
}

/// calculate BMI from  [weight] in kg and [height] in meter
float bmi(float weight, float height) { return weight / (height * height); }

/// show message according to [bmi] which  is a float
void showBMIMessage(float bmi) {
  if (bmi < 18.5) {
    printf("status: Underweight\n");
  } else if (bmi < 24.9) {
    printf("status: Normal\n");
  } else if (bmi < 29.9) {
    printf("status: Overweight\n");
  } else {
    printf("status: Obesity\n");
  }
}

int main() {
  float inch, feet, weight;

  printf("\nEnter your weight(kg): ");
  if (scanf("%f", &weight) != 1) {
    printf("invalid user input, please provide number\n");
    return 0;
  }

  printf("Enter your height(feet inch): ");
  if (scanf("%f %f", &feet, &inch) != 1) {
    printf("invalid user input, please provide number\n");
    return 0;
  }

  float height = convertFeetInchToMeter(feet, inch);
  float myBMI = bmi(weight, height);
  showBMIMessage(myBMI);
}
```
