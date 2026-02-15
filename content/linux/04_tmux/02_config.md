---
title: "Tmux Config Basics"
date: 2026-01-02T20:00:00+06:00
weight: 2
draft: false
tags: ["tmux", "terminal", "intermediate"]
categories: ["tmux", "terminal"]
---

This post covers basic tmux configuration, enabling mouse support, changing pane key bindings, reloading the tmux config, and adjusting window and pane index settings.

{{< youtube jkYap9uPUg8 >}}

---

You can checkout my [config file](https://github.com/yeasin50/.dotfiles/blob/master/tmux/.tmux.conf)

```sh
# Change prefix key to Ctrl + a
unbind C-b
set -g prefix C-a
bind C-a send-prefix

# Enable mouse support
set -g mouse on

# Enable Vim-style copy mode
setw -g mode-keys vi
bind-key -T copy-mode-vi v send -X begin-selection
bind-key -T copy-mode-vi y send -X copy-selection-and-cancel
bind-key -T copy-mode-vi Escape send -X cancel
bind -n M-v copy-mode

# Vim-style pane navigation
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# Reload tmux config without restarting
bind r source-file ~/.tmux.conf

# Create a new window in the current directory
bind c new-window -c "#{pane_current_path}"

# Split panes in the current directory
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

# Unbind default split keys
unbind '"'
unbind %
```
