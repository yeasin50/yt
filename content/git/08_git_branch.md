---
title: "Git Branching Basics"
description: "Git branch তৈরি, switch এবং delete করা step by step।"
date: 2026-02-14T19:00:00+08:00
weight: 7
draft: true
tags: ["git", "beginner"]
ShowToc: false
categories: ["git"]
---

এই ভিডিওতে আমরা Git Branching কীভাবে ব্যবহার করা হয় তা step by step দেখেছি।

{{< youtube iZSJ6KjgR8o >}}

#### Git Branching Commands

- List branches

```
git branch
```

- Create a branch

```sh
git branch <name>
git switch -c <name> # create and switch
git switch -c <name> <commit> # create from specific commit
```

- Switch branches

```sh
git switch <branch-name>
```

- Delete branches

```sh
git branch -d <name> # safe delete (merged only)
git branch -D <name> # force delete
```

- Legacy (use with caution)

```sh
git checkout <branch-name> # switch or restore files
git checkout -b <name> # create and switch
```
