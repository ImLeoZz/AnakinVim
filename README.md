# CrazyVim — Ma configuration Neovim / My Neovim Configuration

Une configuration Neovim personnelle, pensée pour un workflow rapide, simple et agréable dans le terminal.
A personal Neovim configuration, designed for a fast, simple, and enjoyable terminal workflow.

> Cette configuration évolue régulièrement au fil de mes projets. / This configuration evolves regularly as my projects progress.

## Sommaire / Table of Contents

- [Fonctionnalités / Features](#fonctionnalités--features)
- [Installation](#installation)
- [Structure](#structure)
- [Commandes utiles / Useful Commands](#commandes-utiles--useful-commands)
- [Raccourcis / Keybindings](#raccourcis--keybindings)
- [Personnalisation / Customization](#personnalisation--customization)
- [Dépannage / Troubleshooting](#dépannage--troubleshooting)

## Fonctionnalités / Features

- Configuration écrite en Lua. / Written in Lua.
- Gestion des plugins avec [lazy.nvim](https://github.com/folke/lazy.nvim). / Plugin management with lazy.nvim.
- Coloration syntaxique avancée avec Treesitter. / Advanced syntax highlighting with Treesitter.
- Autocomplétion, diagnostics et navigation grâce au LSP. / Autocompletion, diagnostics and navigation via LSP.
- Recherche rapide de fichiers, de texte et de symboles. / Fast file, text and symbol search.
- Raccourcis personnalisés avec la touche `<Leader>`. / Custom keybindings using the `<Leader>` key.
- Environnement adapté au C, Lua, Python, Shell et Markdown. / Environment suited for C, Lua, Python, Shell and Markdown.
- Configuration organisée en modules. / Configuration organized into modules.

## Installation

### Prérequis / Prerequisites

- Neovim.
- Git.
- Un compilateur C (`gcc` ou `clang`) si vous codez en C. / A C compiler (`gcc` or `clang`) if you code in C.
- `ripgrep`, recommandé pour la recherche de texte. / `ripgrep`, recommended for text search.
- Node.js, Python ou autres runtimes selon les LSP utilisés. / Node.js, Python or other runtimes depending on the LSP servers used.

### Cloner la configuration / Cloning the configuration

```bash
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
git clone https://github.com/ImLeoZz/CrazyVim ~/.config/nvim
nvim
```

Au premier démarrage, `lazy.nvim` installe automatiquement les plugins. / On first launch, `lazy.nvim` automatically installs the plugins.

### Mise à jour / Updating

```bash
cd ~/.config/nvim
git pull
nvim
```

```vim
:Lazy sync
```

## Structure

```text
~/.config/nvim/
├── init.lua                  # Point d'entrée / Entry point
├── lazy-lock.json            # Versions verrouillées / Locked plugin versions
├── lua/
│   ├── config/               # Options générales et raccourcis / General options & keymaps
│   ├── plugins/              # Déclarations des plugins / Plugin declarations
│   └── [modules]/            # Modules personnels / Personal modules
└── README.md                 # Documentation
```

## Commandes utiles / Useful Commands

| Commande / Command | Description (FR / EN) |
|---|---|
| `:checkhealth` | Vérifie l'état de Neovim / Checks Neovim's health |
| `:Lazy` | Ouvre le gestionnaire de plugins / Opens the plugin manager |
| `:Lazy sync` | Installe et met à jour les plugins / Installs and updates plugins |
| `:Mason` | Gère les serveurs LSP / Manages LSP servers |
| `:LspInfo` | Affiche les serveurs LSP actifs / Shows active LSP servers |
| `:TSUpdate` | Met à jour les parsers Treesitter / Updates Treesitter parsers |
| `:Tutor` | Tutoriel intégré de Vim / Built-in Vim tutorial |

## Raccourcis / Keybindings

> Adaptez ce tableau aux raccourcis réels de votre config. / Adapt this table to your actual config.

### Fichiers et recherche / Files & Search

| Raccourci / Key | Mode | Action (FR / EN) |
|---|---|---|
| `<Leader>` | Tous / All | Préfixe des raccourcis / Leader prefix |
| `<Leader>ff` | Normal | Rechercher un fichier / Find a file |
| `<Leader>fg` | Normal | Rechercher du texte / Live grep text search |
| `<Leader>fb` | Normal | Rechercher un buffer / Find a buffer |
| `<Leader>fh` | Normal | Rechercher dans l'aide / Search Neovim help |
| `<Leader>fr` | Normal | Fichiers récents / Recent files |
| `<Leader>e` | Normal | Ouvrir/fermer l'explorateur / Toggle file explorer |
| `<Leader>o` | Normal | Recentrer l'explorateur / Focus explorer on file |

### LSP et code / LSP & Code

| Raccourci / Key | Mode | Action (FR / EN) |
|---|---|---|
| `K` | Normal | Documentation sous le curseur / Hover documentation |
| `gd` | Normal | Aller à la définition / Go to definition |
| `gD` | Normal | Aller à la déclaration / Go to declaration |
| `gi` | Normal | Aller à l'implémentation / Go to implementation |
| `gr` | Normal | Afficher les références / Show references |
| `<Leader>ca` | Normal/Visual | Actions de code / Code actions |
| `<Leader>rn` | Normal | Renommer le symbole / Rename symbol |
| `[d` / `]d` | Normal | Diagnostic précédent/suivant / Prev/next diagnostic |
| `<Leader>d` | Normal | Afficher le diagnostic / Show diagnostic |
| `<Leader>l` | Normal | Formater / Format file or selection |

### Buffers et fenêtres / Buffers & Windows

| Raccourci / Key | Mode | Action (FR / EN) |
|---|---|---|
| `<Leader>bn` | Normal | Buffer suivant / Next buffer |
| `<Leader>bp` | Normal | Buffer précédent / Previous buffer |
| `<Leader>bd` | Normal | Fermer le buffer / Close buffer |
| `<C-h>` / `<C-l>` | Normal | Fenêtre gauche/droite / Window left/right |
| `<C-j>` / `<C-k>` | Normal | Fenêtre bas/haut / Window down/up |
| `<Leader>sv` | Normal | Diviser verticalement / Split vertically |
| `<Leader>sh` | Normal | Diviser horizontalement / Split horizontally |

### Édition et divers / Editing & Misc

| Raccourci / Key | Mode | Action (FR / EN) |
|---|---|---|
| `<Leader>w` | Normal | Sauvegarder / Save file |
| `<Leader>q` | Normal | Quitter / Quit Neovim |
| `<Leader>/` | Normal | Commenter/décommenter / Toggle comment |
| `<Esc>` | Insert | Retour au mode Normal / Back to Normal mode |
| `jk` | Insert | Retour rapide au mode Normal / Quick exit to Normal |

Pour voir les raccourcis réels : / To see the actual keybindings:

```vim
:map
:verbose nmap <Leader>
```

## Personnalisation / Customization

```vim
:edit $MYVIMRC
```

Après une modification, redémarrez Neovim ou rechargez le fichier. / After a change, restart Neovim or reload the file.

```vim
:messages
:checkhealth
```

Ajoutez vos plugins dans `lua/plugins/`. / Add your plugins in `lua/plugins/`.

## Dépannage / Troubleshooting

### Les plugins ne s'installent pas / Plugins won't install

```vim
:Lazy sync
```

### Le LSP ne fonctionne pas / LSP isn't working

```vim
:LspInfo
:Mason
```

### Erreur au démarrage / Error on startup

```bash
nvim --clean
```

```vim
:messages
```

## Licence / License

Configuration personnelle, librement consultable. / Personal configuration, free to browse.

---

Configuration maintenue avec ❤️ et beaucoup de sessions terminal. / Maintained with ❤️ and lots of terminal sessions.

Enjoy it <333
