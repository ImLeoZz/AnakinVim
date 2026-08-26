return {
  "Diogo-ss/42-C-Formatter.nvim",
  ft = { "c", "h" },
  config = function()
    local group = vim.api.nvim_create_augroup("C_format_42", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.c", "*.h" },
      group = group,
      callback = function()
        if vim.fn.executable("c_formatter_42") ~= 1 then
          return
        end
        local bufnr = vim.api.nvim_get_current_buf()
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        local input = table.concat(lines, "\n") .. "\n"
        local output = vim.fn.system("c_formatter_42", input)
        if vim.v.shell_error == 0 and output ~= "" then
          local new_lines = vim.split(output, "\n", { trimempty = true })
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, new_lines)
        end
      end,
    })
  end,
}
