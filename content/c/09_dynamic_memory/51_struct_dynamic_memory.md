---
title: "Struct Dynamic Memory"
date: 2025-10-15T19:00:00+08:00
weight: 3
draft: false
future: true
tags: ["c", "beginner", "bangla"]
categories: ["C"]
---

We will learn how to store student struct with Dynamic memory.

{{< youtube yMXVHLa9JoM >}}

## Dynamic Memory Struct

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Student {
    int id;
    char *name;
};

int main(void) {
    struct Student *s = malloc(sizeof( struct Student));

    if(!s){ // s == NULL
        perror("allocation failed");
        return 1;
    }

    scanf("%d", &s->id);


    char temp[100];
    scanf("%99s",temp);

    (*s).name = malloc(strlen(temp) + 1);

    if (!s->name){
        perror("failed to allocate name");
        free(s);
        return 1;
    }

    strcpy(s->name, temp);

    printf("\n%d\n", s->id);
    printf("Name: %s\n",  s->name);

    free(s);

    return 0;
}
```

## Student array

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Student {
    int id;
    char *name;
};

int main(void) {
    struct Student *s = malloc(2 * sizeof(struct Student));
    if (!s) {
        perror("allocation failed");
        return 1;
    }

    for (int i = 0; i < 2; i++) {
        printf("Enter ID and name: ");
        scanf("%d", &s[i].id);
        char temp[100];
        scanf("%99s", temp);

        s[i].name = malloc(strlen(temp) + 1);
        if (!s[i].name) {
            perror("failed to allocate name");

            // free any previously allocated names before exiting
            for (int j = 0; j < i; j++) {
                free(s[j].name);
            }
            free(s);
            return 1;
        }

        strcpy(s[i].name, temp);

        printf("\nID: %d\n", s[i].id);
        printf("Name: %s\n", s[i].name);
    }

    // ✅ free all names after use
    for (int i = 0; i < 2; i++) {
        free(s[i].name);
    }
    free(s);
    return 0;
}

```

### Simplify with function

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Student {
    int id;
    char *name;
};

void freeStudent(struct Student *s,  int counter){
    for(int i =0; i<counter; i++){
        free(s[i].name);
    }
    free(s);
}

int main(void) {
    int N  =  2;
    struct Student *s = malloc(N*sizeof( struct Student));

    if(!s){ // s == NULL
        perror("allocation failed");
        return 1;
    }
    for (int i=0;  i< N; i++) {
        printf("Enter id:");
        scanf("%d", &s[i].id);

        char temp[100];
        printf("Enter name: ");
        scanf("%99s",temp);

        s[i].name = malloc(strlen(temp) + 1);
        if (!s[i].name){
            perror("failed to allocate name");
            freeStudent(s,i);
           return 1;
        }
        strcpy(s[i].name, temp);
        printf("\n%d\n", s[i].id);
        printf("Name: %s\n\n",  s[i].name);
    }

    freeStudent(s,N);
    return 0;
}
```

