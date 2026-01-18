---
title: "Temperature Converter"
date: 2025-11-21T20:00:00+06:00
weight: 7
draft: false
future: true
tags: ["c", "project", "bangla", "beginner"]
categories: ["C"]
---

How to build a Temperature Converter in C that can convert between Celsius, Fahrenheit, and Kelvin.
This beginner-friendly Bangla tutorial explains the logic step by step and includes full coding examples.

{{< youtube BMyDPgko94E >}}

<br>

## Final code

```c
#include <stdio.h>

// show welcome message to choose conversion option
void welcome(){
    printf("Select conversion:\n");
    printf("1. Celsius to Fahrenheit\n");
    printf("2. Fahrenheit to Celsius\n");
    printf("3. Celsius to Kelvin\n");
    printf("4. Kelvin to Celsius\n");
}

int main(){
   int selectedOption;
   float temp;
   welcome();
   printf("Enter your choice:");
   scanf("%d", &selectedOption);

   printf("Enter temperature:");
   scanf("%f", &temp);

    switch (selectedOption) {
        case 1:
            printf("Farenheight: %.2f\n", (temp * 9/5) + 32);
            break;
        case 2:
            printf("Celsius: %.2f\n", (temp -32) * 5/9);
            break;
        case 3:
            printf("Kelvin: %.2f\n", temp+ 273.15);
            break;
        case 4:
            if(temp < 0){
              printf("Kelvin can not be smaller than 0\n");
            }else {
              printf("Kelvin: %.2f\n", temp - 273.15);
            }
            break;
        default:
            printf("Invalid choice\n");
    }
}
```
