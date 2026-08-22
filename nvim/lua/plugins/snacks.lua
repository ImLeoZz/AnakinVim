return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true, -- affiche les fichiers cachés (dotfiles) comme .env
          ignored = true, -- affiche aussi les fichiers ignorés par git (node_modules, etc.)
        },
      },
    },
  },
}
