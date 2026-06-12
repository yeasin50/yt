---
title: "Beginner+ Motion"
description: "Vim macros and registers basics for faster editing"
date: 2026-04-05T06:00:22+08:00
weight: 300
draft: false
tags: ["vim", "neovim"]
categories: ["vim"]
---

## Macros

Automate repeated actions.

{{< youtube pMbfq028dhc >}}

- `qa` start recording
- `q` stop recording
- `@a` play macro
- `@@` repeat last macro

## Registers

Work with yank/delete/paste storage.

{{< youtube QRJ9r-OB7UY >}}

- `:reg` for more
- `"ayy` yank into register a
- `"ap` paste from register a
- `"Ayy` append to register a

_Useful Registers_

| Register | Purpose                         |
| -------- | ------------------------------- |
| `"`      | Default register                |
| `0`      | Last yanked text                |
| `1-9`    | Delete history                  |
| `a-z`    | Named registers                 |
| `A-Z`    | Append to named registers       |
| `+`      | System clipboard                |
| `*`      | Selection clipboard (Linux/X11) |
| `%`      | Current file name               |
| `:`      | Last command                    |
| `=`      | equal register                  |
