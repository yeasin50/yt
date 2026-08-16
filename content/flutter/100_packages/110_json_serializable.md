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

### Custom config `build.yaml`

```yaml
targets:
  $default:
    builders:
      json_serializable:
        options:
          # Options configure how source code is generated for every
          # `@JsonSerializable`-annotated class in the package.
          #
          # The default value for each is listed.
          any_map: false
          checked: false
          constructor: ""
          create_factory: true
          create_field_map: false
          create_json_keys: false
          create_json_schema: true
          create_per_field_to_json: false
          create_to_json: true
          date_time_utc: true
          disallow_unrecognized_keys: false
          explicit_to_json: false
          field_rename: snake
          generic_argument_factories: false
          ignore_unannotated: false
          include_if_null: true
```

{{< pub "json_serializable" >}}
