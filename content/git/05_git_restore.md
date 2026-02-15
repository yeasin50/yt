---
title: "Restore & Reset"
description: "Git restore এবং reset commands, workspace এবং commit history manage."
date: 2025-09-27T19:00:00+08:00
weight: 5
draft: false
tags: ["git", "beginner"]
categories: ["git"]
---

## `git restore`

Use when file is modified but not committed, Restores last committed version, Affects working directory only

{{< youtube tLi99bDMa0Y >}}

```sh
git restore file.txt #sepcific file
git restore . # all
```

<br>

## `git reset`

{{< youtube pHxX8eyy_ss >}}

`git reset` use to undo commits. Can affect staging area and working directory depending on mode.

- mixed – resets staging area, keeps working directory
- soft – moves HEAD only, keeps staged and working changes
- hard – resets everything including working directory

```sh
git reset <mode> <commit>
git reset --mixed HEAD~1
git reset --soft HEAD~1
git reset --hard HEAD~1
```

<br>

> `restore` = undo FILE changes
> `reset` = undo COMMITS

**Check the tour**

```
git reflog
```

<!-- like to test it out  -->

<br>

![image](./images/restore_vs_reset.png)
