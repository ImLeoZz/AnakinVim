-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Refresh for error indent image
vim.api.nvim_create_autocmd({ "CompleteDone", "InsertLeave", "CursorHold" }, {
  group = vim.api.nvim_create_augroup("fix_render_artifacts", { clear = true }),
  callback = function()
    if vim.fn.pumvisible() == 0 then
      vim.cmd("mode")
    end
  end,
})

-- Mark term buff for not showing in top tab
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.bo.buflisted = false
  end,
})
