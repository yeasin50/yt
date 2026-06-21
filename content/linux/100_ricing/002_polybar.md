---
title: "Pobybar - A customize panel"
date: 2025-06-19T20:00:00+06:00
weight: 2
tags: ["intermediate", "linux", "ricing"]
categories: ["linux"]
---

## Polybar

{{< youtube fab21EYJPgU >}}

> Make sure to install the nerd fonts

[GitHub repo of polybar](https://github.com/polybar/polybar)

<br>

Folder structure:

```sh
yeasin@Workstation ~/.config/polybar
[master] ❯ tree
.
├── config.ini
├── launch.sh
```

### configs

<details>
<summary> config.ini </summary>

```ini
[colors]
bg = #1a1b26
bg-alt = #24283b
fg = #c0caf5
accent = #7aa2f7
alert = #f7768e
empty = #00000000

[bar/example]
monitor = ${env:MONITOR:}
width = 96%
height = 26pt
offset-x = 0%
offset-y = 0%
radius = 10

background = ${colors.bg}
foreground = ${colors.fg}

# Invisible border to fake the floating effect in i3
border-size = 4pt
border-color = ${colors.empty}

padding-left = 2
padding-right = 2
module-margin = 2

# FONT CONFIGURATION
font-0 = "JetBrains Mono:weight=bold:size=10;2"
font-1 = "JetBrainsMono Nerd Font:size=13;3"
font-2 = "JetBrainsMonoNL Nerd Font:size=13;3"

modules-left = workspaces
modules-center = date
modules-right = pulseaudio memory cpu powermenu

[module/xwindow]
type = internal/xwindow
label = %title%

[module/workspaces]
type = internal/xworkspaces
pin-workspaces = false
strip-workspace-numbers = false
label-separator = "  "

label-active = %index%
label-occupied = %index%
label-empty = %index%
label-urgent = %index%

label-active-foreground = ${colors.bg}
label-active-background = ${colors.accent}
label-active-padding = 4

label-occupied-foreground = ${colors.fg}
label-occupied-background = ${colors.bg-alt}
label-occupied-padding = 4

label-empty-foreground = ${colors.fg}
label-empty-background = ${colors.bg}
label-empty-padding = 4

label-urgent-foreground = ${colors.bg}
label-urgent-background = ${colors.alert}
label-urgent-padding = 4

[module/date]
type = internal/date
interval = 60
date = %I:%M %p - %d %A
date-alt = %A, %Y-%m-%d
label = %date%
label-foreground = ${colors.accent}

[module/pulseaudio]
type = internal/pulseaudio
format-volume = VOL <label-volume>
label-volume = %percentage%%
label-volume-foreground = ${colors.fg}
label-muted = MUTED
label-muted-foreground = ${colors.alert}
click-middle = pavucontrol

[module/memory]
type = internal/memory
interval = 2
label = RAM %percentage_used%%
label-foreground = ${colors.accent}

[module/cpu]
type = internal/cpu
interval = 2
label = CPU %percentage%%
label-foreground = ${colors.fg}


[module/powermenu]
type = custom/text
content = ""
content-foreground = ${colors.alert}
click-left = ~/.config/rofi/scripts/powermenu.sh



[module/battery]
type = internal/battery
battery = BAT0
adapter = AC
full-at = 98

format-charging = <label-charging>
format-discharging = <label-discharging>
format-full = <label-full>

label-charging =  %percentage%%
label-discharging =  %percentage%%
label-full =  %percentage%%
```

</details>

<details>
<summary> powermenu </summary>

Stays inside rofi config, but you can put it anywhere.
Just make sure to provide the correct path

> path `.config/rofi/scripts/powermenu.sh`

```sh
#!/usr/bin/env bash

# Your original options with icons
options="  Shutdown\n回  Reboot\n  Sleep\n󰗽  Logout"


chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power:" \
    -font "JetBrainsMono Nerd Font 12" \
    -theme-str 'window {width: 250px;} listview {lines: 4;}' \
    -theme-str 'element {padding: 16px;}')


case "$chosen" in
    *Shutdown) systemctl poweroff ;;
    *Reboot) systemctl reboot ;;
    *Sleep) systemctl suspend ;;
    *Logout)
        if pgrep -x bspwm >/dev/null; then
            bspc quit
        elif pgrep -x i3 >/dev/null; then
            i3-msg exit
        else
            cinnamon-session-quit --logout --no-prompt 2>/dev/null || \
            loginctl terminate-session "$XDG_SESSION_ID"
        fi
    ;;
esac
```

</details>

<details> <summary> launch.sh </summary>

File `launch.sh`

```sh
#!/usr/bin/env bash
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


## enable it for all monitors
# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar --reload example &
#   done
# else
#   polybar --reload example &
# fi

# just prefer on right monitor USe `xrandr` to get the monitor's name
MONITOR=DisplayPort-2 polybar --reload example &
```

</details>
