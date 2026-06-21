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

{{< youtube 9TYkeRhDf9Y >}}

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
