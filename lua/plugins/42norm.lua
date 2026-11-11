return {
  "MoulatiMehdi/42norm.nvim",
  ft = { "c", "h", "python" },
  config = function()
    local norm = require("42norm")

    norm.setup({
      format_on_save = false,
      header_on_save = false,
      lint_on_change = true,
      timeout = 3000,
      ignore = {},
    })

    -- Le plugin est chargé paresseusement sur l'événement FileType :
    -- son propre autocmd FileType est créé APRÈS que l'événement a eu lieu,
    -- donc le premier buffer ouvert n'était jamais attaché au linter.
    -- On l'attache manuellement au buffer courant.
    norm.attach_to_buffer()

    -- Relancer la norme quand on revient sur un buffer ou après sauvegarde
    -- (sans redessiner tout l'écran : pas de CursorHold, pas de :mode).
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      group = vim.api.nvim_create_augroup("norm42_refresh", { clear = true }),
      pattern = { "*.c", "*.h", "*.py" },
      callback = function()
        norm.attach_to_buffer()
        norm.refresh_buffer()
      end,
    })

    -- S'assurer que les erreurs s'affichent à côté des lignes
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = false,
    })

    vim.keymap.set("n", "<F5>", norm.check_norms, { desc = "Norminette" })
  end,
}
