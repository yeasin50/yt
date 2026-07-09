---
title: "Dynamic CGPA Calculator"
description: "Calculator that can adapt any grading system"
date: 2026-07-07T19:00:00+08:00
weight: 500
draft: false
tags: ["OOP"]
categories: ["OOP"]
---

## Dynamic CGPA Calculator

Learn how to design & build a dynamic calculator that can adapt any grading system in Java.

{{< youtube HjQ2pTgIJKQ >}}

<br>

_Code_

<details> <summary> GradeInterval.java </summary>

```java

class GradeInterval {

    GradeInterval(String letter, String remark, float gradePoint, int lowMark, int highMark) {
        this.letter = letter;
        this.remark = remark;
        this.gradePoint = gradePoint;
        this.lowMark = lowMark;
        this.highMark = highMark;
    }

    String letter;
    String remark; /// excellent
    float gradePoint;

    // mark range
    int lowMark;
    int highMark;

    boolean contains(float mark) {
        return mark <= highMark && mark >= lowMark;
    }
}

```

</details>

<details> <summary> GradingPointSystem.java </summary>

```java
import java.util.ArrayList;

abstract class GradingPointSystem {

    GradingPointSystem(ArrayList<GradeInterval> grades) {
        this.grades = grades;
    }

    ArrayList<GradeInterval> grades;

    abstract double getGP(Subject subject);
}

```

</details>

<details> <summary> Main.java </summary>

```java
import java.util.ArrayList;
import java.util.Scanner;

class Main {

    static Subject scanSubject(Scanner sc) {
        System.out.print("Subject name: ");
        String name = sc.nextLine();

        System.out.print("Mark: ");
        float mark = sc.nextFloat();

        System.out.print("Credit: ");
        int credit = sc.nextInt();

        sc.nextLine();

        return new Subject(name, mark, credit);
    }

    public static void main(String[] args) {

        PublicUniGradeSystem gradeSystem = new PublicUniGradeSystem(PublicUniGradeSystem.getIntervals());
        float cgpa = 0;
        ArrayList<Subject> subjects = new ArrayList<>();

        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.print("Press y to enter subject. n to exit: ");
            String choice = scanner.nextLine().trim().toLowerCase();

            if (choice.equals("y")) {
                Subject subject = scanSubject(scanner);
                subjects.add(subject);
                cgpa += gradeSystem.getGP(subject);

            } else if (choice.equals("n")) {
                break;
            } else {
                System.out.println("y for enter subject.\n n to exit");
            }
        }

        scanner.close();
        System.out.println("YOUr CGPA " + (cgpa / subjects.size()));
    }
}

```

</details>

<details> <summary> PublicUniGradeSystem.java </summary>

```java
import java.util.ArrayList;

class PublicUniGradeSystem extends GradingPointSystem {

    PublicUniGradeSystem(ArrayList<GradeInterval> grades) {
        super(grades);
    }

    static ArrayList<GradeInterval> getIntervals() {
        ArrayList<GradeInterval> items = new ArrayList<>();

        items.add(new GradeInterval("A+", "A Plus", 4.00f, 80, 100));
        items.add(new GradeInterval("A", "A Regular", 3.75f, 75, 79));
        items.add(new GradeInterval("A-", "A Minus", 3.50f, 70, 74));
        items.add(new GradeInterval("B+", "B Plus", 3.25f, 65, 69));
        items.add(new GradeInterval("B", "B Regular", 3.00f, 60, 64));
        items.add(new GradeInterval("B-", "B Minus", 2.75f, 55, 59));
        items.add(new GradeInterval("C+", "C Plus", 2.50f, 50, 54));
        items.add(new GradeInterval("C", "C Regular", 2.25f, 45, 49));
        items.add(new GradeInterval("D", "", 2.00f, 40, 44));
        items.add(new GradeInterval("F", "Fail", 0.00f, 0, 39));

        return items;
    }

    @Override
    double getGP(Subject subject) {

        for (GradeInterval g : grades) {
            if (g.contains(subject.mark))
                return g.gradePoint;
        }

        throw new IllegalArgumentException("mark  is out of grade range");
    }

}

```

</details>

<details> <summary> Subject.java </summary>

```java

class Subject {

    Subject() {
    }

    Subject(String name, float mark, int credit) {
        this.name = name;
        this.mark = mark;
        this.credit = credit;
    }

    String name;
    float mark;
    int credit;

    double getCGPA(GradingPointSystem system) {
        return system.getGP(this);
    }
}

```

</details>

<br>

## With Persistence file

TODO
