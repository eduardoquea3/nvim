return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  -- enabled = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian").setup {
      workspaces = {
        {
          name = "Notes",
          path = "D:/Notes",
        },
      },
      ui = {
        enable = true,
      },
    }
  end,
}
