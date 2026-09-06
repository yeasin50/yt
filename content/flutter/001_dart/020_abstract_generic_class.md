---
title: "Abstract & Generic class"
date: 2026-08-23T19:00:00+08:00
weight: 20
tags: ["dart", "intermediate", "flutter"]
categories: ["Flutter"]
---

{{< youtube d_kWrsYaUZ0 >}}

## Abstract class

You went to your local restaurant for breakfast.
When you got there, you saw a lump of raw dough sitting in front of the stove.
Then a boy came over and asked, "Ruti, paratha, or naan?"
Whatever you say, they prepare it right on the spot and serve it to you.

Here the dough on the counter is the `abstract` class.

```dart
abstract class Dough{}
```

It exits, but it has no final form. You can not eat it raw rough dough.
In programming we would say, you can not initiate it.

When you ordered `Ruti`, then the boy tell the cooker to prepare Ruti.
Here in programming we would say, extends the class.

```dart
class Ruti extends Dough {}
```

Now it can be served and you can eat.

> When we use the abstract keyword, it refers to an idea,  
> and we don't know who or how it should execute.

After eating you ordered some food to take home. 4 Ruti, 3 Paratha and some naans.

So now the prepared others types;
In programming we gonna have other classes and create objects.

```dart
class Paratha extends Dough{}
class Naan extends Dough{}
```

## Generic

But to take home, we need to put theses into separate bags. So first each item wrap with bag;
In programming we can have a generic class that can acts as a wrapper.

> We know dart is a strong dataType language.

```dart {linenos=inline hl_lines=["7-10", 14]}
abstract class Dough {}

class Ruti extends Dough {}
class Paratha extends Dough {}
class Naan extends Dough {}

class RutiBox<T> {
  const RutiBox(this.ruti);
  final T ruti;
}

void main() {
  Ruti ruti = Ruti();
  RutiBox box = RutiBox(ruti);
}
```

#### Specific generic class

But our current generic class have one issue. We can wrap the box with a box :)
loss for the business 💸

```dart {linenos=inline hl_lines=[3]}
void main() {
  Ruti ruti = Ruti();
  RutiBox box = RutiBox(RutiBox(ruti));
}
```

As a good programmer we can avoid it, by specifying

```dart {linenos=inline hl_lines=[1]}
class RutiBox<T extends Dough> {
  const RutiBox(this.ruti);
  final T ruti;
}

void main() {
  Ruti ruti = Ruti();
  RutiBox box = RutiBox(RutiBox(ruti)); // this will show error
  RutiBox box = RutiBox(ruti); // But this is fine
}
```

You can list of items as well, Here we are accepting only List of Dough

```dart
abstract class Dough {
  void make();
}

class Ruti extends Dough {
  @override
  void make() {
    print("Ruti is ready");
  }
}

class Parata extends Dough {
  @override
  void make() {
    print("Parata is ready");
  }
}

class Naan extends Dough {
  @override
  void make() {
    print("Naan is ready");
  }
}

class RutiBox<T extends List<Dough>> {
  const RutiBox(this.value);
  final T value;

  void show() {
    print("###---BOX----###");
    for (final d in value) d.make();
    print("###---...----###");
  }
}



void main() {
  final doughs = [Ruti(), Parata(), Naan()];
  RutiBox box = RutiBox<List<Dough>>(doughs);
  box.show();
}
```

You can use generics with functions, extensions, and classes.
You can also define more than one generic type.

```dart
void printDetails<T, U>(T name, U age) {
  print("I am $name and $age years old");
}
printDetails("Rahim", 25);     // T becomes String, U becomes int
printDetails("Karim", "thirty"); // T becomes String, U becomes String (fully flexible!)
```

```dart
void printDetails<N, A extends int>(N name, A age) {
  print("I am  $name and I am  $age years old.");
}

void main() {
  printDetails("Yeasin", 12);
}
```

You can check out Dart's `List` and `Map` data types, or see how a StatefulWidget's state class works.

---

{{< warning >}}

**Warning:** This is an old idea from the script and might be removed or adjusted in the docs.
Ney,, leave it :)
{{< /warning >}}

```dart
abstract class Input {
  const Input();
  void show();
}

class IntInput extends Input {
  const IntInput(this.value);
  final int value;

  void show() => print(value.toString());
}

class StringInput extends Input {
  const StringInput(this.value);
  final String value;

  void show() => print(value);
}

void main() {
  Input v = StringInput("2");
  v = IntInput(3);
  v.show();
}

```

But what if we want to
Have a class that adapt any class we pass.
If we see our `Map` and `List` in dart, it support any dataType.
We can add, get, modify and performs others specific task.

What If we want a single Animal class, can be used for any type of data returns.

```dart
class Animal {
  const Success(this.name);
  final String name;
}
```

Now not all data will be `String`, we can have any type of data on Success right?
So what can we can do? Create N class just because of each Success contains
Different types of result?
Well, let's see how Generic can be better solution here.

```dart
class Success<T> {
  const Success(this.data);
  final T data;

  // we have methods as well
  Success<T> copyWith(T data) {
    return Success(data);
  }
}
```

Now we can pass any datatype for Success.

```dart
void main() {
  var result = Success<String>("Hi");
  result = result.copyWith(1); // this well show compile time error
  print(result.data);

  // But we can have a Different object with Different dataType
  var result2 = Success<int>(1);
  result2 = result2.copyWith(1);

  var result3 = Success<Success<int>>(result2);
  print(result3.data.data);
}
```

## Extends generic

We can force that not Every-Type will not be accepted but
Only subclass of something is acceptable.

```dart
sealed class ApiState {
  const ApiState();
}

class Success<T extends ApiState> {
  const Success(this.data);
  final T data;

  Success<T> copyWith(T data) {
    return Success(data);
  }
}
```

Now we only accept any subclass of `ApiState`.
