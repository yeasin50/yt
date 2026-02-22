---
title: "Obsidian"
date: 2025-11-09T20:00:00+06:00
description: "Note-Taking App Setup, Tags, Links & Graph View Explained"
draft: false
weight: 2
tags: ["productivity", "tools", "markdown"]
---

Discover how to take smarter, more connected notes with Obsidian — all in Bangla!

Learn to take smarter, connected notes in Bangla using Obsidian!
This guide covers everything from setting up Obsidian and creating vaults to using tags, links, backlinks, graph view, and essential themes and plugins.

{{< youtube wLrQF9jnZWM >}}

<br>

I keep a bash alias to create note quickly

```bash
# ~/.dotfiles/bash/note_alias.bash

# --- Configuration ---
NOTES_DIR="$HOME/github/writings"
INBOX_DIR="$NOTES_DIR/00 - Inbox"

# --- Functions ---
note() {
  local filename="$1"

  if [[ -z "$filename" ]]; then
    echo "❌ Error: You must provide a note name. Usage: note <name>"
    return 1
  fi

  local filepath="$INBOX_DIR/${filename}.md"
  local date=$(date +%d-%m-%Y)

  mkdir -p "$INBOX_DIR"

  if [[ ! -f "$filepath" ]]; then
    cat > "$filepath" <<EOF
---
Author: Md. Yeasin Sheikh
Date: ${date}
Tags: [[in-progress]]
Source: github.com/yeasin50
wikilink: false
---

# ${filename}
EOF

    echo "✅ Created note: $filepath"
  else
    echo "⚠️ Note already exists: $filepath"
  fi

  nvim "$filepath"
}

note-gcp() {
  local msg="$*"

  if [[ -z "$msg" ]]; then
    echo "❌ Error: Commit message required. Usage: note-gcp \"your message\""
    return 1
  fi

  git -C "$NOTES_DIR" add .

  if git -C "$NOTES_DIR" diff --cached --quiet; then
    echo "⚠️ Nothing to commit."
  else
    git -C "$NOTES_DIR" commit -m "$msg"
    git -C "$NOTES_DIR" push
    echo "✅ Notes committed and pushed with message: \"$msg\""
  fi
}
```

And source this file into your `.bash_aliases` or `.bashrc`

```bash
# bash/.bash_aliases or  bash/.bashrc
source ~/.dotfiles/bash/note_alias.bash
```
