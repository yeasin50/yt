---
title: "Deep linking Android app"
date: 2026-10-20T19:00:00+06:00
weight: 311
tags: ["flutter", "intermediate", "navigation"]
categories: ["Flutter"]
---

{{< youtube Y6AyjS45pzw >}}

<br>

We are going to follow

1. https://docs.flutter.dev/cookbook/navigation/set-up-app-links
2. https://github.com/llfbandit/app_links/blob/main/doc/README_android.md

[Startup code `go_router_deeplink_start`](https://github.com/yeasin50/flutter_workshop/tree/go_router_deeplink_start)

Setup the route and then edit `AndroidManifest.xml`

```xml
<intent-filter android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />

    <data
        android:scheme="https"
        android:host="example.com"
        android:pathPrefix="/product" />
</intent-filter>
```

You can add more `data` for specific path

Build and test with

```cmd
adb shell am start \
-a android.intent.action.VIEW \
-d "https://example.com/product/3"
```

## Github page deeplink

Generate SHA256

```cmd
cd android
./gradlew signingReport
```

Verify deeplink, _you should use your app pkg name_

```cmd
adb shell pm verify-app-links --re-verify com.example.go_router_deeplink
```

_Verify app link_

```cmd
adb shell pm get-app-links com.example.go_router_deeplink
```

Run and _test with adb shell_

```
adb shell am start \
  -a android.intent.action.VIEW \
  -d "https://yeasin50.github.io/flutter_workshop/product/0"
```

> Make sure to have a `.nojekyll` empty file for github page.

```bash
.
├── .well-known/
│   └── assetlinks.json    <--- put your config here as shown in video
├── assets/
├── canvaskit/
├── icons/
├── ...
├── .nojekyll    <--- for githu page host
├── .....
└── index.html
```
