return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        -- LSP servers (matching your vim.lsp.enable() config)
        -- "lua-language-server", -- Lua LSP
        "emmylua_ls", -- Lua LSP
        "typescript-language-server", -- TypeScript LSP
        "tailwindcss-language-server", -- Tailwind CSS LSP
        "html-lsp", -- HTML LSP
        "css-lsp", -- CSS LSP
        "json-lsp",
        "yaml-language-server",
        "bash-language-server",
        "python-lsp-server",
        "astro-language-server",
        "emmet-language-server",

        -- format and lint python files
        "biome",
        "ruff",

        -- Formatters (for conform.nvim and general use)
        "stylua",
        "prettier",
        "shfmt",
        "taplo",

        -- Linters and diagnostics
        "selene",
        "shellcheck",
      },
    },
    config = function(_, opts)
      -- PATH is handled by core.mason-path for consistency
      require("mason").setup(opts)

      -- Auto-install ensure_installed tools with better error handling
      local mr = require "mason-registry"
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          if mr.has_package(tool) then
            local p = mr.get_package(tool)
            if not p:is_installed() then
              vim.notify("Mason: Installing " .. tool .. "...", vim.log.levels.INFO)
              p:install():once("closed", function()
                if p:is_installed() then
                  vim.notify("Mason: Successfully installed " .. tool, vim.log.levels.INFO)
                else
                  vim.notify("Mason: Failed to install " .. tool, vim.log.levels.ERROR)
                end
              end)
            end
          else
            vim.notify("Mason: Package '" .. tool .. "' not found", vim.log.levels.WARN)
          end
        end
      end

      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
}
