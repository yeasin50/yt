---
title: "How to start flutter"
date: 2025-09-27T19:00:00+08:00
weight: 1
draft: false
tags: ["flutter","beginner"]
categories: ["Flutter"]
---

This is the very first question asked by many after they start their Flutter journey.
Here I have included necessary stuff from my knowledge, not strictly limited to Flutter but including the related things as well.

- I can point to a single direction from where they can start their journey as a Flutter developer.
- Also, you can share to save your time as well.
- Suggestions are welcome, make an issue and then PR.

## Documentation

Yes, there is no better option than [official Flutter documentation](https://docs.flutter.dev/get-started/learn-flutter).

Don't be a monkey coder just by watching old videos,
They will be outdated soon enough.

## Roadmap

My personal favorites are these two:

- https://plugfox.dev/flutter-developer-roadmap/
- https://roadmap.sh/flutter

---

## Basic

If this is your first language or you just wanna test it out, no need to install Android Studio, VS Code or set up Flutter.  
Visit [dartpad.dev](https://dartpad.dev/) and click on the plus button and select:

- `dart snippet` to run Dart code or
- `flutter snippet` to run Flutter/widget-related codes.

BTW, Dart is a programming language and Flutter is a framework written in the Dart language.

### Dart

Start with Dart syntax. Make sure you get these well.
You can skip generics, Dart 3 features like records and patterns at this point.
You can learn these once you are comfortable with it.
A good way of learning is, solving some coding problems on different sites.

- [ ] Make sure you have removed/disabled any AI code assistance of IDE/editor.
      You want to learn, not be a copycat. Increase your brain muscles. Learn to think.

- [ ] Check out the introduction: https://dart.dev/language
- [ ] Understanding null-safety :https://dart.dev/null-safety/understanding-null-safety

### Layout

Flutter is about UI. There are **golden rules**:

1. Constraints go down
2. Size goes up
3. Parent positions the children

Yes, this is kinda different than other frameworks.
If you understand these rules, you can tackle any layout issue, which is often shown by red or yellow boxes.

- [ ] Learn how layout works from [layout/constraints](https://docs.flutter.dev/ui/layout/constraints).  
       This is gonna take some time but it's worth it in the long run.

### Widgets

Once you have a basic understanding of how layout works, you can start learning some widgets.

- [ ] [Basic widgets](https://docs.flutter.dev/ui#basic-widgets)
  - [ ] `Text`
  - [ ] `Row`
  - [ ] `Column`
  - [ ] `Stack`
  - [ ] `Container`

You will learn other necessary widgets to work with these widgets.

- [ ] I will suggest watching [Flutter widget of the week playlist](https://www.youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG).  
       Watching twice might be enough to memorize which widget is used for what.
      Yes, that's all you need to memorize—just which widget provides which types of UI/features required for a working project.
      Take your time.

- [ ] You can check [cookbook](https://docs.flutter.dev/cookbook#design) as well.
      The design section will be more than enough for the time being,
      and you are free to skip or explore others as well.

---

# Part 2

There is a difference between doing things and doing them in a good way.
The compiler can execute your code, but it can be difficult to read for other devs and humans.

This differentiates good programmers from bad ones.

## Code writing

You can follow from here. Not all need to be covered, but just leaving them in case someone is interested:

- [ ] Must follow [effective-dart](https://dart.dev/effective-dart)
- [ ] _The Clean Code_ by Uncle Bob
- [ ] _The Design Patterns_ by Head First and GOF
- [ ] Design pattern YouTube playlist by [Christopher Okhravi](https://www.youtube.com/watch?v=v9ejT8FO-7I&list=PLrhzvIcii6GNjpARdnO4ueTUAVR9eMBpc)

After learning a few patterns, you will start overthinking and over-engineering.
Yes, mid-level programmers make things complex and write complex code by taking these
different patterns **as rules instead of guidance.**

> **These are guidelines, not rules that must be followed in every scenario.**

Keep things simple, but don't use others' easy code without a certain level of understanding (of their abstraction).

### Learn by doing

Yap, learn by doing stuff. We always say, fake it till you make it.

But just watching and doing like monkey people might not get you anywhere. Make sure you understand at a certain level.

Another type of developer (-/\_) can be seen as a vibe coder, who don't even bother understanding what it's doing.
The handshake between marketing and non-programmer.

#### Here are a few things

1. You can do a thing and don't know what it is doing.
2. You can't do a thing but know this is supposed to be working.
3. You can do a thing and know at a certain level what it is doing.
4. And obviously, the last one is those who can't do a thing and don't even acknowledge that they don't know — vibe coders.

So know what you're doing, at least at a certain level. Many devs add a bunch of libraries and dependencies just for simple features. This is how we easily distinguish between a good developer and a bad developer.

I am not saying it is bad to use a package or library. You should use the ones you understand and know that:

- it has been made by the people/team you trust
- it is future reliable  
  There are a bunch of packages that can be found to do a thing. Just find the one that has fewer Git issues and is well-maintained.
- ....

---

### Not for beginners,

But my other favorite playlist is [Flutter Boring Show](https://m.youtube.com/playlist?list=PLOU2XLYxmsIK0r_D-zWcmJ1plIcDNnRkK).

If you've no patience,
playing with errors for days,
reading code, books, documentation...
Forget about programming.

If your motivation in programming is just earning money,
take another path-especially in Asia,
where vast numbers of engineers are produced,
and it often takes only a few exceptional people to build massive tech corporations.

Here, passion, persistence, and curiosity matter far more than the paycheck.
