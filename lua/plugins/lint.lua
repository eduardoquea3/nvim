return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require "lint"

    -- Configure custom linters using Mason-managed tools
    -- Configure linters by filetype (using Mason-managed tools)
    lint.linters_by_ft = {
      -- JavaScript/TypeScript
      javascript = { "biomejs" },
      typescript = { "biomejs" },
      javascriptreact = { "biomejs" },
      typescriptreact = { "biomejs" },
      jsonc = { "biomejs" },
      json = { "biomejs" },

      -- Lua
      lua = { "selene" },

      -- Shell
      sh = { "shellcheck" },
      bash = { "shellcheck" },
      zsh = { "shellcheck" },

      -- python
      python = { "ruff" },
    }

    -- Auto-lint on save and text changes
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- Manual linting command
    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
      vim.notify("Linting...", vim.log.levels.INFO, { title = "nvim-lint" })
    end, { desc = "Trigger linting for current file" })

    -- Show linter status
    vim.keymap.set("n", "<leader>li", function()
      local linters = lint.linters_by_ft[vim.bo.filetype] or {}
      if #linters == 0 then
        print("No linters configured for filetype: " .. vim.bo.filetype)
      else
        print("Linters for " .. vim.bo.filetype .. ": " .. table.concat(linters, ", "))
      end
    end, { desc = "Show available linters for current filetype" })
  end,
}
