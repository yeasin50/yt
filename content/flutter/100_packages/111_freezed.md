---
title: "freezed"
date: 2026-08-05T19:00:00+08:00
weight: 111
ShowToc: True
tags: ["flutter", "beginner", "package"]
categories: ["Flutter"]
---

Flutter Freezed | Models, copyWith, JSON Serialization, Generics & Union Types

> Make sure to watch [json_seriliazble](./110_json_serializable.md) first.

{{< youtube Gfv-Ee6dO0c >}}

### Freezed class

<details> <summary> address.dart </summary>

```json
{
  "success": true,
  "data": {
    "street": "123 Main Street",
    "district": "Dhaka",
    "country": "Bangladesh"
  },
  "message": "Address fetched"
}
```

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
abstract class Address with _$Address {
  const factory Address({
    required String street,
    required String district,
    required String country,
  }) = _Address;

  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);

  static const Address present = Address(
    street: "present",
    district: "addr.dis",
    country: "BD",
  );

  static const Address permanent = Address(
    street: "permanent",
    district: "addr.dis",
    country: "...",
  );
}

```

</details>

<details> <summary> person.dart </summary>

```json
{
  "success": true,
  "data": {
    "name": "John Doe",
    "age": 25,
    "address": "Earth",
    "skills": ["Dart", "Flutter"],
    "presentAddress": {
      "street": "123 Main Street",
      "district": "Dhaka",
      "country": "Bangladesh"
    },
    "permanentAddress": {
      "street": "45 Lake Road",
      "district": "Chattogram",
      "country": "Bangladesh"
    }
  },
  "message": "Person fetched"
}
```

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'address.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class Person with _$Person {
  const factory Person({
    required String name,
    int? age,
    @Default("Eath") String? address,
    @Default([]) List<String> skills,

    required Address presentAddress,
    Address? permanentAddress,
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);

  static const Person ui = Person(
    name: "0",
    age: 0,
    skills: [],
    presentAddress: Address.present,
    permanentAddress: Address.permanent,
  );
}

```

</details>

### Generic

<details> <summary> api_response.dart </summary>

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required bool success,
    T? data,
    String? message,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);
}

```

</details>

### Union

<details> <summary> code-snippet </summary>

> We are using `type` instead of `runtimetype`

**code**

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response.freezed.dart';
part 'response.g.dart';

@Freezed(genericArgumentFactories: true, unionKey: "type")
sealed class Response<T> with _$Response<T> {
  const factory Response.data(T value) = ResponseData<T>;
  const factory Response.error(Object error) = ResponseError<T>;

  factory Response.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$ResponseFromJson(json, fromJsonT);
}

```

**sample json**

```dart
final jsonUnionPerson = {
  "type": "error",
  "value": {
    "name": "John Doe",
    "age": 25,
    "address": "Earth",
    "skills": ["Dart", "Flutter"],
    "presentAddress": {
      "street": "123 Main Street",
      "district": "Dhaka",
      "country": "Bangladesh",
    },
    "permanentAddress": {
      "street": "45 Lake Road",
      "district": "Chattogram",
      "country": "Bangladesh",
    },
  },
};

final jsonUnionAddress = {
  "type": "error",
  "value": {
    "street": "123 Main Street",
    "district": "Dhaka",
    "country": "Bangladesh",
  },
};

final personErrorJson = {
  "type": "error",
  "error": "Person not found",
};
```

</details>

<br>

{{< pub "freezed" >}}
<br>
