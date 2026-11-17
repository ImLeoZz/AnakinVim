-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.guicursor = "a:ver25"
vim.opt.expandtab = false -- convertit chaque tabulation en vrais espaces
vim.opt.spelllang = "en,fr" -- Ajoute les langues pour eviter les soulignement
vim.opt.virtualedit = "onemore" -- Laisse le curseur se deplacer au dernier caractere
vim.g.autoformat = false -- enlever l auto format

-- Fix tab/indentation in .c/.h
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "h" },
  callback = function()
    vim.bo.expandtab = false
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
  end,
})

-- Force .h with .c
vim.g.c_syntax_for_h = 1
