---
title: "Rofi - App launcher"
date: 2025-05-31T20:00:00+06:00
weight: 1
draft: false
tags: ["intermediate", "linux", "ricing"]
categories: ["linux"]
---

## Rofi

X11 app launcher and switcher

{{< youtube N6W7j7rc8w0 >}}

Make sure to install the nerd fonts;
You can checkout [for windows](../../vim/01.0_installation_windows.md)
and [for linux](../../vim/01.2_installation_linux.md)

- Config

> Follow my github/codeberg for update dotfiles

```rasi
configuration {
    modi: "drun";
    show-icons: true;
    display-drun: "";
    drun-display-format: "{name}";
    font: "JetBrains Mono Nerd Font 11";
}

/* Tokyo Night / Bluish Theme Variables */
* {
    bg-col: #1A1B26;        /* Deep Tokyo Night background */
    bg-col-light: #24283B;  /* Used only for the search bar now */
    border-col: #7AA2F7;    /* Bright Tokyo Night blue */
    blue: #7AA2F7;
    fg-col: #C0CAF5;        /* Main text color */
    fg-col-muted: #565F89;  /* Muted text for placeholder */

    /* Base resets */
    background-color: transparent;
    text-color: @fg-col;
    margin: 0;
    padding: 0;
}

window {
    width: 35%;
    background-color: @bg-col;
    border: 2px solid;
    border-color: @border-col;
    border-radius: 10px;
    padding: 15px;
}

mainbox {
    background-color: transparent;
    spacing: 15px;
}

inputbar {
    children: [prompt, entry];
    background-color: @bg-col-light;
    border-radius: 8px;
    padding: 10px;
}

prompt {
    background-color: @blue;
    text-color: @bg-col;
    padding: 6px 12px;
    border-radius: 6px;
    margin: 0px 10px 0px 0px;
    font: "JetBrains Mono Nerd Font Bold 11";
}

entry {
    padding: 6px 0px;
    background-color: transparent;
    text-color: @fg-col;
    placeholder: "Search applications...";
    placeholder-color: @fg-col-muted;
}

listview {
    background-color: transparent;
    columns: 1;
    lines: 7;
    spacing: 6px;
    cycle: false;
    dynamic: true;
    scrollbar: false;
}


element {
    background-color: transparent; /* Melts perfectly into the main window */
    text-color: @fg-col;
    padding: 10px 12px;
    border-radius: 8px;
    spacing: 12px;
    orientation: horizontal;
}

element-icon {
    size: 24px;
    background-color: transparent;
}

element-text {
    background-color: transparent;
    text-color: inherit;
    vertical-align: 0.5;
}

element selected {
    background-color: transparent; /* No more clashing solid backgrounds */
    text-color: @blue;             /* Changes the text to match your outline */
    border: 2px solid;             /* Thicker outline for that neon/border vibe */
    border-color: @blue;           /* The Tokyo Night blue outline you liked */
}
```
