return {
  "utilyre/barbecue.nvim",
  event = "User FileOpened",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    theme = "catppuccin",
    show_dirname = false,
    show_basename = true,
    exclue_filetypes = {
      "gitcommit",
      "toggleterm",
      "neo-tree",
      "dashboard",
      "alpha",
    },
  },
}
