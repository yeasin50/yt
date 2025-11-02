---
title: "Quiz Game in C (File-Based)"
date: 2025-10-28:00:00+06:00
weight: 4
draft: false
future: true
tags: ["c", "project", "bangla", "beginner"]
categories: ["C"]
---

Build a **Quiz Game in C** that reads questions from a file!  
We also learn from **hardcoded questions** first before moving to file-based input.

{{< youtube NRBbjLiWMu4 >}}

<br>

**What You’ll Learn:**

- Reading questions and answers from a file
- Using arrays and strings to manage data
- Implementing scoring logic

---

## txt file data

Our `quiz.txt` file contains questions in the following format:

- The first line is the question.
- The next 4 lines are the options.
- The line after that contains the correct answer number (not the index).

> Make sure to **preserve this format** exactly. Feel free to extend the questions.

```txt
Which of the following is used to print output in C?
scanf()
printf()
getchar()
gets()
2
What is the correct way to declare an integer variable in C?
int x;
integer x;
var x;
float x;
1
Which symbol is used to end a statement in C?
#
;
:
.
2
```

---

## Final output

```c
#include <stdio.h>
#include <stdlib.h>

typedef struct Question {
    char question[200];
    char option[4][50];
    int correct;
} Question;


int main(){

    int score =0;

    FILE *file  =  fopen("quiz.txt","r");
    if (!file) {
        printf("failed to open the file\n");
        return 0;
    }

    Question q ;
    while(fgets(q.question, sizeof(q.question),file)){

        for(int j =0; j<4 ; j++)
            fgets(q.option[j], sizeof(q.option[j]), file);

        fscanf(file, "%d\n",&q.correct);

        printf("%s\n",q.question);
        for(int j =0; j<4 ; j++)
            printf("%d : %s",j+1,q.option[j]);

        int userInput;
        printf("Enter your answer:");
        scanf("%d", &userInput);
        if(userInput == q.correct){ score++;}
        else printf("wrong answer");

        putchar('\n');
        putchar('\n');

    }

    printf("Score %d\n",score);

    return 0;
}
```
