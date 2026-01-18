---
title: "Currency Converter"
date: 2025-11-23T20:00:00+06:00
weight: 8
draft: false
future: true
tags: ["c", "project", "bangla", "beginner"]
categories: ["C"]
---

Build a Currency Converter in C that can convert between USD, BDT, Gold value, and more!
This Bangla tutorial explains the logic step-by-step, shows the full code, and includes a recap to help beginners understand everything clearly.

{{< youtube 34YqodtWE0s >}}

<br>

## Final code

```c
#include <stdio.h>

///  show gold price on each  currency
void calculateGoldPrice(float gram) {
    double rateBDT = 16028.0;
    double rateUSD = 131.19;
    double rateEUR = 113.05;

    printf("Gold Price for %.5f gram\n", gram);
    printf("BDT: %.2f\n", gram * rateBDT);
    printf("USD: %.2f\n", gram * rateUSD);
    printf("EUR: %.2f\n", gram * rateEUR);
}


int main(){

   int choice;
   printf("Select conversion:\n");
   printf("1. USD to BDT\n");
   printf("2. BDT to USD\n");
   printf("3. USD to EUR\n");
   printf("4. Gold Price\n");
   printf("Enter choice: ");
   scanf("%d", &choice);

   float amount;
   printf("Enter amount:");
   scanf("%f", &amount);

   if(amount < 0){
       printf("Invalid amount\n");
       return  0;
   }
   printf("\n");
   switch (choice) {
       case 1:
           printf("BDT %.2f\n", amount * 120);
           break;
      case 2:
           printf("USD %.2f\n", amount / 120);
           break;
      case 3:
           printf("EUR %.2f\n", amount * .92);
           break;
      case 4:
           calculateGoldPrice(amount);
           break;
     default:
           printf("Invalid input\n");
   }
   return 0;
}

```
