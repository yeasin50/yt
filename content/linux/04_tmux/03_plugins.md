---
title: "Tmux Plugins"
date: 2026-01-05T20:00:00+06:00
weight: 3
draft: false
tags: ["tmux", "terminal", "intermediate"]
categories: ["tmux", "terminal"]
---

Make it look better and Must have plugins for 10x dev.

{{< youtube M7sHtH1tYRE >}}

<br>

Check the [GitHub Dotfiles](https://github.com/yeasin50/.dotfiles)

```sh {linenos=inline }
# .... previouse configs

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-yank'

set -g @plugin 'dracula/tmux'
set -g @dracula-show-powerline true
set -g @dracula-plugins "cpu-usage ram-usage"
set -g @dracula-show-gpu false

run '~/.tmux/plugins/tpm/tpm' # your tmp  path

set-option -g base-index 1
set-option -g pane-base-index 2
set-option -g set-clipboard on

bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

set -g status-position top


```
