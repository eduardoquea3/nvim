return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require "lint"
    local toolchain = require "config.toolchain"

    -- Configure linters by filetype (using Mason-managed tools)
    lint.linters_by_ft = {
      -- Lua
      lua = { "selene" },

      -- Shell
      sh = { "shellcheck" },
      bash = { "shellcheck" },
      zsh = { "shellcheck" },

      -- python
      python = { "ruff" },
    }

    local function lint_buffer(bufnr)
      bufnr = bufnr or vim.api.nvim_get_current_buf()

      local filetype = vim.bo[bufnr].filetype
      if not toolchain.js_like(filetype) then
        lint.try_lint()
        return
      end

      local filename = vim.api.nvim_buf_get_name(bufnr)
      local selected_toolchain, root = toolchain.detect(filename)

      if selected_toolchain == "oxc" then
        if filetype == "json" or filetype == "jsonc" then
          return
        end

        lint.try_lint("oxlint", { cwd = root })
        return
      end

      lint.try_lint("biomejs", { cwd = root })
    end

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "TextChanged", "TextChangedI" }, {
      group = lint_augroup,
      callback = function(args)
        lint_buffer(args.buf)
      end,
    })

    -- Manual linting command
    vim.keymap.set("n", "<leader>ll", function()
      lint_buffer()
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
