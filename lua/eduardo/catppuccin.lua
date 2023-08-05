require("catppuccin").setup {
  flavour = "mocha",
  transparent_background = true,
  show_end_of_buffer = false,
  term_colors = true,
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = { "italic" },
    functions = { "italic" },
    keywords = { "italic" },
  },
  custom_highlights = function(colors)
    return {
      Comment = { fg = colors.flamingo },
      TabLineSel = { bg = colors.pink },
      CmpBorder = { fg = colors.surface2 },
      Pmenu = { bg = colors.none },
    }
  end,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    dashboard = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    neotree = true,
    which_key = false,
  },
}
vim.cmd.colorscheme "catppuccin"
