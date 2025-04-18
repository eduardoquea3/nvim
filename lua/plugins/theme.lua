return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    enabled = false,
    -- lazy = true,
    config = function()
      require("catppuccin").setup {
        color_overrides = {
          -- mocha = {
          --   rosewater = "#ea6962",
          --   flamingo = "#ea6962",
          --   red = "#ea6962",
          --   maroon = "#ea6962",
          --   pink = "#d3869b",
          --   mauve = "#d3869b",
          --   peach = "#e78a4e",
          --   yellow = "#d8a657",
          --   green = "#a9b665",
          --   teal = "#89b482",
          --   sky = "#89b482",
          --   sapphire = "#89b482",
          --   blue = "#7daea3",
          --   lavender = "#7daea3",
          --   text = "#ebdbb2",
          --   subtext1 = "#d5c4a1",
          --   subtext0 = "#bdae93",
          --   overlay2 = "#a89984",
          --   overlay1 = "#928374",
          --   overlay0 = "#595959",
          --   surface2 = "#4d4d4d",
          --   surface1 = "#404040",
          --   surface0 = "#292929",
          --   base = "#1d2021",
          --   mantle = "#191b1c",
          --   crust = "#141617",
          -- },
        },
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
    opts = {
      compile = true,
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd.colorscheme "kanagawa-wave"
    end,
  },
}
