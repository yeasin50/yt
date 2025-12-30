---
title: "Electricity Calculator"
date: 2025-11-25T20:00:00+06:00
weight: 9
draft: false
tags: ["c", "project", "bangla", "beginner"]
categories: ["C"]
---

How to build a complete Electricity Bill Calculator in C, using a tier-based billing system.
In this Bangla tutorial, you’ll understand the logic behind electricity units, slabs, and how to calculate the final bill.
Perfect for beginners working on C programming projects!

{{< youtube amML5bXbJ9Y >}}

<br>

## Final code

```c
#include <stdio.h>

///  calculate bill for a single [tier]
float calculateTierBill(float unit, int tierLimit, int rate){
 int billedUnit =  unit<tierLimit ? unit: tierLimit;
 return billedUnit * rate;
}

int main(){
    /// bill tiers
    int tierLimits[] = {50, 75, 100, 200};
    int rates[] = {5, 7, 9, 10};
    int totalTiers = sizeof(rates) / sizeof(rates[0]);

    float totalUnits;
    printf("Enter total used unit: ");
    if(scanf("%f", &totalUnits)!=1 || totalUnits <0){
        printf("Invalid input\n");
        return 0;
    }

    ///  total bill
    float billed = 0;
    float remainingUnits =  totalUnits;
    int i=0;

    while(remainingUnits >0){

        float tierBill;
        if(i< totalTiers){

            tierBill = calculateTierBill(remainingUnits, tierLimits[i], rates[i]);
            float billedUnit  =  remainingUnits < tierLimits[i]? remainingUnits: tierLimits[i];
            remainingUnits -= billedUnit;

        }else {
           tierBill =  remainingUnits * rates[totalTiers-1];
           remainingUnits =0 ;
        }

        billed += tierBill;
        i++;
    }

   printf("Billed amount %.2f tk\n", billed);
    return 0;
}
```
