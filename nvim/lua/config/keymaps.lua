-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- function for move if we have direction
local function smart_move(direction)
  if vim.fn.mode() == "t" then
    vim.cmd("stopinsert")
  end
  vim.cmd("wincmd " .. direction)
  if (direction == "j" or direction == "k") and vim.bo.filetype == "snacks_picker_list" then
    vim.cmd("wincmd " .. direction)
  end
  if vim.bo.buftype == "terminal" then
    vim.cmd("startinsert")
  end
end

-- For nav in term to file (except term)
vim.keymap.set({ "n", "t" }, "<C-h>", function()
  smart_move("h")
end, { silent = true })
vim.keymap.set({ "n", "t" }, "<C-j>", function()
  smart_move("j")
end, { silent = true })
vim.keymap.set({ "n", "t" }, "<C-k>", function()
  smart_move("k")
end, { silent = true })
vim.keymap.set({ "n", "t" }, "<C-l>", function()
  smart_move("l")
end, { silent = true })

-- For create window terminal
vim.keymap.set("n", "<leader>t", function()
  vim.cmd("botright 12split")
  vim.cmd("terminal")
  vim.cmd("startinsert")
end, { silent = true, desc = "Ouvrir terminal en bas" })

-- For resize when mode its insert
vim.keymap.set("t", "<C-Up>", [[<C-\><C-n><Cmd>resize +3<CR><Cmd>startinsert<CR>]], { silent = true })
vim.keymap.set("t", "<C-Down>", [[<C-\><C-n><Cmd>resize -3<CR><Cmd>startinsert<CR>]], { silent = true })

-- For crtl c
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copier la sélection dans le presse-papiers système" })
