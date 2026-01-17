---
title: "Selection & Copy-Paste in TMUX"
date: 2026-01-07T20:00:00+06:00
weight: 4
draft: false
tags: ["tmux", "terminal", "intermediate"]
categories: ["tmux", "terminal"]
---

How can we copy and paste text in TMUX?

{{< youtube ch9IApO7O1o >}}

<br>

Check the [GitHub Dotfiles](https://github.com/yeasin50/.dotfiles)

We are using the **tmux-yank** plugin from the previous video.

**To select text:**

1. Press `Ctrl + b` to enter TMUX command mode.
2. Move the cursor to the start of the text you want to select.
3. Press `Space` to start the selection.
4. Move the cursor to the end of the text.
5. Press `y` to copy the selection to the system clipboard.

> Or just drag the mouse to select text and press y to copy

---

---

> I still don't use it but you can give a try

```bash
# Example key bindings (tmux-yank plugin)
bind-key -T copy-mode-vi v send -X begin-selection
bind-key -T copy-mode-vi y send -X copy-selection-and-cancel
```

Now you can paste the copied text with your usual system paste shortcut.
