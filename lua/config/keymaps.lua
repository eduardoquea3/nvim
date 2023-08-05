local opts = {
  mode = "n",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  ["<leader>"] = {
    l = { "<cmd>Twilight<cr>", "Modo centrado" },
    ["<leader>"] = { ":Telescope buffers<cr>", "Buffers" },
    s = { ":SearchBoxIncSearch<cr>", "Abrir buscador" },
    n = { ":Neotree float<cr>", "Abrir neotree" },
    a = { ":WhichKey<cr>", "Mostrar atajos" },
    r = {
      r = { ":luafile %<cr>", "Actualizar config" },
      n = { ":Lspsaga rename<cr>", "Renombrar" },
    },
    q = {
      q = { ":q!<cr>", "Cerrar neovim" },
      w = { ":q<cr>", "Cerrar neovim" },
    },
    w = {
      q = { ":wq<cr>", "Guardar y salir del archivo" },
      w = { ":w<cr>", "Guardar archivo" },
    },
    g = {
      g = { ":LazyGit<cr>", "Abrir lazygit" },
      h = { ":Lspsaga lsp_finder<cr>", "Finder LSP" },
    },
    v = {
      d = { ":bdelete<cr>", "Eliminar buffer" },
    },
    d = {
      b = { ":tab DBUI<cr>", "Abrir DB" },
      c = { ":tabclose<cr>", "Cerrar DB" },
    },
    f = {
      f = { ":Telescope find_files<cr>", "Archivos" },
      g = { ":Telescope live_grep<cr>", "Palabras" },
      d = { ":Telescope diagnostics<cr>", "Diagnosticos" },
      p = { ":Telescope project<cr>", "Projectos" },
      b = { ":Telescope file_browser hidden=true<cr>", "Carpetas" },
      n = { ":Telescope notify<cr>", "Notificaciones" },
    },
    o = {
      f = { ":Telescope oldfiles<cr>", "Recientes" },
      o = { ":Lspsaga outline<cr>", "Outline" },
    },
    c = {
      a = { ":Lspsaga code_action<cr>", "Code action" },
    },
    m = {
      i = { "<cmd>MarkdownPreview<cr>", "Previsualizar markdown" },
      s = { "<cmd>MarkdownPreviewStop<cr>", "Parar previsualización markdown" },
      c = { "<cmd>MarkdownPreviewToggle<cr>", "Cambiar previsualización markdown" },
    },
  },
  ["["] = {
    d = { ":Lspsaga diagnostic_jump_prev<cr>", "Anterior diagnostico" },
    h = { "<cmd>GitGutterNextHunk<cr>", "Saltar al proximo cambio" },
  },
  ["]"] = {
    d = { ":Lspsaga diagnostic_jump_next<cr>", "Siguiente diagnostico" },
    h = { "<cmd>GitGutterPrevHunk<cr>", "Saltar al anterior cambio" },
  },
  ["<C-a>"] = { "zo", "Abrir pliege" },
  ["<C-c>"] = { "zc", "Cerrar pliege" },
  ["<S-Tab>"] = { ":bprevious<cr>", "Tabular atras" },
  ["<Tab>"] = { ":bnext<cr>", "Tabular" },
  ["<C-q>"] = { "<cmd>Vista!!<cr>", "Vista" },
  ["<C-h>"] = { "<C-w>h", "Movements" },
  ["<C-j>"] = { "<C-w>j", "Movements" },
  ["<C-k>"] = { "<C-w>k", "Movements" },
  ["<C-l>"] = { "<C-w>l", "Movements" },
  ["<C-x>"] = { "<cmd>Trouble<cr>", "Trouble" },
  ["<C-m>"] = { require("ufo").peekFoldedLinesUnderCursor, "Previsualizar pliegue" },
  ["<C-s>"] = {
    function()
      vim.lsp.buf.format { async = true }
    end,
    "Formateo con null-ls",
  },
  ["<A-j>"] = { ":m .+1<cr>==", "Mover abajo linea" },
  ["<A-k>"] = { ":m .-2<cr>==", "Mover arriba linea" },
  ["<A-m>"] = {
    ["1"] = { "<cmd>ToggleTerm 1<cr>", "Abrir terminal" },
    ["2"] = { "<cmd>ToggleTerm 2<cr>", "Abrir terminal" },
    ["3"] = { "<cmd>ToggleTerm 3<cr>", "Abrir terminal" },
    ["4"] = { "<cmd>ToggleTerm 4<cr>", "Abrir terminal" },
    ["5"] = { "<cmd>ToggleTerm 5<cr>", "Abrir terminal" },
  },
  K = { ":Lspsaga hover_doc<cr>", "Documentacion" },
  c = {
    p = { "<cmd>CccPick<cr>", "Color Picker" },
    d = { "<cmd>CccConvert<cr>", "Color convert" },
  },
  z = {
    a = { require("ufo").openFoldsExceptKinds, "Abrir todos los plieges" },
    c = { require("ufo").closeFoldsWith, "Cerrar todos los plieges" },
  },
  ["<F6>"] = { "<cmd>Dispatch browser-sync start --server --files '*.js, *.html, *.css'<cr>" },
}

local topts = {
  mode = "t",           -- TERMINAL mode
  prefix = "",
  buffer = nil,         -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,        -- use `silent` when creating keymaps
  noremap = true,       -- use `noremap` when creating keymaps
  nowait = true,        -- use `nowait` when creating keymaps
}

local tmappings = {
  ["<Esc>"] = { "<C-\\><C-n>", "Modo normal terminal" },
  ["<A-m>"] = { "<cmd>ToggleTerm<cr>", "Abrir terminal" },
}

local vopts = {
  mode = "v",           -- VISUAL mode
  prefix = "<leader>",
  buffer = nil,         -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,        -- use `silent` when creating keymaps
  noremap = true,       -- use `noremap` when creating keymaps
  nowait = true,        -- use `nowait` when creating keymaps
}

local vmappings = {
  ["<leader>"] = {
    s = { ":SearchBoxIncSearch visual_mode=true<cr>", "Searching" },
  },
}

local iopts = {
  mode = "i",           -- INSERT mode
  prefix = "",
  buffer = nil,         -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,        -- use `silent` when creating keymaps
  noremap = true,       -- use `noremap` when creating keymaps
  nowait = true,        -- use `nowait` when creating keymaps
}

local imappings = {
  ["<C-a>"] = { "<left>", "Movements" },
  ["<C-s>"] = { "<down>", "Movements" },
  ["<C-w>"] = { "<up>", "Movements" },
  ["<C-d>"] = { "<right>", "Movements" },
  ["<C-c>"] = { "<cmd>CccPick<cr><cr>", "Color-Picker" },
  ["<A-j>"] = { "<Esc>:m .+1<cr>==", "Mover abajo linea" },
  ["<A-k>"] = { "<Esc>:m .-2<cr>==", "Mover arriba linea" },
  ["<C-q>"] = { ":Vista!!<cr>", "Vista" },
}

local which_key = require "which-key"

which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(tmappings, topts)
which_key.register(imappings, iopts)
