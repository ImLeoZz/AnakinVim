-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.guicursor = "a:ver25"
vim.opt.tabstop = 4 -- une tabulation affichée = 4 espaces de large
vim.opt.shiftwidth = 4 -- indentation (>>, <<, auto-indent) = 4 espaces
vim.opt.softtabstop = 4 -- la touche Tab insère l'équivalent de 4 espaces
vim.opt.expandtab = true -- convertit chaque tabulation en vrais espaces
vim.opt.spelllang = "en,fr" -- Ajoute les langues pour eviter les soulignement
--vim.opt.virtualedit = "onemore" -- Laisse le curseur se deplacer au dernier caractere
