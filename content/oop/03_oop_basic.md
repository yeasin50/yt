---
title: "Hands-on"
description: "Core OOP concepts with practical examples"
date: 2026-05-26T19:00:00+08:00
weight: 300
draft: false
tags: ["OOP"]
categories: ["OOP"]
---

## Classes & Objects (Encapsulation)

Basic introduction to encapsulation using real examples.

{{< youtube JyUfHjt78Sg >}}

## Inheritance Basics

Covers UML structure, `extends`, `super`, and type casting concepts.

{{< youtube 9TYkeRhDf9Y >}}

## Static & Dynamic Polymorphism

Explains compile-time and runtime polymorphism with examples.

{{< youtube Wnamu-Cy4GU >}}

## Abstract Class & Interface

{{< youtube ifVnFr2S6L4 >}}

<details> <summary> practice code </summary>

| Capability \ Animal | Human | Bird | Fish | Frog |
| ------------------- | ----- | ---- | ---- | ---- |
| Breath              | ✅    | ✅   | ✅   | ✅   |
| Eat                 | ✅    | ✅   | ✅   | ✅   |
| Sleep               | ✅    | ✅   | ✅   | ✅   |
| Walk                | ✅    | ✅   | ☐    | ✅   |
| Fly                 | ☐     | ✅   | ☐    | ☐    |
| Swim                | ☐     | ☐    | ✅   | ✅   |

> Codes

```java
// Main.java
class Main {

    static void makeFly(IFly f){
        f.fly();
    }

    public static void main(String[] args) {

        Bird bird = new Bird();
        bird.eat();
        makeFly(bird);

        IFly d = new Drone();
        makeFly(d);

    }
}

// Animal.java
abstract class Animal {
    public abstract void eat();

    public void sleep() {
        System.out.println("Sleeping...");
    }
}

// Bird.java
class Bird extends Animal  implements IWalkable, IFly {

    @Override
    public void eat(){
        System.out.println("Bird is eating insect.....");
    }

    @Override
    public void walk() {
        System.out.println("bird is walking slowly...");
    }

    @Override
    public void fly() {
        System.out.println("bird is flying fast...");
    }
}

// Human.java
class Human extends Animal  implements IWalkable {

    @Override
    public void eat(){
        System.out.println("Human is eating biriany.....");
    }

    @Override
    public void walk() {
        System.out.println("Human walks");
    }
}

```

</details>

## Generic

{{< youtube E4oGD_FCnEU >}}

<details> <summary> Animal.java </summary>

```java
abstract class Animal {

    String name;
    int age;

    Animal(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public abstract void eat();

    public void sleep() {
        System.out.println("Sleeping...");
    }
}



```

</details>

<details> <summary> Bird.java </summary>

```java
class Bird extends Animal  implements IWalkable, IFly {

    Bird(String name, int age) {
        super(name,age);
    }

    @Override
    public void eat(){
        System.out.println("Bird is eating insect.....");
    }

    @Override
    public void walk() {
        System.out.println("bird is walking slowly...");
    }

    @Override
    public void fly() {
        System.out.println("bird is flying fast...");
    }
}
```

</details>

<details> <summary> Capabilites.java </summary>

```java
interface IWalkable {
    void walk();
}

interface IFly {
    void fly();
}

interface ISwims {
    void swim();
}
```

</details>

<details> <summary> Human.java </summary>

```java
class Human extends Animal  implements IWalkable {

    Human(String name, int age) {
        super(name, age);
    }

    @Override
    public void eat(){
        System.out.println("Human is eating biriany.....");
    }

    @Override
    public void walk() {
        System.out.println("Human walks");
    }
}
```

</details>

<details> <summary> Main.java </summary>

```java
public class Main {

    public static void main(String[] args) {
        Bird d = new Bird("parrot", 3);
        Parser<Bird> p = new Parser<>(d);
        System.out.println(p.toMap());
    }
}

```

</details>

<details> <summary> Parser.java </summary>

```java
import java.util.Map;
import java.util.HashMap;

public class Parser<T extends Animal>  {
    private T value;

    public Parser(T value) {
        this.value = value;
    }

    public Map<String, Object> toMap() {
        Map<String, Object> map = new HashMap<>();
        map.put("name", value.name);
        map.put("age", value.age);
        return map;
    }
}

```

</details>

<details> <summary> Response.java </summary>

```java
public class Response<T> {

    private int statusCode;
    private String message;
    private T data;

    public Response(int statusCode, String message, T data) {
        this.statusCode = statusCode;
        this.message = message;
        this.data = data;
    }
}
```

</details>

<details> <summary> Zoo.java </summary>

```java
import java.util.ArrayList;
import java.util.List;

public class Zoo<T extends Animal> {

    private List<T> animals = new ArrayList<>();

    public void add(T animal) {
        animals.add(animal);
    }

    public List<T> getAll() {
        return animals;
    }
}
```

</details>

<br>

## Collection - ArrayList, HashSet & HashMap

{{< youtube rZ3i9qkn9zs >}}

<details> <summary> Main.java </summary>

```java
import java.util.*;

public class Main {

    public static void main(String[] args) {

        HashMap<Integer, String> map = new HashMap<>();

        map.put(101, "Alice");
        map.put(102, "Rahim");

        map.put(101, "karim");
        map.put(104, "karim");

        map.remove(104);

        map.containsValue("Rahim");
        map.containsKey(101);

        for (Integer id : map.keySet()) {
            System.out.println("id:" + id + " name:" + map.get(id));
        }
    }
}

```

</details>
