return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    enabled = false,
    lazy = true,
    config = function()
      require("catppuccin").setup {
        no_italic = true,
        transparent_background = true,
        integrations = {
          blink_cmp = true,
          diffview = true,
          gitsigns = true,
          treesitter = true,
          harpoon = true,
          noice = true,
          ufo = true,
          symbols_outline = true,
          lsp_trouble = true,
          which_key = true,
          dadbod_ui = true,
          snacks = {
            enable = true,
            indent_scope_color = "lavender",
          },
        },
        styles = {
          keywords = { "italic" },
          booleans = { "italic" },
          comments = { "italic" },
          variables = { "italic" },
        },
      }
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    lazy = true,
    config = function()
      require("onedarkpro").setup {
        highlights = {
          PmenuSel = { bg = "#4e5469" },
        },
        plugins = {
          nvim_lsp = true,
          treesitter = true,
          blink_cmp = true,
          diffview = true,
          gitsigns = true,
          lsp_saga = true,
          mason = true,
          snacks = true,
          toggleterm = true,
          trouble = true,
          which_key = true,
          vim_dadbod_ui = true,
        },
      }
      vim.cmd.colorscheme "onedark_dark"
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    -- lazy = true,
    enabled = false,
    config = function()
      vim.cmd.colorscheme "kanagawa"
    end,
  },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanso").setup {
        overrides = function(colors)
          local palette = colors.palette
          return {
            BlinkCmpMenu = { bg = "none" },
            BlinkCmpDoc = { bg = "none" },
          }
        end,
      }
      vim.cmd.colorscheme "kanso-zen"
    end,
  },
}
