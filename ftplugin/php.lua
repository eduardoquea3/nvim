vim.keymap.set("n", "<c-x>", "I//<esc>", { desc = "Comment line php" })
vim.keymap.set("n", "<c-z>", "I<esc>lvld<esc>", { desc = "Comment line php" })

require("lspconfig").intelephense.setup {
  root_dir = require("lspconfig").util.root_pattern "php",
}
require("luasnip.loaders.from_vscode").lazy_load {}
