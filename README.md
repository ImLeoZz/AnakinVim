# Ma configuration Neovim

Une configuration Neovim personnelle, pensée pour un workflow rapide, simple et agréable dans le terminal.

> Cette configuration évolue régulièrement au fil de mes projets et de mon apprentissage de Lua, du C et des outils Unix.

## Sommaire

- [Fonctionnalités](#fonctionnalités)
- [Installation](#installation)
- [Structure](#structure)
- [Commandes utiles](#commandes-utiles)
- [Raccourcis](#raccourcis)
- [Personnalisation](#personnalisation)
- [Dépannage](#dépannage)

## Fonctionnalités

- Configuration écrite en Lua.
- Gestion des plugins avec [lazy.nvim](https://github.com/folke/lazy.nvim), si présent dans cette configuration.
- Coloration syntaxique et meilleure compréhension du code avec Treesitter.
- Autocomplétion, diagnostics et navigation grâce au LSP.
- Recherche rapide de fichiers, de texte et de symboles.
- Raccourcis personnalisés avec une touche `<Leader>`.
- Environnement adapté au développement en C, Lua, Shell et Markdown.
- Configuration organisée en modules pour faciliter la maintenance.

## Installation

### Prérequis

Installez les éléments suivants avant de lancer Neovim :

- Neovim.
- Git.
- Un compilateur C, comme `gcc` ou `clang`, si vous développez en C.
- Un outil de recherche comme `ripgrep`, recommandé pour la recherche de texte.
- Node.js, Python ou d'autres runtimes selon les serveurs LSP utilisés.

### Installation de la configuration

Sauvegardez votre configuration actuelle, puis clonez ce dépôt :

```bash
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
git clone <URL_DE_VOTRE_DEPOT> ~/.config/nvim
nvim
```

Au premier démarrage, le gestionnaire de plugins installe automatiquement les dépendances configurées.

Remplacez `<URL_DE_VOTRE_DEPOT>` par l'URL réelle de votre dépôt GitHub.

### Mise à jour

```bash
cd ~/.config/nvim
git pull
nvim
```

Dans Neovim, vous pouvez ensuite synchroniser les plugins avec la commande suivante si `lazy.nvim` est utilisé :

```vim
:Lazy sync
```

## Structure

La structure peut ressembler à ceci :

```text
~/.config/nvim/
├── init.lua                  # Point d'entrée de la configuration
├── lazy-lock.json            # Versions verrouillées des plugins
├── lua/
│   ├── config/               # Options générales et raccourcis
│   ├── plugins/              # Déclarations des plugins
│   └── [modules]/            # Modules personnels
└── README.md                 # Documentation
```

`init.lua` est chargé automatiquement au démarrage de Neovim. Les autres fichiers sont importés depuis ce point d'entrée.

## Commandes utiles

| Commande | Description |
|---|---|
| `:checkhealth` | Vérifie l'état de Neovim et de ses dépendances |
| `:Lazy` | Ouvre l'interface du gestionnaire de plugins |
| `:Lazy sync` | Installe et met à jour les plugins |
| `:Mason` | Gère les serveurs LSP et autres outils, si Mason est installé |
| `:LspInfo` | Affiche les serveurs LSP actifs |
| `:TSUpdate` | Met à jour les parsers Treesitter |
| `:Tutor` | Ouvre le tutoriel intégré de Vim |

## Raccourcis

> Adaptez ce tableau aux raccourcis réellement présents dans votre configuration.

| Raccourci | Mode | Action |
|---|---|---|
| `<Leader>` | Tous | Préfixe des raccourcis personnalisés |
| `<Leader>ff` | Normal | Rechercher un fichier |
| `<Leader>fg` | Normal | Rechercher du texte dans le projet |
| `<Leader>fb` | Normal | Rechercher un buffer ouvert |
| `<Leader>e` | Normal | Ouvrir ou fermer l'explorateur de fichiers |
| `K` | Normal | Afficher la documentation sous le curseur |
| `gd` | Normal | Aller à la définition |
| `gr` | Normal | Afficher les références |
| `<Leader>ca` | Normal/Visual | Afficher les actions de code |
| `[d` / `]d` | Normal | Diagnostic précédent / suivant |
| `<Leader>l` | Normal | Formater le fichier ou la sélection |

Pour connaître les raccourcis effectivement disponibles, utilisez :

```vim
:map
:verbose nmap <Leader>
```

## Personnalisation

Les fichiers de configuration se trouvent généralement dans :

```bash
~/.config/nvim/
```

Pour modifier la configuration depuis Neovim :

```vim
:edit $MYVIMRC
```

Après une modification, redémarrez Neovim ou rechargez le fichier concerné. Pour vérifier les erreurs Lua :

```vim
:messages
:checkhealth
```

Ajoutez vos plugins dans `lua/plugins/` si votre configuration utilise l'import automatique de `lazy.nvim`.

## Dépannage

### Les plugins ne s'installent pas

Vérifiez que Git est installé et que votre connexion fonctionne. Lancez ensuite :

```vim
:Lazy sync
```

### Le LSP ne fonctionne pas

Vérifiez que le serveur correspondant au langage est installé, puis utilisez :

```vim
:LspInfo
:Mason
```

### Une erreur apparaît au démarrage

Lancez Neovim sans votre configuration pour déterminer si le problème vient d'un plugin ou d'un fichier Lua :

```bash
nvim --clean
```

Vous pouvez aussi consulter les messages avec :

```vim
:messages
```

## Licence

Ajoutez ici la licence de votre choix, par exemple MIT, ou indiquez que cette configuration est personnelle et librement consultable.

---

Configuration maintenue avec ❤️ et beaucoup de sessions terminal.
