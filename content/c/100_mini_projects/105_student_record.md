---
title: "Student Mark Record Project in C"
date: 2025-10-29T20:00:00+06:00
weight: 5
draft: false
future: true
tags: ["c", "project", "bangla", "beginner"]
categories: ["C"]
---

Build a **Student Mark Record Project in C** where you can **create, show, and remove student records**.  
Learn how to manage data using **structs**, handle file input/output, and format outputs neatly.

{{< youtube tK0t7wB_QaE >}}

<br>

#### Why `scanf(" %[^\n]", s.name);`?

- `%[^\n]` → reads **all characters until a newline**, including spaces (so you can type full names like "Alice Bob").
- The **space before `%`**:
  - Skips any leftover newline or whitespace from previous input.
  - Without it, `scanf` might immediately read an empty string if a newline is still in the buffer.

- Safe usage with length limit:

```c
scanf(" %49[^\n]", s.name);
```

---

## Final code

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Student {
  int id;
  char name[50];
  float mark;
};

// Function prototypes
void addStudent(const char *fileName);
void removeStudent(const char *fileName, int id);
void showAllStudents(const char *fileName);

int main() {
  char *fileName = "students.txt";
  int choice, id;

  while (1) {
    printf("\n--- Student Management ---\n");
    printf(
        "1. Add Student\n2. Remove Student\n3. Show All Students\n4. Exit\n");
    printf("Enter choice: ");
    scanf("%d", &choice);

    switch (choice) {
    case 1:
      addStudent(fileName);
      break;
    case 2:
      printf("Enter ID to remove: ");
      scanf("%d", &id);
      removeStudent(fileName, id);
      break;
    case 3:
      showAllStudents(fileName);
      break;
    case 4:
      printf("Exiting...\n");
      return 0;
    default:
      printf("Invalid choice!\n");
    }
  }
  return 0;
}

// Add a new student
void addStudent(const char *fileName) {
  struct Student s;
  printf("Enter ID: ");
  scanf("%d", &s.id);
  printf("Enter Name: ");
  scanf(" %[^\n]", s.name); // read full line
  printf("Enter Mark: ");
  scanf("%f", &s.mark);

  FILE *file = fopen(fileName, "a");
  if (!file) {
    printf("Unable to open file!\n");
    return;
  }

  fprintf(file, "%d,%s,%.2f\n", s.id, s.name, s.mark);
  fclose(file);

  printf("Student added successfully.\n");
}

// Remove a student by ID
void removeStudent(const char *fileName, int id) {
  FILE *file = fopen(fileName, "r");
  if (!file) {
    printf("Unable to open file!\n");
    return;
  }

  FILE *temp = fopen("temp.txt", "w");
  if (!temp) {
    printf("Unable to create temp file!\n");
    fclose(file);
    return;
  }

  struct Student s;
  int found = 0;

  while (fscanf(file, "%d,%49[^,],%f\n", &s.id, s.name, &s.mark) == 3) {
    if (s.id != id) {
      fprintf(temp, "%d,%s,%.2f\n", s.id, s.name, s.mark);
    } else {
      found = 1;
    }
  }

  fclose(file);
  fclose(temp);

  remove(fileName);
  rename("temp.txt", fileName);

  if (found)
    printf("Student with ID %d removed.\n", id);
  else
    printf("Student with ID %d not found.\n", id);
}

// Display all students
void showAllStudents(const char *fileName) {
  FILE *file = fopen(fileName, "r");
  if (!file) {
    printf("Unable to open file!\n");
    return;
  }

  struct Student s;
  printf("\n%-5s %-20s %-6s\n", "ID", "Name", "Mark");
  printf("-------------------------------\n");

  while (fscanf(file, "%d,%49[^,],%f\n", &s.id, s.name, &s.mark) == 3) {
    printf("%-5d %-20s %-6.2f\n", s.id, s.name, s.mark);
  }

  fclose(file);
}
```
