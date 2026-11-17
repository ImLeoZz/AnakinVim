return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--fallback-style=file",
          "--header-insertion=never",
          "--query-driver=/usr/bin/*",
          "--compile-commands-dir=.",
        },
        init_options = {
          fallbackFlags = { "-xc", "-Wall", "-Wextra", "-Werror" },
        },
      },
    },
  },
}
