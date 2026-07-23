---
title: "Navigation with Navigator 1"
date: 2026-07-24T19:00:00+08:00
weight: 300
tags: ["flutter", "beginner", "navigation"]
categories: ["Flutter"]
---

Learn Flutter's `Navigator` API with practical examples of `push`, `pop`, `pushReplacement`, `pushAndRemoveUntil`, `popUntil`, `canPop`, and passing data between routes.

{{< youtube spy0WrWOSxU >}}

<br>

<details> <summary> main_navigator1.dart </summary>

```dart {style=monokai}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final route = DetailsPage.route();
            final result = await Navigator.push(context, route);
            print(result);
          },
          child: const Text("Go to Details"),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.value});
  final int value;

  static MaterialPageRoute route() => MaterialPageRoute(
    builder: (context) => DetailsPage(value: 123),
    settings: RouteSettings(arguments: 12312),
  );

  @override
  Widget build(BuildContext context) {
    final canPop = ModalRoute.of(context)?.canPop ?? false;

    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Center(
        child: Column(
          spacing: 16,
          mainAxisSize: .min,
          children: [
            if (canPop) CloseButtonIcon(),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop("hello");
              },
              child: const Text("pop(result)"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(SettingsPage.route());
              },
              child: const Text("Settings with pushReplacement"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(SettingsPage.route());
              },
              child: const Text("Settings with push"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(SettingsPage.route(), (
                  route,
                ) {
                  return false;
                });
              },
              child: const Text("pushAndRemoveUntil"),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (_) => SettingsPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) {
                  return route.isFirst;
                });
              },
              child: const Text("popUntil(Home)"),
            ),

            ElevatedButton(
              onPressed: () {
                debugPrint("canPop: ${Navigator.canPop(context)}");
                Navigator.maybePop(context);
              },
              child: const Text("canPop / maybePop"),
            ),
          ],
        ),
      ),
    );
  }
}

```

</details>

<br>
