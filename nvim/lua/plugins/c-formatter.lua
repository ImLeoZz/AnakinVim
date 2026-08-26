return {
  "Diogo-ss/42-C-Formatter.nvim",
  cmd = "CFormat42",
  ft = { "c", "h" },
  config = function()
    require("42-formatter").setup({
      formatter = "c_formatter_42",
      filetypes = { c = true, h = true },
    })

    local group = vim.api.nvim_create_augroup("C_format_42", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.c", "*.h" },
      group = group,
      command = "CFormat42",
    })
  end,
}
