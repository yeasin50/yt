---
title: "Understaing State & Updating UI"
date: 2026-07-09T19:00:00+08:00
weight: 1
tags: ["flutter", "beginner"]
categories: ["Flutter"]
---

## Who Owns the State?

{{< youtube rxzxDhgUvPQ >}}

<br>

## Callbacks & `typedef`

Parent ↔ Child Communication

{{< youtube oLuHv-GJnEk >}}

<details> <summary> code snippet </summary> 
<br>

```dart
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: .stretch,
        children: [
          SectionView(
            onTap: (v) async {
              _counter = v;
              setState(() {});
              return "Something went wrong";
            },
          ),
          Text(
            _counter.toString(),
            style: TextStyle(fontSize: 55),
            textAlign: .center,
          ),
          SectionView(
            increment: false,
            onTap: (n) async {
              _counter = n;

              await Future.delayed(Duration(seconds: 2));
              setState(() {});
              return "";
            },
          ),
        ],
      ),
    );
  }
}

typedef OnSectionViewChange = Future<String> Function(int);

class SectionView extends StatefulWidget {
  const SectionView({super.key, this.increment = true, required this.onTap});
  final bool increment;

  final OnSectionViewChange onTap;

  @override
  State<SectionView> createState() => _SectionViewState();
}

class _SectionViewState extends State<SectionView> {
  bool isLoading = false;

  String errMsg = "";
  Future<void> onTap() async {
    isLoading = true;
    setState(() {});

    Random random = Random();
    final number = random.nextInt(4444);

    errMsg = await widget.onTap(widget.increment ? number : number * -1);

    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: widget.increment ? Colors.blueAccent : Colors.redAccent,
        child: Center(
          child: Column(
            mainAxisSize: .min,
            children: [
              Text(errMsg),
              InkWell(
                onTap: isLoading ? null : onTap,
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Icon(
                        widget.increment ? Icons.add : Icons.remove,
                        size: 55,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```

</details>

<br>

## Why AlertDialog/BottomSheet UI doesn't update even with setState

> Widget state 03

{{< youtube KnUAo9hSgjo >}}

<br>

<details> <summary> main.dart </summary>

```dart
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void onTap() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateSB) {
            return AlertDialog(
              content: Text(_counter.toString(), style: TextStyle(fontSize: 55)),
              actions: [
                TextButton(
                  onPressed: () {
                    _counter++;
                    setStateSB(() {});
                    setState(() { });
                  },
                  child: Icon(Icons.add),
                ),
              ],
            );
          }
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
      alignment: Alignment(0, -.5),
        child: Text(_counter.toString(), style: TextStyle(fontSize: 55)),
      ),
      floatingActionButton: FloatingActionButton(onPressed: onTap),
    );
  }
}

```

</details>

<br>

## Frequently Asked Questions About State Updates

- [Flutter NumberPicker in AlertDialog doesn't work properly](https://stackoverflow.com/a/69609194/10157127)
- [setState() not working from inside AlertDialog](https://stackoverflow.com/a/70799802/10157127)
- [How can I add items from an AlertDialog to a list?](https://stackoverflow.com/a/77282325/10157127)
- [Flutter Switch doesn't work in ModalBottomSheet](https://stackoverflow.com/q/70567296/10157127)
- [DropdownButton not showing the selected value in Flutter](https://stackoverflow.com/a/79954275/10157127)
- [How can I use setState() outside of a StatefulWidget?](https://stackoverflow.com/a/75567733/10157127)
- [Display the date in a Text widget when the date changes](https://stackoverflow.com/q/75528062/10157127)

<br>

## ValueNotifier & ValueListenableBuilder

{{< youtube QDe8ecwjwmA >}}

<details> <summary> main_value_notifier.dart </summary>

```dart
import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage()),
);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<List<int>> notifier = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    notifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (context, value, child) {
            return Text(value.toString(), style: TextStyle(fontSize: 55));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          notifier.value = [...notifier.value, 1];
        },
      ),
    );
  }
}

```

</details>

<br>

## ChangeNotifier & ListenableBuilder

{{< youtube U1Og7CL7WA8 >}}

<details> <summary> main_change_notifier.dart </summary>

```dart
import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage()),
);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ItemsNotifier extends ChangeNotifier {
  final List<int> _items = [];
  List<int> get items => _items;

  void add() {
    _items.add(1);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final ItemsNotifier notifier = ItemsNotifier()
    ..addListener(() {
      print("value has changed");
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: ListenableBuilder(
          listenable: notifier,
          builder: (context, child) {
            final value = notifier.items;
            return Text(value.toString(), style: TextStyle(fontSize: 55));
          },
        ),
      ),
      floatingActionButton: Row(
        spacing: 24,
        mainAxisSize: .min,
        children: [
          FloatingActionButton(onPressed: () => notifier.add()),
          FloatingActionButton(onPressed: () => notifier.clear()),
        ],
      ),
    );
  }
}

```

</details>

<br>
