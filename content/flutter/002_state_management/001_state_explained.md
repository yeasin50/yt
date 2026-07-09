---
title: "Understaing State & Updating UI"
date: 2026-07-09T19:00:00+08:00
weight: 1
tags: ["flutter", "beginner"]
categories: ["Flutter"]
---

## Who Owns the State?

{{< youtube rxzxDhgUvPQ >}}

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

## Callbacks & `typedef`

Parent ↔ Child Communication

{{< youtube oLuHv-GJnEk >}}

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

## Why Dialog UI doesn't update even with setState
