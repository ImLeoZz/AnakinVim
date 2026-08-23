# CrazyVim — Cheatsheet complet

Config Neovim modulaire et générale (pas spécifique à un langage). Leader = `<Space>`. Mode : n = normal, i = insertion, v = visuel, x = visuel étendu, c = commande, t = terminal, o = operator-pending.

⚠️ Ce fichier couvre les raccourcis **par défaut de LazyVim** et ceux des **plugins ajoutés** dans ce repo. Si tu as personnalisé des touches dans `config/keymaps.lua`, elles priment sur ce qui est listé ici — vérifie ce fichier en cas de doute, ou fais `<Space>sk` pour lister tes vrais keymaps actifs en live.

## 1. Général / édition

| Touche | Action | Mode |
|---|---|---|
| `<Esc>` | Quitter insertion + effacer surbrillance recherche | i,n |
| `<C-s>` | Sauvegarder le fichier | n,i,x,s |
| `<A-j>` / `<A-k>` | Déplacer la ligne bas/haut | n,i,v |
| `gco` / `gcO` | Ajouter commentaire en dessous / au-dessus | n |
| `gc` | Commenter la sélection | v |
| `n` / `N` | Résultat suivant / précédent | n,x,o |
| `<Space>ur` | Redraw / clear hlsearch | n |
| `<Space>un` | Fermer toutes les notifications | n |
| `m{a-z}` | Poser une marque locale | n |
| `'{marque}` | Sauter à une marque | n |

## 2. Fenêtres

| Touche | Action |
|---|---|
| `<C-h/j/k/l>` | Aller à la fenêtre gauche/bas/haut/droite |
| `<C-Up>/<C-Down>` | Augmenter/diminuer hauteur fenêtre |
| `<C-Left>/<C-Right>` | Diminuer/augmenter largeur fenêtre |
| `<Space>-` | Split en dessous |
| `<Space>\|` | Split à droite |
| `<Space>wd` | Fermer la fenêtre |
| `<Space>wm` | Toggle zoom/maximiser |

## 3. Buffers

| Touche | Action |
|---|---|
| `<S-h>` / `<S-l>` | Buffer précédent / suivant |
| `[b` / `]b` | Buffer précédent / suivant |
| `<Space>bb` | Passer au buffer précédent |
| `<Space>bd` | Fermer le buffer |
| `<Space>bo` | Fermer tous les autres buffers |
| `<Space>bp` | Pin/unpin le buffer |
| `<Space>,` | Picker de tous les buffers |

## 4. Fichiers / recherche

| Touche | Action |
|---|---|
| `<Space>e` | Explorateur de fichiers (racine projet) |
| `<Space>E` | Explorateur de fichiers (dossier courant) |
| `<Space>ff` | Chercher un fichier (racine) |
| `<Space>fF` | Chercher un fichier (dossier courant) |
| `<Space>fr` | Fichiers récents |
| `<Space>fn` | Nouveau fichier |
| `<Space>fg` | Chercher fichiers git |
| `<Space>/` ou `<Space>sg` | Grep dans le projet |
| `<Space>sw` | Chercher le mot sous le curseur |
| `<Space>sb` | Chercher dans les lignes du buffer |
| `<Space>sh` | Pages d'aide |
| `<Space>sk` | Lister tous les keymaps actifs |
| `<Space>sr` | Rechercher/remplacer |

## 5. LSP (tous langages avec un serveur configuré)

| Touche | Action |
|---|---|
| `K` | Documentation au survol |
| `gd` | Aller à la définition |
| `gr` | Références |
| `gI` | Aller à l'implémentation |
| `gy` | Aller à la définition de type |
| `gD` | Aller à la déclaration |
| `gK` | Aide sur la signature |
| `<Space>ca` | Code action |
| `<Space>cr` | Renommer le symbole |
| `<Space>cf` | Formater le fichier/la sélection |
| `[d` / `]d` | Diagnostic précédent/suivant |
| `<Space>cd` | Diagnostic de la ligne |
| `<Space>xx` | Liste des diagnostics (Trouble) |

## 6. Git

| Touche | Action |
|---|---|
| `<Space>gs` | Git status |
| `<Space>gd` | Git diff (hunks) |
| `<Space>gb` | Git blame de la ligne |
| `<Space>gl` | Git log |

