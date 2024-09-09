local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = false, notify = true },
  ui = {
    border = "rounded",
  },
}

function nmap(r, l, d)
  vim.keymap.set("n", r, l, { noremap = true, nowait = true, silent = true, desc = d })
end

nmap("<leader>ll", "<cmd>Lazy<cr>", "Lazy")
nmap("<leader>li", "<cmd>Lazy install<cr>", "Lazy install")
nmap("<leader>lu", "<cmd>Lazy update<cr>", "Lazy update")
nmap("<leader>lc", "<cmd>Lazy clean<cr>", "Lazy clean")
nmap("<leader>lp", "<cmd>Lazy profile<cr>", "Lazy profile")
