return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    enabled = false,
    config = function()
      require("catppuccin").setup {
        transparent_background = false,
        integrations = {
          cmp = true,
          notify = true,
          treesitter = true,
        },
      }
      vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    enabled = false,
    config = function()
      require("onedark").setup {
        style = "deep",
        toggle_style_key = "<leader><tab>",
      }
      vim.cmd.colorscheme "onedark"
    end,
  },
  {
    "Shatur/neovim-ayu",
    name = "ayu",
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "ayu-mirage"
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    -- enabled = false,
    opts = {
      on_highlights = function(hl, c)
        local prompt = "#2d3149"
        hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
        }
        hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopePromptNormal = {
          bg = prompt,
        }
        hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePromptTitle = {
          bg = prompt,
          fg = prompt,
        }
        hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
        hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
        }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme "tokyonight-night"
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    enabled = false,
    config = function()
      vim.cmd.colorscheme "onedark_vivid"
    end,
  },
}
