# AnakinVim

Config Neovim basée sur [LazyVim](https://www.lazyvim.org/), pensée pour le C et les projets 42 (norminette, header, formatage).

## 1. Prérequis

| Outil | Rôle |
|---|---|
| `neovim` >= 0.10 | éditeur |
| `git` | installation des plugins (lazy.nvim) |
| `norminette` | linter de la norme 42 |
| `c_formatter_42` | formatage selon la norme (au `:w`) |
| `curl`, `unzip` | téléchargement de la police |
| un compilateur C (`gcc`/`cc`) | treesitter |

Installation de la norminette et du formatter (avec `pipx`) :

```sh
pipx install norminette
pipx install c_formatter_42
pipx ensurepath   # puis ouvrir un NOUVEAU terminal
which norminette  # doit afficher un chemin
```

> `pipx` installe dans `~/.local/bin`. Si `which norminette` ne répond rien,
> ce dossier n'est pas dans ton `PATH` : c'est la cause n°1 de "la norme ne s'affiche plus".

## 2. Police (obligatoire)

Cette config utilise des icônes (explorateur, diagnostics, statusline).
Sans **Nerd Font**, tu verras des carrés vides `▯`.

**Police recommandée : JetBrainsMono Nerd Font.**

Important : nvim tourne *dans* ton terminal. **La police se règle dans le terminal, pas dans nvim.**

### Installation (Linux)

```sh
mkdir -p ~/.local/share/fonts
cd /tmp
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip -o JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
fc-cache -fv
fc-list | grep -i "JetBrainsMono Nerd"   # doit afficher des lignes
```

### Activation dans le terminal

- **xfce4-terminal** : Édition > Préférences > Apparence > décocher "Utiliser la police système" > choisir `JetBrainsMono Nerd Font`.
- **Autres terminaux** : cherche l'option "Font" dans les préférences et choisis la même police.

Astuce : si le zoom `Ctrl +` / `Ctrl -` ne réagit pas, c'est souvent la police
choisie qui n'a pas de tailles disponibles. Changer de police règle le problème.

## 3. Installation de la config

```sh
# sauvegarder l'ancienne config si elle existe
mv ~/.config/nvim ~/.config/nvim.bak

git clone https://github.com/ImLeoZz/AnakinVim ~/.config/nvim
nvim
```

Au premier lancement, `lazy.nvim` installe les plugins tout seul. Attends la fin,
puis quitte et relance `nvim`. Vérifie ensuite avec `:checkhealth`.

## 4. Raccourcis utiles

`<leader>` = `Espace`.

| Raccourci | Mode | Action |
|---|---|---|
| `F1` | normal | insère / met à jour le header 42 (`:Stdheader`) |
| `F5` | normal | lance la norminette sur le fichier |
| `Alt-h` | normal | buffer précédent |
| `Alt-l` | normal | buffer suivant |
| `<leader>qw` | normal | sauvegarde tout et quitte tout (force, terminaux inclus) |
| `Ctrl-a` | normal, visuel | sélectionne tout le fichier |
| `Ctrl-c` | visuel | copie la sélection dans le presse-papiers système |
| `Ctrl-h/j/k` | normal, terminal | navigation entre fenêtres (marche aussi depuis le terminal intégré) |
| `Ctrl-Haut/Bas` | terminal | redimensionne la fenêtre du terminal |
| `<leader>d` | normal, visuel | supprime **sans** écraser le registre de copie |
| `<leader>D` | normal | supprime jusqu'à la fin de ligne sans copier |
| `<leader>x` | normal | supprime un caractère sans copier |

Les raccourcis par défaut de LazyVim restent disponibles (`<leader>` seul affiche le menu `which-key`),
sauf `Shift-h` / `Shift-l` (changement de buffer) qui sont remplacés par `Alt-h` / `Alt-l`.
Ils retrouvent leur rôle natif de Vim : `H` = haut de l'écran, `L` = bas de l'écran.

## 5. Fonctionnement

### Norminette en direct
- Plugin : `42norm.nvim`, actif sur `.c`, `.h`, `.py`.
- Les erreurs apparaissent à côté des lignes (virtual text + signes).
- La norme est relancée à l'ouverture d'un buffer et après chaque sauvegarde.
- `F5` force une vérification manuelle.
- Test rapide : `:lua vim.print(vim.diagnostic.get(0))`. Une table vide `{}` veut dire aucune erreur **ou** norminette introuvable.

### Formatage automatique
- À chaque `:w` sur un `.c`/`.h`, le fichier passe par `c_formatter_42`.
- Si `c_formatter_42` n'est pas installé, le formatage est simplement ignoré (sans erreur).
- Pense à relire après sauvegarde : le formatter ne corrige pas tout, la norminette reste juge.

### Header 42
- `F1` insère le header (login et mail pris depuis `$USER`).
- Il se met à jour automatiquement à chaque sauvegarde (ligne `Updated`).
- Le mail est `$USER@student.42lyon.fr` par défaut. Ajuste `plugin/stdheader.vim` si besoin.

### Navigation entre buffers
- `Alt-h` / `Alt-l` parcourent les buffers ouverts (`:bprevious` / `:bnext`).
- Les terminaux ne s'affichent pas dans la barre d'onglets des buffers.

### Terminal intégré
- `Ctrl-h/j/k` fonctionne depuis un terminal en mode insertion.

### Anti-artefacts d'affichage
- Un `redraw` est déclenché à la sortie du mode insertion et après complétion,
  pour éviter les résidus visuels au changement de ligne.

## 6. Dépannage

| Problème | Piste |
|---|---|
| Plus d'erreurs de norme | `which norminette` ; sinon `pipx ensurepath` + nouveau terminal |
| Carrés vides à la place des icônes | police Nerd Font non installée ou non sélectionnée dans le terminal |
| `Ctrl +/-` ne zoome pas | changer de police dans le terminal |
| `Alt-h` / `Alt-l` ne changent pas de buffer | le terminal ou le gestionnaire de fenêtres capte `Alt` avant nvim ; teste dans un autre terminal ou libère le raccourci |
| Plugins cassés après mise à jour | `:Lazy restore` (revient au `lazy-lock.json`) |
| Diagnostic de santé | `:checkhealth` |

## 7. Structure

```
.
├── init.lua
├── lazyvim.json
├── lazy-lock.json         # versions figées des plugins
├── .clang-format
├── stylua.toml
├── plugin/
│   └── stdheader.vim      # header 42
└── lua/
    ├── config/            # options, keymaps, autocmds, lazy
    └── plugins/           # 42norm, c-formatter, snacks, blink, emmet, live-preview, treesitter
```
