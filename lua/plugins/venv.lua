return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    { "mfussenegger/nvim-dap", ft = { "py" } },
    {
      "mfussenegger/nvim-dap-python",
      ft = { "py" },
    },
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  ft = "python",
  branch = "regexp", -- This is the regexp branch, use this for the new version
  config = function()
    require("venv-selector").setup()
    vim.keymap.set(
      "n",
      ",v",
      "<cmd>VenvSelect<cr>",
      { noremap = true, nowait = true, silent = true, desc = "Select Venv" }
    )
  end,
}
