---
title: "Hive: Flutter Local Storage"
date: 2026-10-01T19:00:00+08:00
weight: 420
tags: ["flutter", "beginner", "database"]
categories: ["Flutter"]
---

> Database Setup & Custom Adapters

{{< youtube iqrEi0LKq5E  >}}

<br>

{{< pub "hive_ce" >}}

<br>

```yaml
dependencies:
  hive_ce: latest
  hive_ce_flutter: latest
```

## Basic

<details> 
<summary> basic hive </summary>

```dart
import 'package:flutter/material.dart';

import 'package:hive_ce_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("fruits");

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: const MyApp()),
      darkTheme: ThemeData.dark(),
      themeMode: .dark,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final box = Hive.box("fruits");

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      crossAxisAlignment: .stretch,
      mainAxisAlignment: .center,
      children: [
        Text(
          box.get("isDarkMode", defaultValue: false).toString(),
          textAlign: .center,
        ),

        TextButton(
          onPressed: () {
            box.put("isDarkMode", null);
            setState(() {});
          },
          child: Text("save"),
        ),

        TextButton(
          onPressed: () {
            box.delete("isDarkMode");
            setState(() {});
          },
          child: Text("delete"),
        ),
      ],
    );
  }
}
```

</details>

## Box\<T\>

<details> <summary> type specific counter</summary>

```dart
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<int>('counter');

  runApp(
    MaterialApp(
      home: const MyApp(),
      darkTheme: ThemeData.dark(),
      themeMode: .dark,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final counter = Hive.box<int>('counter');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: .all(8.0),
        child: ElevatedButton(
          onPressed: () {
            counter.put("v1", counter.get("v1", defaultValue: 0)! + 1);
            setState(() {}); // to refresh  the ui
          },
          child: Text("counter ${counter.get("v1").toString()}"),
        ),
      ),
    );
  }
}
```

</details>

## Custom adapter

<details>

```dart
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class User {
  new({required this.name, required this.dob});

  final String name;
  final DateTime dob;
  @override
  String toString() {
    return "User(name: $name, dob: $dob)";
  }
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    return User(name: reader.read(), dob: reader.read());
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.write(obj.name);
    writer.write(obj.dob);
  }
}

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('users');

  runApp(
    MaterialApp(
      home: const MyApp(),
      darkTheme: ThemeData.dark(),
      themeMode: .dark,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();
  final userBox = Hive.box<User>("users");

  void add() async {
    await userBox.put(0, User(name: controller.text, dob: DateTime.now()));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: .all(8.0),
          child: Column(
            spacing: 24,
            crossAxisAlignment: .stretch,
            mainAxisSize: .min,
            children: [
              Text(userBox.get(0).toString()),

              TextFormField(
                controller: controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              ElevatedButton(onPressed: add, child: Text("add user")),
            ],
          ),
        ),
      ),
    );
  }
}

```

</details>

## Generate adapter

To generate adapters, use hive_ce_generator and build_runner.

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0
  hive_ce_generator: any
  build_runner: any
```

```dart
// lib/hive/hive_adapters.dart
import 'package:hive_ce/hive_ce.dart';
import 'package:hive_temp_exc/main.dart';

@GenerateAdapters([AdapterSpec<User>()])
part 'hive_adapters.g.dart';
```

<details> 
<summary>  main.dart </summary>

```dart
/// main.dart
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:hive_temp_exc/hive/hive_registrar.g.dart';

class User {
  const User({required this.name, required this.dob});

  final String name;
  final DateTime dob;
  @override
  String toString() {
    return "User(name: $name, dob: $dob)";
  }
}

void main() async {
  Hive
    ..init(".")
    ..registerAdapters();

  await Hive.openBox<User>('users');

  runApp(
    MaterialApp(
      home: const MyApp(),
      darkTheme: ThemeData.dark(),
      themeMode: .dark,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();
  final userBox = Hive.box<User>("users");

  void add() async {
    await userBox.put(0, User(name: controller.text, dob: DateTime.now()));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: .all(8.0),
          child: Column(
            spacing: 24,
            crossAxisAlignment: .stretch,
            mainAxisSize: .min,
            children: [
              Text(userBox.get(0).toString()),

              TextFormField(
                controller: controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              ElevatedButton(onPressed: add, child: Text("add user")),
            ],
          ),
        ),
      ),
    );
  }
}
```

</details>
