return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<A-s>",
      function()
        require("conform").format({
          async = true,
          timeout_ms = 500,
          lsp_fallback = true,
        }, function(err, did_edit)
          if not err and did_edit then
            vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
          end
        end)
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "biome" },
      typescript = { "biome" },
      javascriptreact = { "biome" },
      typescriptreact = { "biome" },
      jsonc = { "biome" },
      json = { "biome" },
      python = { "ruff_format", "ruff_organize_imports" },
      toml = { "taplo" },
    },
  },
}
