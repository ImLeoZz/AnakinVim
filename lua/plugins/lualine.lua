return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections.lualine_z = {
      function()
        return "\u{f0954} " .. os.date("%R")
      end,
    }
  end,
}
