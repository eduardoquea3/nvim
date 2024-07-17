return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    -- enabled = false,
    config = function()
      require("catppuccin").setup {
        transparent_background = false,
        integrations = {
          cmp = true,
          notify = true,
          treesitter = true,
        },
        custom_highlights = function(c)
          return {
            NormalMoody = { fg = c.blue },
            InsertMoody = { fg = c.green },
            VisualMoody = { fg = c.pink },
            CommandMoody = { fg = c.maroon },
            ReplaceMoody = { fg = c.red },
            SelectMoody = { fg = c.pink },
            TerminalMoody = { fg = c.mauve },
            TerminalNormalMoody = { fg = c.mauve },
          }
        end,
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
    "sam4llis/nvim-tundra",
    name = "tundra",
    enabled = false,
    priority = 1000,
    config = function()
      local transparent = false
      vim.g.tundra_biome = "arctic" --jungle or arctic
      if vim.g.neovide then
        transparent = true
      end
      require("nvim-tundra").setup {
        transparent_background = transparent,
        syntax = {
          keywords = { italic = true },
          comments = { bold = true, italic = true },
        },
        plugins = {
          lsp = true,
          treesitter = true,
          telescope = true,
          cmp = true,
          dbui = true,
        },
        overwrite = {
          highlights = {
            WhichKey = { link = "NormalFloat" },
            WhichKeyBorder = { link = "FloatBorder" },

            WhichKeyGroup = { fg = "#6b7280" },
            WhichKeySeparator = { fg = "#98bc99" },
            WhichKeyDesc = { fg = "#FBC19D" },
            WhichKeyValue = { fg = "NONE" },

            NormalMoody = { fg = "#89b4fa" },
            InsertMoody = { fg = "#94e2d5" },
            VisualMoody = { fg = "#f5c2e7" },
            CommandMoody = { fg = "#cba6f7" },
            ReplaceMoody = { fg = "#b4befe" },
            SelectMoody = { fg = "#f9e2af" },
            TerminalMoody = { fg = "#eba0ac" },
            TerminalNormalMoody = { fg = "#eba0ac" },
          },
        },
      }
      vim.opt.background = "dark"
      vim.cmd.colorscheme "tundra"
    end,
  },
  {
    "diegoulloao/neofusion.nvim",
    priority = 1000,
    enabled = false,
    config = function()
      require("neofusion").setup()
      vim.o.background = "dark"
      -- vim.cmd.colorscheme("neofusion")
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
      }
      -- vim.cmd.colorscheme("cyberdream")
    end,
  },
}
