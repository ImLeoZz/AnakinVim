return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local dict = vim.fn.stdpath("config") .. "/codebook/codebook.toml"

      vim.lsp.config("codebook", {
        init_options = {
          globalConfigPath = dict,
          diagnosticSeverity = "information",
        },
      })
      vim.lsp.enable("codebook")

      -- Ajoute le mot sous le curseur dans le dico versionné
      vim.keymap.set("n", "<leader>ca", function()
        local word = vim.fn.expand("<cword>"):lower()
        local lines = vim.fn.filereadable(dict) == 1 and vim.fn.readfile(dict) or {}
        local content = table.concat(lines, "\n")

        local words = {}
        local inner = content:match("words%s*=%s*%[(.-)%]")
        if inner then
          for w in inner:gmatch('"([^"]+)"') do
            words[#words + 1] = w
          end
        end

        for _, w in ipairs(words) do
          if w == word then
            vim.notify("Déjà dans le dico : " .. word)
            return
          end
        end
        words[#words + 1] = word
        table.sort(words)

        local quoted = {}
        for _, w in ipairs(words) do
          quoted[#quoted + 1] = '"' .. w .. '"'
        end
        local new = "words = [" .. table.concat(quoted, ", ") .. "]"

        if inner then
          content = content:gsub("words%s*=%s*%[.-%]", function()
            return new
          end)
        else
          content = content .. (content ~= "" and "\n" or "") .. new
        end

        vim.fn.mkdir(vim.fn.fnamemodify(dict, ":h"), "p")
        vim.fn.writefile(vim.split(content, "\n"), dict)
        for _, client in ipairs(vim.lsp.get_clients({ name = "codebook" })) do
  				client:stop()
				end
				vim.defer_fn(function()
  			vim.lsp.enable("codebook", false)
  			vim.lsp.enable("codebook")
				end, 300)
				vim.notify("Ajouté au dico : " .. word)
      end, { desc = "Codebook : ajouter le mot au dico" })
    end,
  },
}
