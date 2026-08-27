---
title: "Sealed & Union class"
date: 2026-08-23T19:00:00+08:00
weight: 21
tags: ["dart", "intermediate", "flutter"]
categories: ["Flutter"]
---

I hope you've already checked the [Abstract & Generic](./020_abstract_generic_class.md).  
We already know what abstract class is, and it can be extend from anywhere.

```dart
// api_state.dart
abstract class ApiState {}

class Loading extends ApiState {}
class Success extends ApiState {}
```

```dart
// api_provider.dart
class Error extends ApiState {}
```

## Sealed class

**But** Sealed class restrict extending class outside the library.
You can only extends it within the same library/file.

> Every Dart file is a library, and you can use `part`/`part of` to combine multiple files
> into the same library.

```dart
sealed class ApiState {}

class Loading extends ApiState {}
class Success extends ApiState {}
class Error extends ApiState {}
```

And if we you try to extend `ApiState` outside the file,
It will give you error.

Also other things to keep in mind

- Sealed class can not be instantiated.
- Subclasses can be normal, abstract, final, or sealed.

Which means, even though we can not extend `ApiState` But we can extend
subclass and any other things we can do with normal class;
Theses are just normal class.

## How is it different from creating enum then?

We can have fields and other every stuff that a class offer in enum.
But all the enum Fields, will be verbose,
And Unnecessary optional fields.

```dart
enum ApiState {
  loading,
  success,
  error;

  final String? data;
  final String? message;
  final int? status;
}
```

> Every state has these fields, but most of them don't apply to most states.

**But enums are useful** when we only care which value it is, and all possible values share the same structure.

For Sealed class you ask, _Which type is it, and what data does it carry?_

## Benefits of using sealed class

```dart
sealed class ApiState {
  const ApiState();
}

class Loading extends ApiState {}

class Success extends ApiState {
  const Success(this.data);
  final String data;
}

class Error extends ApiState {
  const Error(this.status, this.message);
  final String message;
  final int status;
}
```

### destructuring/pattern matching

```dart
  final Error err = Error(400, "err");
  final Error(:message) = Error(400, "err");

  print(message);
```

> We must use the same field name (`:message`) for this.

```dart
void main() {
  final states = [Loading(), Success("ok"), Error(400, "err")];

  for (final state in states)
    switch (state) {
      case Loading():
        print("loading");

      case Success(:final data):
        print(data);

      case Error(:final status):
        print(status);
    }
}
```
