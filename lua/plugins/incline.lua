return {
  "b0o/incline.nvim",
  enabled = true,
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<Tab>", "<cmd>bnext<cr>", desc = "Cycle next buffer", mode = "n" },
    { "<Tab>", "<cmd>bprevious<cr>", desc = "Cycle next buffer", mode = "n" },
  },
  config = function()
    local devicons = require "nvim-web-devicons"
    local incline = require "incline"
    local helpers = require "incline.helpers"

    incline.setup {
      hide = {
        only_win = false,
      },
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then
          filename = "[No Name]"
        end
        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified
        return {
          ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
          " ",
          { filename, gui = modified and "bold,italic" or "bold" },
          " ",
        }
      end,
    }
  end,
}
