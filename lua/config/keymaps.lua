-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Function who add smart quit and save
local function save_all_and_force_quit()
  vim.cmd("silent! wa")
  vim.cmd("qa!")
end

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

-- For crtl a
vim.keymap.set({ "n", "v" }, "<C-a>", function()
  local ve = vim.o.virtualedit
  vim.o.virtualedit = ""
  vim.cmd("normal! ggVG")
  vim.o.virtualedit = ve
end, { desc = "Copier toute la page dans le presse-papiers système" })

-- For save and quit fast
vim.keymap.set("n", "<leader>qw", save_all_and_force_quit, { desc = "Save All & Force Quit All (incl. terminals)" })

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

-- For switch buffer: Alt+h (previous) / Alt+l (next), replaces LazyVim's Shift+h / Shift+l
pcall(vim.keymap.del, "n", "<S-h>")
pcall(vim.keymap.del, "n", "<S-l>")
vim.keymap.set("n", "<A-h>", "<cmd>bprevious<cr>", { silent = true, desc = "Prev Buffer" })
vim.keymap.set("n", "<A-l>", "<cmd>bnext<cr>", { silent = true, desc = "Next Buffer" })

-- For resize when mode its insert
vim.keymap.set("t", "<C-Up>", [[<C-\><C-n><Cmd>resize +3<CR><Cmd>startinsert<CR>]], { silent = true })
vim.keymap.set("t", "<C-Down>", [[<C-\><C-n><Cmd>resize -3<CR><Cmd>startinsert<CR>]], { silent = true })

-- For crtl c
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copier la sélection dans le presse-papiers système" })

-- For delete (black hole)
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { noremap = true, desc = "Delete without yanking" })
vim.keymap.set("n", "<leader>D", '"_D', { noremap = true, desc = "Delete to EOL without yanking" })
vim.keymap.set("n", "<leader>x", '"_x', { noremap = true, desc = "Delete char without yanking" })
