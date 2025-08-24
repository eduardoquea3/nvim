return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<a-s>",
      function()
        require("conform").format({ async = true }, function(err, did_edit)
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

      -- Web technologies
      javascript = { "biome", "biome-check", "biome-organize-imports" },
      typescript = { "biome", "biome-check", "biome-organize-imports" },
      javascriptreact = { "biome", "biome-check", "biome-organize-imports" },
      typescriptreact = { "biome", "biome-check", "biome-organize-imports" },
      json = { "biome" },
      jsonc = { "biome" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      astro = { "prettier" },

      -- Python
      python = { "ruff_format", "ruff_organize_imports" },

      -- Shell
      sh = { "shfmt" },
      bash = { "shfmt" },

      toml = { "taplo" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = {
      lsp_fallback = true,
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
