---
title: "Project with file operation"
description: "Read/Write file with class"
date: 2026-07-02T19:00:00+08:00
weight: 400
draft: false
tags: ["OOP"]
categories: ["OOP"]
---

## File Read & Write

{{< youtube KncYL3oYazI >}}

<details> <summary> code snippet </summary>

```java
 /// Lost it :)
```

</details>

## User Input to File

{{< youtube cZDfilhu7MQ >}}

<details> <summary> code snippet </summary>

File `Main.java`, must be compile with javac

```java
import java.io.FileWriter;
import java.util.HashMap;
import java.util.Scanner;

class Subject {
    String name;
    double cgpa;
    int credit;

    HashMap<String, Object> toMap() {
        HashMap<String, Object> map = new HashMap<>();
        map.put("name", name);
        map.put("cgpa", cgpa);
        map.put("credit", credit);

        return map;
    }

    static Subject scan(Scanner sc) {
        Subject subject = new Subject();

        System.out.print("Enter subject name: ");
        subject.name = sc.nextLine();

        System.out.print("Enter cgpa: ");
        subject.cgpa = sc.nextDouble();

        System.out.print("Enter credit: ");
        subject.credit = sc.nextInt();

        return subject;
    }

    void save() throws Exception {
        FileWriter writer = new FileWriter(name + ".txt");
        writer.write(toMap().toString());
        writer.close();
    }

}

public class Main {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);

        Subject subject = Subject.scan(sc);
        subject.save();

        System.out.println(subject.toMap());

        sc.close();
    }
}
```

</details>
