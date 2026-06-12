---
title: "Git Install & Global Config"
description: "Windows ও Linux এ Git install এবং global configuration"
date: 2026-01-30T19:00:00+08:00
weight: 3
draft: false
tags: ["git", "beginner"]
categories: ["git"]
---

এই ভিডিওটি Git সিরিজের Part 3।

এখানে আমরা Windows ও Linux এ Git install করা এবং GitHub account ব্যবহার করে global config সেট করা দেখেছি।

{{< youtube QwgSDIsrHTU >}}

<br>

First download and install git from [here](https://git-scm.com/install/).

**Configuration steps**

1. Check Git version:

   ```
   git --version
   ```

2. Set username:

   ```
   git config --global user.name "Your Name"
   ```

3. Set email:

   ```
   git config --global user.email "youremail@example.com"
   ```

4. Check(verify) configuration:

   ```
   git config --list
   ```

5. (optional) We can also set default code editor(e.g. vscode) but gonna use neovim
   ```
   git config --global core.editor "code --wait"
   ```
