local global = {
  opt = {
    encoding = "UTF-8",
    autowrite = true,
    backup = false,
    breakindent = true,
    clipboard = "unnamed",
    cmdheight = 0,
    completeopt = { "menu", "menuone", "noselect" },
    -- conceallevel = 3,
    confirm = true,
    copyindent = true,
    cursorline = true,
    fileencoding = "UTF-8",
    -- fillchars = [[foldopen:,foldclose:,fold: ,foldsep:│,diff:╱,eob: ]],
    foldenable = true,
    foldexpr = "",
    foldlevelstart = 99,
    -- foldcolumn = "1",
    -- fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
    foldcolumn = "0",
    formatoptions = "jcrolnt",
    grepformat = "%f:%l:%c:%m",
    grepprg = "rg --vimgrep",
    history = 100,
    inccommand = "nosplit",
    infercase = true,
    ignorecase = true,
    jumpoptions = "view",
    linebreak = true,
    list = true,
    mouse = "a",
    number = false,
    preserveindent = true,
    -- pumblend = 10,
    pumblend = 0,
    pumheight = 10,
    relativenumber = false,
    scrolloff = 4,
    shiftwidth = 2,
    showmode = false,
    showtabline = 2,
    signcolumn = "yes",
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    statuscolumn = "%s%=%{v:relnum?v:relnum:v:lnum} ",
    swapfile = false,
    tabstop = 2,
    termguicolors = true,
    timeoutlen = 500,
    undofile = true,
    updatetime = 200,
    virtualedit = "block",
    wrap = true,
    winblend = 0,
    writebackup = false,
  },
  g = {
    mapleader = " ",
    -- maplocalleader = ",",
    -- max_file = { size = 1024 * 100, lines = 10000 },
    -- autoformat_enabled = true,
    -- autopairs_enabled = true,
    -- cmp_enabled = true,
    -- codelens_enable = true,
    -- diagnostics_mode = 3,
    -- highlighturnl_enabled = true,
    -- icons_enabled = true,
    -- inlay_hints_enabled = true,
    -- lsp_handlers_enabled = true,
    -- semantic_tokens_enabled = true,
    -- ui_notifications_enabled = true,
    -- git_worktrees = nil,
  },
}

for scope, table in pairs(global) do
  for setting, value in pairs(table) do
    vim[scope][setting] = value
  end
end
