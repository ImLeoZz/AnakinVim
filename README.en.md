# My Neovim Configuration

A personal Neovim configuration, designed for a fast, simple, and enjoyable workflow in the terminal.

> This configuration evolves regularly as I work on projects and learn Lua, C, and Unix tools.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Structure](#structure)
- [Useful Commands](#useful-commands)
- [Keybindings](#keybindings)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)

## Features

- Configuration written in Lua.
- Plugin management with [lazy.nvim](https://github.com/folke/lazy.nvim), if present in this configuration.
- Syntax highlighting and better code understanding with Treesitter.
- Autocompletion, diagnostics, and navigation via LSP.
- Fast searching of files, text, and symbols.
- Custom keybindings using a `<Leader>` key.
- Environment suited for development in C, Lua, Shell, and Markdown.
- Configuration organized into modules for easier maintenance.

## Installation

### Prerequisites

Install the following before launching Neovim:

- Neovim.
- Git.
- A C compiler, such as `gcc` or `clang`, if you develop in C.
- A search tool such as `ripgrep`, recommended for text search.
- Node.js, Python, or other runtimes depending on the LSP servers used.

### Installing the Configuration

Back up your current configuration, then clone this repository:

```bash
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
git clone <YOUR_REPO_URL> ~/.config/nvim
nvim
```

On first launch, the plugin manager automatically installs the configured dependencies.

Replace `<YOUR_REPO_URL>` with the actual URL of your GitHub repository.

### Updating

```bash
cd ~/.config/nvim
git pull
nvim
```

Inside Neovim, you can then sync the plugins with the following command if `lazy.nvim` is used:

```vim
:Lazy sync
```

## Structure

The structure may look like this:

```text
~/.config/nvim/
├── init.lua                  # Configuration entry point
├── lazy-lock.json            # Locked plugin versions
├── lua/
│   ├── config/               # General options and keybindings
│   ├── plugins/              # Plugin declarations
│   └── [modules]/            # Personal modules
└── README.md                 # Documentation
```

`init.lua` is loaded automatically when Neovim starts. The other files are imported from this entry point.

## Useful Commands

| Command | Description |
|---|---|
| `:checkhealth` | Checks the status of Neovim and its dependencies |
| `:Lazy` | Opens the plugin manager interface |
| `:Lazy sync` | Installs and updates plugins |
| `:Mason` | Manages LSP servers and other tools, if Mason is installed |
| `:LspInfo` | Displays active LSP servers |
| `:TSUpdate` | Updates Treesitter parsers |
| `:Tutor` | Opens the built-in Vim tutorial |

## Keybindings

> Adapt this table to the keybindings actually present in your configuration.

| Keybinding | Mode | Action |
|---|---|---|
| `<Leader>` | All | Prefix for custom keybindings |
| `<Leader>ff` | Normal | Search for a file |
| `<Leader>fg` | Normal | Search for text in the project |
| `<Leader>fb` | Normal | Search an open buffer |
| `<Leader>e` | Normal | Open or close the file explorer |
| `K` | Normal | Show documentation under the cursor |
| `gd` | Normal | Go to definition |
| `gr` | Normal | Show references |
| `<Leader>ca` | Normal/Visual | Show code actions |
| `[d` / `]d` | Normal | Previous / next diagnostic |
| `<Leader>l` | Normal | Format the file or selection |

To see which keybindings are actually available, use:

```vim
:map
:verbose nmap <Leader>
```

## Customization

Configuration files are generally located in:

```bash
~/.config/nvim/
```

To edit the configuration from within Neovim:

```vim
:edit $MYVIMRC
```

After making a change, restart Neovim or reload the relevant file. To check for Lua errors:

```vim
:messages
:checkhealth
```

Add your plugins in `lua/plugins/` if your configuration uses `lazy.nvim`'s automatic import.

## Troubleshooting

### Plugins won't install

Check that Git is installed and your connection is working. Then run:

```vim
:Lazy sync
```

### LSP isn't working

Check that the server corresponding to the language is installed, then use:

```vim
:LspInfo
:Mason
```

### An error appears on startup

Launch Neovim without your configuration to determine whether the problem comes from a plugin or a Lua file:

```bash
nvim --clean
```

You can also check the messages with:

```vim
:messages
```

## License

Add your chosen license here, for example MIT, or indicate that this configuration is personal and freely available to view.

---

Configuration maintained with ❤️ and lots of terminal sessions.


