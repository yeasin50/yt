---
title: "Vim Motion 101"
description: "Let's edit the file"
date: 2026-04-05T06:00:22+08:00
weight: 2
draft: false
tags: ["vim","neovim"]
categories: ["vim"]
---

This guide helps anyone open a file in Vim, edit it, save, and exit.  

> Know how to exit Vim

{{< youtube xxxx >}}

## Modes

Vim has 4 main modes:  
- **Normal** – move, delete, undo, redo  
- **Insert** – type text  
- **Visual** – select text  
- **Command** – type `:` commands like save or quit  

### Basic Commands

- To edit a file, go to insert mode by pressing `i` or `a`, then start typing.  
- Once done typing, press `Esc` to go back to normal mode.  
- To save the file, type `:w` (`:` goes to command mode, `w` means write).  
- To quit, type `:q` (`q` means quit).  
- To save and quit at the same time, type `:wq`.  
- To force quit without saving, type `:q!`.  
- To go back to normal mode from **any mode**, just press `Esc`. It always works.  
- To select text, press `v` for letters or `V` for the whole line.  
- To undo, press `u` (like Ctrl+Z), and to redo, press `Ctrl + r`.  

<br>

### Vim Commands Table (Logical Order)

| Keymap      | Mode     | What it does              |
|------------|---------|--------------------------|
| `i`        | Insert  | Start typing             |
| `a`        | Insert  | Start typing after text  |
| `Esc`      | Any     | Back to normal mode      |
| `h`        | Normal  | Move left                |
| `j`        | Normal  | Move down                |
| `k`        | Normal  | Move up                  |
| `l`        | Normal  | Move right               |
| `v`        | Normal  | Select letters           |
| `V`        | Normal  | Select whole line        |
| `d`        | Normal  | Delete selection         |
| `dw`       | Normal  | Delete a word            |
| `gg`       | Normal  | Go to top of file        |
| `{`        | Normal  | Jump backward paragraph  |
| `}`        | Normal  | Jump forward paragraph   |
| `u`        | Normal  | Undo last change         |
| `Ctrl + r` | Normal  | Redo change              |
| `:w`       | Command | Save file                |
| `:q`       | Command | Quit                     |
| `:wq`      | Command | Save and quit            |
| `:q!`      | Command | Quit without saving      |