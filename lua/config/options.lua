vim.g.mapleader = " "

vim.opt.termguicolors = true

local opt = vim.o

opt.mouse = false
opt.number = true
opt.relativenumber = true
opt.hidden = true
opt.clipboard = "unnamed"
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.errorbells = false
opt.wrap = true
opt.swapfile = false
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.scrolloff = 4
opt.sidescrolloff = 4
opt.showmode = false
opt.splitbelow = true
opt.splitright = true
opt.autowrite = true
opt.list = true
opt.laststatus = 3
opt.cmdheight = 1
opt.updatetime = 50
opt.signcolumn = "yes"
opt.equalalways = false
opt.timeout = true
opt.timeoutlen = 300
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.shell = "pwsh"

vim.foldlevelstart = 999

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess = "filnxtToOFWIcC"
end

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.g.completeopt = "menu,menuone,noselect"

vim.opt.listchars:append("space: ")
vim.opt.listchars:append("eol: ")
