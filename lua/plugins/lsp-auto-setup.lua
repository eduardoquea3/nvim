return {
  "Massolari/lsp-auto-setup.nvim",
  event = "User FileOpened",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = true,
  opts = {
    exclude = {
      "volar",
    },
  },
}
