-- File to emmet-vim import for shortcut HTML

return {
  {
    "mattn/emmet-vim",
    ft = { "html", "css" },
    config = function()
      vim.g.user_emmet_leader_key = "<C-y>"
      vim.g.user_emmet_mode = "a"
    end,
  },
}
