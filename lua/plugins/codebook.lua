return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("codebook", {
        init_options = {
          globalConfigPath = vim.fn.stdpath("config") .. "/codebook/codebook.toml",
          diagnosticSeverity = "information",
        },
      })
      vim.lsp.enable("codebook")
    end,
  },
}
