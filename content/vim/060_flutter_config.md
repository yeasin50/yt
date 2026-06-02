---
title: "Nvim+Flutter"
description: "Configure Flutter"
date: 2026-05-08T04:00:22+06:00
weight: 60
draft: false
tags: ["vim", "neovim", "flutter"]
categories: ["vim", "flutter"]
---

> **Tip:** I highly recommend checking out my first video, [Vim for Absolute Beginners](./200_basic_motion.md), before diving into the setup!

We are going to config our Nvim for Flutter

{{< youtube eWGVrgfPjxE >}}

<br>

We are going to play with

```sh
$~/.config/nvim.
❯ tree
├── init.lua
├── lazy-lock.json
├── lua
│   ├── config
│   │   ├── keymap.lua # gonna add a keymap
│   │   ├── run_file.lua # will create to for hot-reload
│   │   ├── lazy.lua
│   │   └── lsp
│   │       ├── ....
│   │       ├── init.lua
│   │       └── servers
│   │           ├── .....
│   │           ├── flutter.lua # our flutter configs
│   │           └── lua_ls.lua
│   └── plugins
│       ├── .... # rest stuff
│       ├── flutter_tools.lua # flutter nvim plugins
│       └── pubspec_assist.lua # show out-dated pkg
```

#### Custom keymap for hot-reload

```lua
---  nvim/config/run_file.lua
local M = {}

-- Dart (Flutter Reload)
function M.fileRunner()
	local ft = vim.bo.filetype

	if ft == "dart" then
		local terms = require("toggleterm.terminal").get_all()
		if #terms == 0 then
			vim.notify("⚠️ No terminal running", vim.log.levels.WARN)
			return
		end
		terms[1]:send("r\n")
		vim.notify("🔥 Sent hot reload to Flutter terminal")
	else
		vim.notify("❌ Unsupported filetype: " .. ft)
	end
end

return M
```

_Also make sure to have_

```lua
--- .....rest  configuration
-- extend the keymaps.lua
local run = require("config.run_file")

-- Smart Run keymap; you can use different key-map as you please
vim.keymap.set("n", "<leader>r", run.fileRunner, {
	desc = "Smart Run",
})
```

> All files can be found [here](/res/nvim.flutter.zip). Unzip as `nvim` and put into your `.config` folder.
> Make sure to have a backup.
