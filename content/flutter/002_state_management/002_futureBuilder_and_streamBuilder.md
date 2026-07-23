---
title: "FutureBuilder & StreamBuilder"
date: 2026-07-09T19:00:00+08:00
weight: 201
tags: ["flutter", "beginner"]
categories: ["Flutter"]
---

## FutureBuilder

Learn Async Data & avoid common mistakes.

{{< youtube UU_qFQ1jj5Q >}}

<br>

<details> <summary> codeSnippet </summary>

```dart
import 'dart:math';

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
  //...
  Future<int> fetchData() async {
    await Future.delayed(Duration(seconds: 4));
    final number = Random().nextInt(100);
    return number;
  }

  late Future<int> future = fetchData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<int>(
          future: future,
          initialData: 100,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error?.toString() ?? "");
            }

            return Column(
              mainAxisSize: .min,
              children: [
                if (snapshot.connectionState == ConnectionState.waiting)
                  CircularProgressIndicator(),
                Text(snapshot.data.toString()),
              ],
            );
          },
        ),
      ),
    );
  }
}

```

</details>

<br>

## StreamBuilder

Flutter's `Stream` and `StreamBuilder` in detail. It also shows `StreamController`, `StreamSubscription`,
stream error handling, single-subscription issue and event management with practical examples.

{{< youtube hJAoFSCL-cI >}}

<br>

<details> <summary> main_steam_builder.dart </summary>

```dart
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StreamSubscriptionPage(),
  ),
);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // we can  use periodic stream as well
  // Stream<int> fetchData() {
  //   final random = Random();
  //
  //   return Stream.periodic(
  //     const Duration(seconds: 2),
  //     (_) => random.nextInt(100),
  //   );
  // }

  Stream<int> fetchData() async* {
    final random = Random();

    /// if you like to return error
    // yield* Stream.error("failed");
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      yield random.nextInt(100);
    }
  }

  late StreamController<int> controller = StreamController<int>(
    onListen: () => print("on listen"),
    onPause: () => print("on onPause"),
    onResume: () => print("on onResume"),
    onCancel: () => print("onCancel"),
  );

  late Stream<int> stream = fetchData();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          mainAxisSize: .min,
          children: [
            StreamBuilder<int>(
              stream: stream,
              initialData: 3,
              builder: (context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasError) return Text(snapshot.error.toString());
                return Column(
                  mainAxisSize: .min,
                  children: [
                    if (snapshot.connectionState == ConnectionState.waiting)
                      CircularProgressIndicator(),
                    Text(snapshot.connectionState.name),
                    Text(snapshot.data.toString()),
                  ],
                );
              },
            ),

            Row(
              mainAxisSize: .min,
              children: [
                TextButton(
                  // onPressed: () => controller.add(Random().nextInt(100)),
                  onPressed: () => controller.sink.add(Random().nextInt(100)),
                  child: const Text("Add"),
                ),
                TextButton(
                  onPressed: () => controller.addError("Something went wrong"),
                  child: const Text("Error"),
                ),

                TextButton(
                  onPressed: () async => await controller.close(),
                  child: const Text("Close"),
                ),
                TextButton(
                  onPressed: () async {
                    controller = StreamController<int>();
                    setState(() {});
                  },
                  child: const Text("restart"),
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

/// ... sample example, forgot when I edited that; perhaps gonna use github
class StreamSubscriptionPage extends StatefulWidget {
  const StreamSubscriptionPage({super.key});

  @override
  State<StreamSubscriptionPage> createState() => _StreamSubscriptionPageState();
}

class _StreamSubscriptionPageState extends State<StreamSubscriptionPage> {
  late final StreamController<int> controller = StreamController.broadcast();
  late final StreamSubscription<int> subscription;

  int rebuilded = 0;
  @override
  void initState() {
    super.initState();

    Timer t = Timer.periodic(Durations.long4, (t) {
      if (!subscription.isPaused) controller.add(t.tick);
    });

    // = Stream.periodic(const Duration(seconds: 1), (count) => count);
    subscription = controller.stream.listen(
      (data) {
        if (subscription.isPaused) return;
        print("Data: $data");
        rebuilded++;
        setState(() {});
      },

      onError: (error) {
        print("Error: $error");
      },
      onDone: () {
        print("Done");
      },
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            StreamBuilder(
              stream: controller.stream,
              builder: (ctx, snapsot) {
                return Text(snapsot.toString());
              },
            ),
            Text(rebuilded.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    subscription.pause();
                    rebuilded = 0;
                    setState(() {});
                  },
                  child: const Text("Pause"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    subscription.resume();
                  },
                  child: const Text("Resume"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    subscription.cancel();
                  },
                  child: const Text("Cancel"),
                ),
              ],
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
