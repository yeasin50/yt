---
title: "Git Branch Merge"
description: "Fast-Forward & 3-Way Merge, Git-Conflicts &  squash commits"
date: 2026-02-22T19:00:00+08:00
weight: 10
draft: false
tags: ["git", "beginner"]
ShowToc: false
categories: ["git"]
---

## Fast-Forward & 3-Way Merge

{{< youtube cWHMHl4gGoM >}}

<br>

```cmd
git merge yourBranch
```

### Fast-Forward merge

When the master branch has no new commits,
Git simply moves the master pointer forward to the latest feature
commit without creating a new merge commit.

```git graph
    A - - - - - - - - -- -> D --->
     \                      ^
      +---> B ---> C -------+
```

### 3-way merge

When both branches have evolved independently,
Git combines their histories by generating a brand new "merge commit."

```git graph
master      A ---> B ---> C -----------> G --->
             \                           ^
feature       +--> D ---> E ---> F ------+
```

### Squash Merge

Git condenses all feature branch commits into a single new commit on the master branch,
keeping the main repository history completely linear.

```git graph
master      A ---> B ---> C -----------> S ---->
             \                           ^
feature       +--> D ---> E ---> F ------+
```

{{< youtube vpzSC4lS3y0 >}}



## Git Merge Conflicts

{{< youtube 66cjmXn_ylA >}}