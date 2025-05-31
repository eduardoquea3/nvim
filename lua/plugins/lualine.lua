return {
  "nvim-lualine/lualine.nvim",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,
  enabled = true,
  event = "User FileOpened",
  config = function()
    local component = require "eduardo.lualine.component"
    require("lualine").setup {
      options = {
        theme = "auto",
        globalstatus = true,
        icons_enabled = true,
        component_separators = { left = "", right = "" },
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
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          component.mode,
          { "branch", icon = "", color = { fg = "#d9833d" } },
        },
        lualine_x = {
          "lsp_status",
          component.macro,
          component.spaces,
          "searchcount",
          "location",
        },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "lazy" },
    }
  end,
}
