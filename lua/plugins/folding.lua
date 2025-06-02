return {
  {
    "kevinhwang91/nvim-ufo",
    event = "User FileOpened",
    dependencies = "kevinhwang91/promise-async",
    keys = {
      { "<C-c>", "zc", desc = "Cerrar en el pliegue" },
      { "<C-a>", "zo", desc = "Abrir en el pliegue" },
    },
    opts = {
      open_fold_hl_timeout = 150,
      preview = {
        win_config = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
          winhighlight = "Normal:Normal",
          winblend = 0,
        },
        mappings = {
          scrollY = "<C-k>",
          scrollE = "<C-j>",
        },
      },
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
      -- provider_selector = function(_, filetype, buftype)
      --   local function handleFallbackException(bufnr, err, providerName)
      --     if type(err) == "string" and err:match "UfoFallbackException" then
      --       return require("ufo").getFolds(bufnr, providerName)
      --     else
      --       return require("promise").reject(err)
      --     end
      --   end
      --
      --   return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
      --     or function(bufnr)
      --       return require("ufo")
      --         .getFolds(bufnr, "lsp")
      --         :catch(function(err)
      --           return handleFallbackException(bufnr, err, "treesitter")
      --         end)
      --         :catch(function(err)
      --           return handleFallbackException(bufnr, err, "indent")
      --         end)
      --     end
      -- end,
    },
    config = function(_, opts)
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      require("ufo").setup(opts)
      vim.keymap.set("n", "<C-m>", function()
        local win = require("ufo").peekFoldedLinesUnderCursor()
        if not win then
          vim.notify "No se encontraron pliegues"
        end
      end, { desc = "Previsualizar pliegue", silent = true, noremap = true })
    end,
  },
}