## 7. Autocomplétion — blink.cmp

| Touche | Action |
|---|---|
| `<C-space>` | Ouvrir le menu de complétion / doc |
| `<C-e>` | Annuler la complétion |
| `<C-y>` | Sélectionner et accepter l'item |
| `<Tab>` / `<S-Tab>` | Naviguer les placeholders de snippet |
| `<Up>` / `<Down>` | Naviguer les items |
| `<C-p>` / `<C-n>` | Naviguer les items (mapping perso) |
| `<C-b>` / `<C-f>` | Scroller la doc vers le haut/bas |
| `<C-k>` | Afficher/masquer l'aide de signature |
| `<CR>` | Valider la sélection (preset selon config) |

> Note stabilité : si tu vois un "ghost text" qui reste affiché après avoir tapé, c'est le bug corrigé dans les derniers commits — vérifie que `plugins/blink.lua` utilise bien un preset cohérent (`default` ou `super-tab`) et qu'aucun autocmd de `config/autocmds.lua` ne réécrit les mêmes events (`InsertEnter`/`TextChangedI`).

## 8. Treesitter — sélection incrémentale (tous langages installés)

| Touche | Action |
|---|---|
| `gnn` (ou touche custom dans `treesitter.lua`) | Initialiser la sélection sur le nœud |
| `grn` | Étendre au nœud parent |
| `grc` | Étendre au scope parent |
| `grm` | Réduire au nœud précédent |
| `]n` / `[n` | Nœud suivant / précédent (visuel) |
| `]N` / `[N` | Étendre au nœud suivant/précédent |

## 9. Emmet (module optionnel, pas le cœur de la config)

| Touche | Action |
|---|---|
| `<C-y>,` | Déclencheur par défaut : expand l'abréviation Emmet |
| `<C-y>n` / `<C-y>N` | Aller à la balise suivante/précédente |
| `<C-y>d` | Supprimer la balise |
| `<C-y>/` | Toggle commentaire |
| `<C-y>k` / `<C-y>j` | Monter/descendre d'une balise |

Tape une abréviation comme `div.card>ul>li*3` puis déclenche l'expansion avec la touche ci-dessus. Utile ponctuellement, mais reste un module optionnel de la config, pas son objectif principal.

## 10. Live-preview (module optionnel : Markdown/HTML)

| Commande | Action |
|---|---|
| `:LivePreview start` | Lancer la prévisualisation dans le navigateur |
| `:LivePreview stop` | Arrêter la prévisualisation |
| `:LivePreview pick` | Choisir le fichier à prévisualiser |

## 11. Snacks.nvim (QoL générale)

| Touche/commande | Action |
|---|---|
| `<Space>.` ou dashboard au lancement | Ouvrir le dashboard snacks |
| Terminal flottant (touche définie dans `snacks.lua`, ex. `<C-/>` ou `<Space>ft`) | Ouvrir/fermer un terminal flottant |
| Notifications | Remplace `vim.notify` avec un affichage amélioré |

> Vérifie `plugins/snacks.lua` pour la touche exacte du terminal flottant que tu as configurée (le repo mentionne son ajout dans le commit "add some plugins to QOL (term)").

## 12. Divers / plugin manager

| Touche | Action |
|---|---|
| `<Space>l` | Ouvrir Lazy (gestionnaire de plugins) |
| `<Space>cm` | Ouvrir Mason (gestionnaire LSP/DAP) |
| `<Space>?` | Voir les keymaps du buffer courant (which-key) |
| `<Space>qq` | Quitter tout |

---

**À vérifier toi-même** : je n'ai pas pu lire le contenu brut de tes fichiers `.lua` via l'API GitHub (le connecteur confirme le téléchargement mais ne renvoie pas le texte), donc les touches personnalisées que tu as éventuellement redéfinies dans `config/keymaps.lua`, `plugins/blink.lua` ou `plugins/snacks.lua` ne sont pas garanties d'être exactement celles listées ici. Lance `<Space>sk` dans Neovim pour voir la liste exacte et exhaustive de tes keymaps actifs, et ajuste ce fichier si besoin.
