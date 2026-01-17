---
title: "Tmux essential commands"
date: 2025-12-31T20:00:00+06:00
weight: 1
draft: true
tags: ["tmux", "terminal", "intermediate"]
categories: ["tmux", "terminal"]
---

Tmux essential commands explained navigation's, terminal split, windows, panes and sessions.

{{< youtube QAkq3CAoi7I >}}

<br>

**Basic navigation commands**

| Action                  | Shortcut / Command        | Description                |
| ----------------------- | ------------------------- | -------------------------- |
| New window              | Ctrl+b c                  | নতুন window তৈরি           |
| Next window             | Ctrl+b n                  | পরবর্তী window এ যান       |
| Previous window         | Ctrl+b p                  | আগের window এ যান          |
| Rename window           | Ctrl+b ,                  | Window rename করুন         |
| Close window            | Ctrl+b &                  | Window বন্ধ করুন           |
| Split pane vertically   | Ctrl+b %                  | Terminal vertical split    |
| Split pane horizontally | Ctrl+b "                  | Terminal horizontal split  |
| Move between panes      | Ctrl+b + Arrow keys       | Pane selection পরিবর্তন    |
| Resize pane             | Ctrl+b hold Arrow keys    | Pane size পরিবর্তন         |
| Detach session          | Ctrl+b d                  | Background এ session রাখুন |
| Attach session          | tmux attach               | পুনরায় attach করুন         |
| List sessions           | tmux ls                   | Session list দেখুন         |
| Kill session            | tmux kill-session -t name | Session delete করুন        |
