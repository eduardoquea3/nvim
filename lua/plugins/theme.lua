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
        style = "darker",
      }
      -- vim.cmd.colorscheme("onedark")
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
    opts = {},
    config = function()
      vim.cmd.colorscheme "tokyonight-night"
    end,
  },
}
