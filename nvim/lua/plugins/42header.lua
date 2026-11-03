return {
  "Diogo-ss/42-header.nvim",
  cmd = { "Stdheader" },
  keys = { "<F1>" },
  opts = {
    default_map = true,
    auto_update = true,
    user = os.getenv("USER") or "login",
    mail = os.getenv("MAIL") or "login@student.42lyon.fr",
  },
  config = function(_, opts)
    require("42header").setup(opts)
  end,
}
