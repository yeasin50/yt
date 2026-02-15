---
title: "Using .gitignore"
description: "কীভাবে `.gitignore` ফাইল দিয়ে নির্দিষ্ট ফাইল ও ফোল্ডার ignore করা যায়।"
date: 2026-02-10T19:00:00+08:00
weight: 6
draft: false
tags: ["git", "beginner"]
categories: ["git"]
---

এই ভিডিওতে আমরা দেখেছি কিভাবে **.gitignore ফাইল ব্যবহার করে নির্দিষ্ট ফাইল ও ফোল্ডার ignore করা যায়**।

{{< youtube Ox49Qii5wLA >}}

<br>

#### PATTERNS & RULES

- `*` wildcard (any chars)
- `**` recursive directories
- `?` single character
- `/path` root-only match
- `!file` negate (force include)
- _Order matters: last rule wins_

#### Ignoring files AFTER they’re already tracked

```sh
 git rm --cached <file> # or use folder
```

<br>

#### BEST PRACTICES

- Add .gitignore at repo start
- Be explicit, not lazy (\* is dangerous)
- Keep project-specific rules in repo
- Review before every first commit

#### GITIGNORE GENERATORS

- https://www.toptal.com/developers/gitignore
- https://gitignore.io
- https://github.com/github/gitignore
