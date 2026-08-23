# CrazyVim 🧠⚡

> Personal, modular, general-purpose Neovim configuration built on top of [LazyVim](https://www.lazyvim.org/).

🇫🇷 [Lire en français](./README.md)

## Overview

CrazyVim is my daily-driver Neovim setup. It's built on the **LazyVim** framework (LSP, Treesitter, fuzzy-finder, etc. included by default), with a curated set of plugins layered on top that are useful in **any context** (code, plain text, scripts, config files, etc.), not tied to one specific language or workflow. It's a general, modular base I keep extending as needs come up.

## Plugins added on top of LazyVim

| Plugin | File | Purpose |
|---|---|---|
| **blink.cmp** | `plugins/blink.lua` | Completion engine (LSP, snippets, buffer, path) |
| **emmet** | `plugins/emmet.lua` | Quick abbreviation expansion for tags/structures (handy for HTML/JSX, but optional) |
| **live-preview.nvim** | `plugins/live-preview.lua` | Live browser preview (Markdown/HTML/CSS/JS) |
| **snacks.nvim** | `plugins/snacks.lua` | General-purpose QoL collection: dashboard, floating terminal, notifications, etc. |
| **nvim-treesitter** | `plugins/treesitter.lua` | Advanced syntax highlighting + node-based incremental selection, for every installed language |

## Installation

```bash
git clone https://github.com/ImLeoZz/CrazyVim.git ~/.config/nvim
nvim
```

On first launch, `lazy.nvim` automatically installs every plugin pinned in `lazy-lock.json`.

### Requirements

- Neovim ≥ 0.10
- Git
- A [Nerd Font](https://www.nerdfonts.com/) installed in your terminal
- `ripgrep` and `fd` for file/text search
- A browser if you use `live-preview.nvim`

## Repo structure

```
nvim/
├── init.lua
├── lazy-lock.json
├── lazyvim.json
├── stylua.toml
└── lua/
    ├── config/
    │   ├── autocmds.lua
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   └── options.lua
    └── plugins/
        ├── blink.lua
        ├── emmet.lua
        ├── live-preview.lua
        ├── snacks.lua
        └── treesitter.lua
```

The split between `config/` (core editor behavior) and `plugins/` (one file per plugin) lets you add, remove, or disable a module without touching anything else — LazyVim's modular philosophy taken all the way.

## Keymaps

The full list of keymaps (LazyVim defaults + added plugins) lives in [`CHEATSHEET.md`](./CHEATSHEET.md).

Quick reminder: the leader key is `<Space>`. Press `<Space>` alone and let the `which-key` popup show you everything available in context.

## Stability notes

This config went through a few recent iterations on completion (`blink.cmp`) and autocmds — several commits fixed a conflict between an autocmd and a function, plus a persistent "ghost text" issue. If you see weird insert-mode behavior, check `plugins/blink.lua` and `config/autocmds.lua` first.

## License

Personal use, feel free to get inspired by it.
