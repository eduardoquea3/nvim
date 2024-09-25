return {
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      { "mfussenegger/nvim-dap", ft = "python" },
      { "mfussenegger/nvim-dap-python", ft = "python" },
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    ft = "python",
    branch = "regexp",
    config = function()
      require("venv-selector").setup()
      vim.keymap.set(
        "n",
        ",v",
        "<cmd>VenvSelect<cr>",
        { noremap = true, nowait = true, silent = true, desc = "Select Venv" }
      )
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    ft = "python",
    opts = {
      ensure_installed = {
        "python",
      },
    },
  },
}
