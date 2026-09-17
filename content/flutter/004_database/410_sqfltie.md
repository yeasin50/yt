---
title: "Sqlfite: Persistent todo app "
date: 2026-09-17T19:00:00+08:00
weight: 410
tags: ["flutter", "beginner", "database"]
categories: ["Flutter"]
---

Let's create a simple todo CRUD application with [sqlfite](https://pub.dev/packages/sqflite)

{{< youtube 4F_m2F4fRPo >}}

<br>

{{< pub "sqflite" >}}

<!-- TODO: should I enable extranal link open globally -->

> Checkout [Starter code](https://github.com/yeasin50/flutter_workshop/tree/sqlfite_start)
> or [final code](https://github.com/yeasin50/flutter_workshop/tree/sqflite_basic_end)

### Project setup

Create a project

```cmd
flutter create sqlfite_example_yt
```

I am using [freezed](../100_packages/111_freezed.md) to generate my classes.
You can [explore my video on freezed](../100_packages/111_freezed.md) or
use normal class and create fromJson/toMap method.

{{< github-content repo="yeasin50/flutter_workshop" branch="ff2abf6ef2186f940b4ea09e53e14f551756a3b4" path="pubspec.yaml" lang="yaml" start="9" end="25" hl_lines="16, 17" >}}

{{< github-content repo="yeasin50/flutter_workshop" branch="ff2abf6ef2186f940b4ea09e53e14f551756a3b4" path="/lib/src/domain/models/task.dart" lang="dart" start="1" end="34" hl_lines="11-16" >}}

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

{{< github-content repo="yeasin50/flutter_workshop" branch="51189301cbcf14ef1e204152e202fa4ba7b2cab2" path="lib/src/domain/repo/task_repo.dart" lang="dart" start="39" end="54" hl_lines="" >}}

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
    @Default(TaskStatus.pending) TaskStatus status,
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

{{< github-content repo="yeasin50/flutter_workshop" branch="51189301cbcf14ef1e204152e202fa4ba7b2cab2" path="lib/src/domain/repo/task_repo.dart" lang="dart" start="10" end="38" hl_lines="13, 24-35" >}}

### Task status toggle function

{{< github-content repo="yeasin50/flutter_workshop" branch="51189301cbcf14ef1e204152e202fa4ba7b2cab2" path="lib/src/domain/repo/task_repo.dart" lang="dart" start="55" end="64" hl_lines="" >}}

## Using TaskRepo on UI layer

You can use your favorite state-management solution or just pass down the widget tree.

{{< github-content repo="yeasin50/flutter_workshop" branch="51189301cbcf14ef1e204152e202fa4ba7b2cab2" path="lib/main.dart" lang="dart" start="" end="" hl_lines="10-15 , 35-46" >}}

{{< github-content repo="yeasin50/flutter_workshop" branch="51189301cbcf14ef1e204152e202fa4ba7b2cab2" path="lib/src/presentation/task_page.dart" lang="dart" start="" end="" hl_lines="" >}}

## Export db

> if people interested

## import db

Next we will see how can we build local-first online sync app with Last write win.
