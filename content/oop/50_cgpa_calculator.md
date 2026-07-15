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

## Part 2 | Reading GradingPointSystem & students marks

{{< youtube suGdaEM-xxM >}}

<br>

<details> <summary> GradeInterval.java </summary>

```java

class GradeInterval {

    // lowMark,highMark,letter,gradePoint,remark
    GradeInterval(int lowMark, int highMark, String letter, float gradePoint, String remark) {
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

<details> <summary> GradeRepository.java </summary>

```java
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;

public class GradeRepository {

    public static final String PRIVATE_UNIVERSITIES = "assets/grade_private_universities.csv";
    public static final String PUBLIC_UNIVERSITY = "assets/grade_public_university.csv";
    public static final String BRAC = "assets/grade_brac.csv";
    public static final String IUB = "assets/grade_iub.csv";
    public static final String NSU = "assets/grade_nsu.csv";
    public static final String UIU = "assets/grade_uiu.csv";

    public static ArrayList<GradeInterval> loadGrades(String filePath) throws Exception {

        ArrayList<GradeInterval> grades = new ArrayList<>();
        BufferedReader reader = new BufferedReader(new FileReader(filePath));
        reader.readLine();

        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");

            grades.add(new GradeInterval(
                    Integer.parseInt(parts[0]),
                    Integer.parseInt(parts[1]),
                    parts[2],
                    Float.parseFloat(parts[3]),
                    parts[4]));

        }

        reader.close();
        return grades;
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

    static ArrayList<Subject> scanSubjects() {
        ArrayList<Subject> subjects = new ArrayList<>();
        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.print("Press y to enter subject. n to exit: ");
            String choice = scanner.nextLine().trim().toLowerCase();

            if (choice.equals("y")) {
                Subject subject = scanSubject(scanner);
                subjects.add(subject);
            } else if (choice.equals("n")) {
                break;
            } else {
                System.out.println("y for enter subject.\n n to exit");
            }
        }
        scanner.close();

        return subjects;
    }

    public static void main(String[] args) throws Exception {

        PublicUniGradeSystem gradeSystem = new PublicUniGradeSystem(
                GradeRepository.loadGrades(GradeRepository.IUB));

        ArrayList<Subject> subjects = StudentRespository.loadStudentMarks(StudentRespository.students.get("101"));

        float totalGradePoint = 0;
        int totalCredit = 0;

        for (Subject s : subjects) {
            totalGradePoint += gradeSystem.getGP(s) * s.credit;
            totalCredit += s.credit;
        }

        if (totalCredit > 0)
            System.out.println("YOUr CGPA " + (totalGradePoint / totalCredit));
        else
            System.out.println("No subject has been added");
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

<details> <summary> StudentRespository.java </summary>

```java
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;

public class StudentRespository {

    public static HashMap<String, String> students = new HashMap<>() {
        {
            put("101", "assets/student_101.csv");
            /// ...
        }
    };

    public static ArrayList<Subject> loadStudentMarks(String filePath) throws Exception {

        ArrayList<Subject> subjects = new ArrayList<>();
        BufferedReader reader = new BufferedReader(new FileReader(filePath));
        reader.readLine();

        String line;
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");
            subjects.add(new Subject(parts[0],
                    Float.parseFloat(parts[1]),
                    Integer.parseInt(parts[2])));

        }

        reader.close();
        return subjects;
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
