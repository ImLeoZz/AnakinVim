return {
  "MoulatiMehdi/42norm.nvim",
  ft = { "c", "h", "python" },
  config = function()
    require("42norm").setup({
      format_on_save = false,
      header_on_save = false,
      lint_on_change = true,
      timeout = 3000,
      ignore = {},
    })

    vim.keymap.set("n", "<F5>", require("42norm").check_norms, { desc = "Norminette" })
  end,
}
