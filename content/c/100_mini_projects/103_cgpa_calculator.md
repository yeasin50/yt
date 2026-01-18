---
title: "CGPA & Grade Calculator in C"
date: 2025-10-27T20:00:00+06:00
weight: 3
draft: false
future: false
tags: ["c", "project", "bangla", "beginner"]
categories: ["C"]
---

Learn how to build a **CGPA & Grade Calculator in C** step-by-step.

{{< youtube J9iBncF9Er4 >}}

### Final code

```c
#include<stdio.h>

//  mark between 0 -100
float cgpa(float mark){
    if(mark>100 || mark < 0) return 0;

    else if(mark >= 80) return 4.0;
    else if(mark >= 75) return 3.75;
    else if(mark >= 70) return 3.50;
    else if(mark >= 65) return 3.25;
    else if(mark >= 60) return 3.00;
    else if(mark >= 55) return 2.75;
    else if(mark >= 50) return 2.50;
    else if(mark >= 45) return 2.25;
    else if(mark >= 40) return 2.00;
    else return 0.0;
}

// CGPA to grade,  where [cgpa] is between 0 - 4.0
char* cgpaToGrade(float cgpa) {
    if (cgpa > 4.0 || cgpa < 0) return "F";

    else if(cgpa >= 4.0) return "A+";
    else if(cgpa >= 3.75) return "A";
    else if(cgpa >= 3.5) return "A-";
    else if(cgpa >= 3.25) return "B+";
    else if(cgpa >= 3.0) return "B";
    else if(cgpa >= 2.75) return "B-";
    else if(cgpa >= 2.5) return "C+";
    else if(cgpa >= 2.25) return "C";
    else if(cgpa >= 2.0) return "D";
    else return "F";
}

///  [avg] is the mark between 0 - 100
char* calculateGrade(float avg){
    if (avg>100) return "invalid number";
    else if(avg >= 80) return "A+";
    else if(avg >= 75) return "A";
    else if(avg >= 70) return "A-";
    else if(avg >= 65) return "B+";
    else if(avg >= 60) return "B";
    else if(avg >= 55) return "B-";
    else if(avg >= 50) return "C+";
    else if(avg >= 45) return "C";
    else if(avg >= 40) return "D";
    else return "F";
}

int main(){

    int n, total=0;
    float cgpaTotal=0.0;

    printf("How many subject you like to calculate: ");
    scanf("%d", &n);

    for(int i=0; i< n; i++){
        int number ;
        printf("Enter your %d subject Mark: ", i +1);
        scanf("%d", &number);
        cgpaTotal += cgpa(number);
        total += number;
    }

    float avg  =  total/n;
    float result =   cgpaTotal / n;
    char* grade =  cgpaToGrade(result);

    printf("total number %d,  average %.2f\n", total, avg);
    printf("Your CGPA %.2f %s\n", result, grade);
    return 0;
}
```
