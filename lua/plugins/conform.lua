local toolchain = require "config.toolchain"

local function formatter_label(bufnr)
  local conform = require "conform"
  local formatters, will_use_lsp = conform.list_formatters_to_run(bufnr)
  local names = vim.tbl_map(function(formatter)
    return formatter.name
  end, formatters)

  if will_use_lsp then
    names[#names + 1] = "LSP"
  end

  if #names == 0 then
    return "nothing"
  end

  return table.concat(names, ", ")
end

local function format_and_notify(bufnr, async)
  local conform = require "conform"
  local label = formatter_label(bufnr)
  conform.format({
    bufnr = bufnr,
    async = async,
    lsp_format = "fallback",
    timeout_ms = 500,
  }, function(err, did_edit)
    if not err and did_edit then
      vim.notify("Saved " .. label, vim.log.levels.INFO, { title = "Conform" })
    end
  end)
end

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<a-s>",
      function()
        format_and_notify(vim.api.nvim_get_current_buf(), true)
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  opts = {
    formatters = {
      stylua = {
        args = { "--config-path", vim.fn.stdpath "config" .. "/formatters/stylua.toml", "-" },
      },
      ruff_format = {
        args = {
          "format",
          "--config",
          vim.fn.stdpath "config" .. "/formatters/ruff.toml",
          "--stdin-filename",
          "$FILENAME",
          "-",
        },
      },
      ruff_organize_imports = {
        args = {
          "check",
          "--select",
          "I",
          "--fix",
          "--config",
          vim.fn.stdpath "config" .. "/formatters/ruff.toml",
          "--stdin-filename",
          "$FILENAME",
          "-",
        },
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },

      -- Web technologies
      javascript = function(bufnr)
        local selected_toolchain, _ = toolchain.detect(vim.api.nvim_buf_get_name(bufnr))
        if selected_toolchain == "oxc" then
          return { "oxfmt" }
        end
        return { "biome", "biome-check", "biome-organize-imports" }
      end,
      typescript = function(bufnr)
        local selected_toolchain, _ = toolchain.detect(vim.api.nvim_buf_get_name(bufnr))
        if selected_toolchain == "oxc" then
          return { "oxfmt" }
        end
        return { "biome", "biome-check", "biome-organize-imports" }
      end,
      javascriptreact = function(bufnr)
        local selected_toolchain, _ = toolchain.detect(vim.api.nvim_buf_get_name(bufnr))
        if selected_toolchain == "oxc" then
          return { "oxfmt" }
        end
        return { "biome", "biome-check", "biome-organize-imports" }
      end,
      typescriptreact = function(bufnr)
        local selected_toolchain, _ = toolchain.detect(vim.api.nvim_buf_get_name(bufnr))
        if selected_toolchain == "oxc" then
          return { "oxfmt" }
        end
        return { "biome", "biome-check", "biome-organize-imports" }
      end,
      json = function(bufnr)
        local selected_toolchain, _ = toolchain.detect(vim.api.nvim_buf_get_name(bufnr))
        if selected_toolchain == "oxc" then
          return { "oxfmt" }
        end
        return { "biome" }
      end,
      jsonc = function(bufnr)
        local selected_toolchain, _ = toolchain.detect(vim.api.nvim_buf_get_name(bufnr))
        if selected_toolchain == "oxc" then
          return { "oxfmt" }
        end
        return { "biome" }
      end,
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
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("conform_format", { clear = true }),
      callback = function(args)
        format_and_notify(args.buf, false)
      end,
    })
  end,
}
