return {
  {
    "brianhuster/live-preview.nvim",
    cmd = { "LivePreview" },
    config = function()
      require("live-preview").setup()
    end,
  },
}
