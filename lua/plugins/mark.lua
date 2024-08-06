return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = "markdown",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
  config = function()
    require("render-markdown").setup {}
  end,
}
