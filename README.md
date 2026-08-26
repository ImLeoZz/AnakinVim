# AnakinVim 🧠⚡

> Configuration Neovim personnelle, modulaire et généraliste, construite sur [LazyVim](https://www.lazyvim.org/).

🇬🇧 [Read in English](./README.en.md)

## Aperçu

AnakinVim est ma config Neovim de tous les jours. Elle part du framework **LazyVim** (LSP, Treesitter, fuzzy-finder, etc. inclus par défaut) et j'ajoute par-dessus une sélection de plugins pensés pour être utiles dans **n'importe quel contexte** (code, texte, scripts, config, etc.), pas seulement pour un langage ou un usage particulier. C'est une base générale et modulaire que j'étends au fil de mes besoins.

## Plugins ajoutés par-dessus LazyVim

| Plugin | Fichier | Rôle |
|---|---|---|
| **blink.cmp** | `plugins/blink.lua` | Moteur d'autocomplétion (LSP, snippets, buffer, path) |
| **emmet** | `plugins/emmet.lua` | Abréviations rapides pour la génération de balises/structures (utile en HTML/JSX, mais optionnel) |
| **live-preview.nvim** | `plugins/live-preview.lua` | Prévisualisation live dans le navigateur (Markdown/HTML/CSS/JS) |
| **snacks.nvim** | `plugins/snacks.lua` | Collection QoL générale : dashboard, terminal flottant, notifications, explorateur avec fichiers cachés/ignorés visibles |
| **nvim-treesitter** | `plugins/treesitter.lua` | Coloration syntaxique avancée + sélection incrémentale par nœud, pour tous les langages installés |
| **42-C-Formatter.nvim** | `plugins/c-formatter.lua` | Formatage automatique à la norme 42 pour les fichiers `.c`/`.h` à la sauvegarde |

## Installation

```bash
git clone https://github.com/ImLeoZz/AnakinVim.git ~/.config/nvim
nvim
```

Au premier lancement, `lazy.nvim` installe automatiquement tous les plugins listés dans `lazy-lock.json`.

### Prérequis

- Neovim ≥ 0.10
- Git
- Un [Nerd Font](https://www.nerdfonts.com/) installé dans ton terminal
- `ripgrep` et `fd` pour la recherche de fichiers/texte
- Un navigateur si tu utilises `live-preview.nvim`

## Structure du repo

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
        ├── c-formatter.lua
        ├── emmet.lua
        ├── live-preview.lua
        ├── snacks.lua
        └── treesitter.lua
```

Le découpage `config/` (comportement de base de l'éditeur) vs `plugins/` (un fichier par plugin) permet d'ajouter, retirer ou désactiver un module sans toucher au reste — c'est la logique modulaire de LazyVim, poussée jusqu'au bout.

## Raccourcis clavier

La liste complète des raccourcis (LazyVim + plugins ajoutés + raccourcis persos de `keymaps.lua`) est dans [`CHEATSHEET.md`](./CHEATSHEET.md).

Rappel rapide : la touche leader est `<Space>`. Appuie sur `<Space>` seul et laisse la fenêtre `which-key` s'ouvrir pour voir tout ce qui est disponible en contexte.

## Historique / notes de stabilité

Cette config a eu quelques itérations récentes sur l'autocomplétion (`blink.cmp`) et les autocmds — plusieurs commits ont corrigé un conflit entre un autocmd et une fonction, ainsi qu'un "ghost text" persistant, un conflit entre `Ctrl-A` et le déplacement du curseur, et l'écrasement du presse-papiers par les suppressions. Si tu rencontres un comportement bizarre à l'insertion, regarde en priorité `plugins/blink.lua` et `config/autocmds.lua`.

## Licence

Usage personnel, libre de t'en inspirer.
