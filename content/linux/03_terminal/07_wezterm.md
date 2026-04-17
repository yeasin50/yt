---
title: "Wezterm"
date: 2026-04-17T20:00:00+06:00
weight: 7
draft: true
tags: ["terminal"]
categories: ["terminal"]
---

[Wezterm](https://wezterm.org/config/files.html#quick-start) A Beautiful Modern Terminal

{{< youtube wmtxuRxmEBs  >}}

### Config file

Linux inside `$HOME/.config/wezterm/wezterm.lua` and
for windows`USERPROFILE%/.wezterm.lua`

```lua
local wezterm = require("wezterm")

return {
	-- FONT (fix bold issue)
	font = wezterm.font_with_fallback({
		{ family = "JetBrains Mono", weight = "Regular" },
		"FiraCode Nerd Font",
		"Noto Sans Bengali",
	}),

	font_size = 15,
	line_height = 1.15,

	font_rules = {
		{
			intensity = "Bold",
			font = wezterm.font("FiraCode Nerd Font", { weight = "Medium" }),
		},
	},

	-- THEME (Tokyo Night)
	color_scheme = "Tokyo Night Storm",

	-- WINDOW LOOK (clean like kitty)
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,

	window_decorations = "NONE | RESIZE",
	window_background_opacity = 0.92,

	window_padding = {
		left = 12,
		right = 12,
		top = 12,
		bottom = 12,
	},

	-- PERFORMANCE / UX
	scrollback_lines = 20000,
	scroll_to_bottom_on_input = true,
	audible_bell = "Disabled",

	term = "xterm-256color",

	-- KEYS (tmux-like control)
	keys = {
		-- panes
		{ key = "h", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "l", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
		{ key = "k", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "j", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },

		{ key = "|", mods = "ALT|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "-", mods = "ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

		-- font zoom
		{ key = "+", mods = "CTRL", action = wezterm.action.IncreaseFontSize },
		{ key = "-", mods = "CTRL", action = wezterm.action.DecreaseFontSize },
		{ key = "0", mods = "CTRL", action = wezterm.action.ResetFontSize },

		-- copy/paste
		{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
		{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },

		-- quick select links
		{ key = "o", mods = "CTRL|SHIFT", action = wezterm.action.QuickSelect },
	},
}
```

### And terminal cmd line

```bash
## Your rest .bashrc config
# Function: Trim path to max 16 chars (shows last 2 segments if long)
get_trimmed_path() {
    local p="${PWD/#$HOME/~}"
    if [ ${#p} -gt 16 ]; then
        # Grab last 2 directory segments (e.g., ...share/chezmoi)
        echo "...$(echo "$p" | rev | cut -d'/' -f1,2 | rev)" | cut -c1-16
    else
        echo "$p"
    fi
}

# Function: Get Git Branch and Status
get_git_info() {
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        local branch=$(git branch --show-current)
        local status=$(git status --porcelain | wc -l)
        local icon="✔"
        # If there are changes, show count and ✗
        [ "$status" -ne 0 ] && icon="✗:$status"
        echo " [ $branch $icon ]"
    fi
}

# The Main Prompt Function
prompt_command() {
    local EXIT="$?"
    local SYMBOL="❯"

    # Color coding
    local G="\[\e[1;32m\]" # Green (User@Host)
    local B="\[\e[1;34m\]" # Blue (Path)
    local Y="\[\e[1;33m\]" # Yellow (Git)
    local P="\[\e[1;35m\]" # Purple (Arrow)
    local R="\[\e[1;31m\]" # Red (Error)
    local W="\[\e[0m\]"    # White/Reset

    # Turn arrow red if last command failed
    [ $EXIT != 0 ] && SYMBOL="$R$SYMBOL" || SYMBOL="$P$SYMBOL"

    # Line 1: user@host:path [git branch status]
    # Line 2: The Input Arrow
    PS1="\n$G\u@\h$W:$B\$(get_trimmed_path)$Y\$(get_git_info)$W\n$SYMBOL $W"
}

# Set the prompt
PROMPT_COMMAND=prompt_command
```

> Make sure to `soruce .bashrc` or reopen the terminal
