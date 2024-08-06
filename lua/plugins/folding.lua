return {
  {
    "kevinhwang91/nvim-ufo",
    event = "User FileOpened",
    dependencies = "kevinhwang91/promise-async",
    keys = {
      {
        "<C-m>",
        function()
          local win = require("ufo").peekFoldedLinesUnderCursor()
          if not win then
            vim.notify "No se encontraron pliegues"
          end
        end,
        desc = "Previsualizar pliegue",
      },
    },
    opts = {
      open_fold_hl_timeout = 150,
      --close_fold_kinds = { "imports","comment" },
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
      -- provider_selector = function(bufnr, filetype, buftype)
      --   return { "treesitter", "indent" }
      -- end,
      provider_selector = function(_, filetype, buftype)
        local function handleFallbackException(bufnr, err, providerName)
          if type(err) == "string" and err:match "UfoFallbackException" then
            return require("ufo").getFolds(bufnr, providerName)
          else
            return require("promise").reject(err)
          end
        end

        return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
          or function(bufnr)
            return require("ufo")
              .getFolds(bufnr, "lsp")
              :catch(function(err)
                return handleFallbackException(bufnr, err, "treesitter")
              end)
              :catch(function(err)
                return handleFallbackException(bufnr, err, "indent")
              end)
          end
      end,
    },
  },
  {
    "luukvbaal/statuscol.nvim",
    event = "User FileOpened",
    config = function()
      -- local builtin = require "statuscol.builtin"
      -- require("statuscol").setup {
      --   relculright = true,
      --   segments = {
      --     { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
      --     {
      --       sign = { namespace = { "diagnostic/signs" }, maxwidth = 2, auto = true },
      --       click = "v:lua.ScSa",
      --     },
      --     { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
      --     {
      --       sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
      --       click = "v:lua.ScSa",
      --     },
      --   },
      -- }
      require("statuscol").setup()
    end,
  },
}
