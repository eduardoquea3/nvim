local global = {
  opt = {
    incsearch = true, -- make search act like search in modern browsers
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 1, -- more space in the neovim command line for displaying messages
    completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0, -- so that `` is visible in markdown files
    fileencoding = "utf-8", -- the encoding written to a file
    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore
    showtabline = 0, -- always show tabs
    smartcase = true, -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- set term gui colors (most terminals support this)
    timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true, -- enable persistent undo
    updatetime = 100, -- faster completion (4000ms default)
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 2, -- the number of spaces inserted for each indentation
    cursorline = false, -- highlight the current line
    number = false, -- set numbered lines
    breakindent = true, -- wrap lines with indent
    relativenumber = false, -- set relative numbered lines
    numberwidth = 4, -- set number column width to 2 {default 4}
    signcolumn = "yes:1", --  show the sign column, otherwise it would shift the text each time
    wrap = false, -- display lines as one long line
    -- scrolloff = 8                                   -- Makes sure there are always eight lines of context
    -- sidescrolloff = 8                               -- Makes sure there are always eight lines of context
    showcmd = false, -- Don't show the command in the last line
    ruler = true, -- Don't show the ruler
    title = true, -- set the title of window to the value of the titlestring
    confirm = true, -- confirm to save changes before exiting modified buffer
    fillchars = { eob = " " }, -- change the character at the end of buffer
    -- winborder = "rounded" -- solid
    winborder = "single",
  },
  g = {
    mapleader = " ",
    maplocalleader = ",",
    snacks_animate = true,
    max_file = { size = 1024 * 100, lines = 10000 },
    autoformat_enabled = true,
    autopairs_enabled = true,
    cmp_enabled = true,
    codelens_enable = true,
    diagnostics_mode = 3,
    highlighturnl_enabled = true,
    icons_enabled = true,
    inlay_hints_enabled = true,
    lsp_handlers_enabled = true,
    semantic_tokens_enabled = true,
    ui_notifications_enabled = true,
    git_worktrees = nil,
  },
}

for scope, table in pairs(global) do
  for setting, value in pairs(table) do
    vim[scope][setting] = value
  end
end
vim.opt.fillchars:append { eob = " " }
