---
title: "Json serilizable"
date: 2026-07-30T19:00:00+08:00
weight: 110
ShowToc: false
tags: ["flutter", "beginner", "package"]
categories: ["Flutter"]
---

{{< youtube ggDk1BpYgb0 >}}

<br>

**user.dart**

```dart
import 'package:example/models/contact.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart'; // the `user` is the fileName

@JsonEnum(valueField: "value")
enum Gender {
  male("m"),
  female("f");

  const Gender(this.value);
  final String value;
}

@JsonSerializable(fieldRename: FieldRename.screamingSnake)
class User {
  User({
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.contact,
    required this.presentAddress,
  });

  final String name;
  final Gender gender;
  @JsonKey(name: "dob")
  final DateTime? dateOfBirth;

  final Contact contact;

  final String presentAddress;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
```

<br>

**Custom Converter**

```dart
class DateTimeConverter
    implements JsonConverter<DateTime?, Map<String, dynamic>?> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final second = json["seconds"];
    return DateTime.fromMillisecondsSinceEpoch(second);
  }

  @override
  Map<String, dynamic>? toJson(DateTime? object) {
    if (object == null) return null;
    return {'seconds': (object.millisecondsSinceEpoch / 1000).round()};
  }
}
```

<br>

{{< pub "json_serializable" >}}
