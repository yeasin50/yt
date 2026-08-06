---
title: "Equatable"
date: 2026-07-28T19:00:00+08:00
weight: 100
ShowToc: false
tags: ["flutter", "beginner", "package"]
categories: ["Flutter"]
---

## Flutter == vs Value Equality

{{< youtube SDzTHBYSfYM >}}

<br>

**code**

```dart
import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  const Contact({required this.type, required this.value});
  final String type;
  final String value;

  @override
  List<Object?> get props => [type, value];
}

class Phone with Equatable {
  const Phone({this.isPrimary = false, this.contact});

  final bool isPrimary;
  final Contact? contact;

  @override
  List<Object?> get props => [...contact?.props ?? [], isPrimary];
}

void main() {
  Contact a = Contact(type: "phone", value: "0101");
  Contact b = Contact(type: "phone", value: "0101");

  if (a == b) {
    print("same same ....");
  } else {
    print("a: ${a.toString()}");
    print("b: ${b.toString()}");
  }
}
```

<br>

{{< pub "equatable" >}}
