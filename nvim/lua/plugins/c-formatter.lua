return {
  "Diogo-ss/42-C-Formatter.nvim",
  ft = { "c", "h" },
  config = function()
    local group = vim.api.nvim_create_augroup("C_format_42", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.c", "*.h" },
      group = group,
      callback = function()
        if vim.fn.executable("c_formatter_42") == 1 then
          vim.bo.equalprg = "c_formatter_42"
          vim.cmd("silent! normal! gg=G")
        end
      end,
    })
  end,
}
