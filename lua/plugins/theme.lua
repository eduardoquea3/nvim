return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    enabled = false,
    -- lazy = true,
    config = function()
      require("catppuccin").setup {
        transparent_background = true,
        integrations = {
          cmp = true,
          notify = true,
          treesitter = true,
          alpha = true,
          gitsigns = true,
          harpoon = true,
          indent_blankline = {
            enabled = true,
            scope_color = "lavender",
            colored_indent_levels = false,
          },
          neotree = true,
          noice = true,
          ufo = true,
          symbols_outline = true,
          -- telescope = {
          -- enabled = true,
          -- style = "nvchad",
          -- },
          lsp_trouble = true,
          which_key = true,
        },
        styles = {
          keywords = { "italic" },
          booleans = { "italic" },
          comments = { "italic" },
          variables = { "italic" },
        },
      }
      if vim.g.neovide then
        require("catppuccin").setup {
          transparent_background = false,
        }
      end
      vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      require("cyberdream").setup {
        transparent = true,
        extensions = {
          telescope = true,
          cmp = true,
          alpha = true,
          gitsigns = true,
          indentblankline = true,
          -- lualine = true,
          noice = true,
          notify = true,
          treesitter = true,
          rainbow_delimiters = true,
          trouble = true,
          whichkey = true,
          helpview = true,
          markview = true,
        },
      }
      vim.cmd.colorscheme "cyberdream"
    end,
  },
  {
    "olivercederborg/poimandres.nvim",
    -- lazy = true,
    priority = 1000,
    -- enabled = false,
    opts = {
      disable_background = false,
    },
    init = function()
      vim.cmd.colorscheme "poimandres"
    end,
  },
}
