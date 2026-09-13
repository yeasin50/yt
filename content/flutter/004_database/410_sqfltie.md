---
title: "Sqlfite local databse"
date: 2026-09-13T19:00:00+08:00
weight: 410
tags: ["flutter", "beginner", "database"]
categories: ["Flutter"]
---

Let's create a simple todo CRUD application with [sqlfite](https://pub.dev/packages/sqflite)

{{< youtube absc >}}

{{< pub "sqflite" >}}

### Project setup

Create a project

```cmd
flutter create sqlfite_example_yt
```

I am using [freezed](../100_packages/111_freezed.md) to generate my classes.
You can [explore my video on freezed](../100_packages/111_freezed.md) or
use normal class and create fromJson/toMap method.

#### pubspec.yaml

```yaml {linenos=inline hl_lines=[8,9] style=emacs}
dependencies:
  flutter:
    sdk: flutter
  freezed_annotation: ^3.1.0
  json_annotation: ^4.12.0
  uuid: ^4.6.0 # to generate id

  sqflite: ^2.4.2+1 # for android, ios
  sqflite_common_ffi: ^2.4.0 # for linux run,  check  doc for more

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0
  build_runner: ^2.15.1
  freezed: ^3.2.5
  json_serializable: ^6.14.1
```

#### model class

And let's create a model class `task.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task {
  const Task._();

  const factory Task({
    required String id,
    required String title,
    @Default("") String description,
    @DateDBConverter() required DateTime createdAt,
  }) = _Task;

  static Task get empty => Task(
    id: Uuid().v4().toString(),
    title: "",
    createdAt: DateTime.now(),
  );

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);
}

class DateDBConverter extends JsonConverter<DateTime, String> {
  const DateDBConverter();
  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime object) {
    return object.toString();
  }
}
```

Now run build_runner `dart run build_runner build -d` to generate freezed files.

### Task repository

We have initialize databse and CRUD responsibility.

> We have `tasks` table which contains `id`, `title`,`description` and `createdAt` all as text.
> More on supported datatype for sqlfite.

```dart {linenos=inline hl_lines=["15-20"] style=emacs}
import '../models/task.dart';

import 'package:sqflite/sqflite.dart';

class TaskRepo {
  TaskRepo._(this._db);
  final Database _db; // comes from sqflite

  static Future<TaskRepo> create() async {
    final db = await openDatabase(
      'app.db', //databse name
      version: 1, //version
      onCreate: (db, version) async {
        await db.execute('''
                      CREATE TABLE tasks(
                          id TEXT PRIMARY KEY,
                          title TEXT,
                          description TEXT,
                          createdAt TEXT
                          )
                      ''');
      },
    );

    return TaskRepo._(db);
  }
 }
```

Let's have our methods

_ONE thing to keep in mind is that `.fromJson` and `.toJson` should match the key
with sqlfite tables we just create._

```dart
 Future<Task?> addTask(Task task) async {
    final result = await _db.insert('tasks', task.toJson());
    return task;
  }

  Future<List<Task>> getTasks() async {
    final rows = await _db.query('tasks');
    return rows.map((row) => Task.fromJson(row)).toList();
  }

  Future<int> deleteTask(String id) async {
    return await _db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
```

## Update sqlfite

You can increase version and alter table as well. Lets' add progress status and `updatedAt`

```dart {linenos=inline hl_lines=[2,13,15] style=emacs}
@JsonEnum()
enum TaskStatus { pending, inProgress, completed }


@freezed
abstract class Task with _$Task {
  const Task._();

  const factory Task({
    required String id,
    required String title,
    @Default("") String description,
    @Default(TaskStatus.pending) TaskStatus progress,
    @DateDBConverter() required DateTime createdAt,
    @DateDBConverter() required DateTime updatedAt,
  }) = _Task;

  static Task get empty => Task(
    id: Uuid().v4().toString(),
    title: "",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);
}
```

#### Update the db(table)

We have updated the version

```dart {linenos=inline hl_lines=[6,"17-24"] style=emacs}
class TaskRepo {
    // ...
  static Future<TaskRepo> create() async {
    final db = await openDatabase(
      'app.db',
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
                      CREATE TABLE tasks(
                          id TEXT PRIMARY KEY,
                          title TEXT,
                          description TEXT,
                          createdAt TEXT
                          )
                      ''');
      },
      onUpgrade: (db, oldV, currentV) async {
        if (oldV < 2) {
          await db.execute('''
        ALTER TABLE tasks
        ADD COLUMN progress TEXT NOT NULL DEFAULT 'pending'
        ''');
        }
      },
    );

    return TaskRepo._(db);
  }
//...
  /// update function
  Future<int> toggleTaskStatus(String taskId, TaskStatus status) async {
    final result = await _db.update(
      'tasks',
      {'progress': status.name, "updatedAt": DateTime.now().toString()},
      where: 'id = ?',
      whereArgs: [taskId],
    );

    return result;
  }

}
```

## Using TaskRepo on UI layer

You can use your favorite state-management solution or just pass down the widget tree.

> Full project on github repo

```dart
// main.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'src/domain/repo/task_repo.dart';
import '/src/presentation/task_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<TaskRepo>(
        future: TaskRepo.create(),
        builder: (context, snapshot) {
          if (snapshot.error != null)
            return Material(
              child: Center(child: Text(snapshot.error.toString())),
            );
          if (snapshot.data == null)
            return Material(child: Center(child: CircularProgressIndicator()));
          return TaskPage(taskRepo: snapshot.data!);
        },
      ),
    );
  }
}
```

And from widget state class

```dart
  late final TaskRepo taskRepo = widget.taskRepo;

  late Future<List<Task>> tasks = taskRepo.getTasks();

  void onNewTaskSave(Task task) async {
    final result = await widget.taskRepo.addTask(task);
    print(result);
    if (result != null) {
      tasks = taskRepo.getTasks();
      setState(() {});
    }
  }

  void removeTask(Task t) async {
    final result = await widget.taskRepo.deleteTask(t.id);
    print(result);
    if (result != 0) {
      tasks = taskRepo.getTasks();
      setState(() {});
    }
  }

  void updateTask(Task t, bool? checked) async {
    final result = await widget.taskRepo.toggleTaskStatus(
      t.id,
      checked == true ? TaskStatus.completed : TaskStatus.pending,
    );
    print(result);
    if (result != 0) {
      tasks = taskRepo.getTasks();
      setState(() {});
    }
  }

```

## Export db

> if people interested

## import db

Next we will see how can we build local-first online sync app with Last write win.
