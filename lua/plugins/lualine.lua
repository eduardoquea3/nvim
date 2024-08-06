return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "meuter/lualine-so-fancy.nvim",
  },
  enabled = true,
  -- lazy = false,
  event = "VeryLazy",
  -- event = { "BufReadPost", "BufNewFile", "VeryLazy" },
  config = function()
    local component = require "eduardo.lualine.component"
    require("lualine").setup {
      options = {
        -- theme = require("neofusion.lualine"),
        -- theme = "catppuccin",
        theme = "auto",
        globalstatus = true,
        icons_enabled = true,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {
            "alfa-nvim",
            "alpha",
            "help",
            "neo-tree",
            "Trouble",
            "spectre_panel",
            "toggleterm",
            "TelescopePrompt",
            "lazy",
          },
          winbar = {},
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          { "fancy_filetype", ts_icon = "" },
          "fancy_branch",
          {
            "filename",
            path = 0,
            symbols = {
              modified = "  ",
            },
          },
          {
            "fancy_diagnostics",
            sources = { "nvim_lsp" },
            symbols = { error = " ", warn = " ", info = " " },
          },
          { "fancy_searchcount" },
        },
        lualine_x = {
          "fancy_lsp_servers",
          -- component.lsp,
          component.spaces,
          "fancy_diff",
          "progress",
        },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
}
