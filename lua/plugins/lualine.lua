return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "meuter/lualine-so-fancy.nvim",
  },
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,
  enabled = true,
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
        disabled_filetypes = {
          statusline = {
            "alfa-nvim",
            "alpha",
            "help",
            -- "neo-tree",
            "Trouble",
            "spectre_panel",
            "toggleterm",
            "TelescopePrompt",
            "lazy",
          },
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          "fancy_mode",
          {
            "fancy_filetype",
            ts_icon = "",
          },
          "fancy_branch",
          {
            "fancy_diagnostics",
            sources = { "nvim_lsp" },
            symbols = { error = " ", warn = " ", info = " " },
          },
          { "fancy_searchcount" },
        },
        lualine_x = {
          "fancy_macro",
          "fancy_lsp_servers",
          -- component.lsp,
          component.spaces,
          "fancy_diff",
          "fancy_location",
        },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
