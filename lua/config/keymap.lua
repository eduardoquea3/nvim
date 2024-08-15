function nmap(r, l, d)
	vim.keymap.set("n", r, l, { noremap = true, nowait = true, silent = true, desc = d })
end

function tmap(r, l, d)
	vim.keymap.set("t", r, l, { noremap = true, nowait = true, silent = true, desc = d })
end

function imap(r, l, d)
	vim.keymap.set("i", r, l, { noremap = true, nowait = true, silent = true, desc = d })
end

function vmap(r, l, d)
	vim.keymap.set("v", r, l, { noremap = true, nowait = true, silent = true, desc = d })
end

function cmap(r, l, d)
	vim.keymap.set("c", r, l, { noremap = true, nowait = true, silent = true, desc = d })
end

-- Maps without <leader>
nmap("<Esc>", ":nohlsearch<cr>", "No mostrar resultados de busqueda")
nmap("<C-a>", "zozz", "Abrir pliege")
nmap("<C-c>", "zczz", "Cerrar pliege")
nmap("<C-h>", "<C-w>h", "Movements")
nmap("<C-j>", "<C-w>j", "Movements")
nmap("<C-k>", "<C-w>k", "Movements")
nmap("<C-l>", "<C-w>l", "Movements")
nmap("<A-j>", ":m .+1<cr>==", "Mover abajo linea")
nmap("<A-k>", ":m .-2<cr>==", "Mover arriba linea")
nmap("<A-a>", "ggVG", "select all")
nmap("<Tab>", ":bn<cr>", "Tab Next")
nmap("<S-Tab>", ":bp<cr>", "Tab Previous")
nmap("<up>", "<cmd>resize +2<cr>", "Resize horizontal ++")
nmap("<down>", "<cmd>resize -2<cr>", "Resize horizontal --")
nmap("<left>", "<cmd>vertical resize -2<cr>", "Resize vertical --")
nmap("<right>", "<cmd>vertical resize +2<cr>", "Resize vertical ++")
nmap("sv", "<cmd>vsplit<cr>", "Vertical split")
nmap("ss", "<cmd>split<cr>", "Split")
-- nmap("<leader>bd", "<cmd>bdelete<cr>", "Eliminar buffer")
nmap("<c-w>", "<cmd>bd<cr>", "Eliminar buffer")
nmap("<leader>bd", "<cmd>bp | bd #<cr>", "Eliminar file in split")
nmap("<leader>w", ":w<cr>", "Guardar archivo")

nmap("<leader>a", ":WhichKey<cr>", "Mostrar atajos")
nmap("<leader>rr", ":luafile %<cr>", "Actualizar config")
nmap("<leader>q", ":confirm qall<cr>", "Cerrar neovim")
nmap("<leader>bs", "<c-w>q", "Cerrar split")
nmap("<leader>ll", "<cmd>Lazy<cr>", "Lazy")
nmap("<leader>li", "<cmd>Lazy install<cr>", "Lazy install")
nmap("<leader>lu", "<cmd>Lazy update<cr>", "Lazy update")
nmap("<leader>lc", "<cmd>Lazy clean<cr>", "Lazy clean")
nmap("<leader>lp", "<cmd>Lazy profile<cr>", "Lazy profile")

tmap("<Esc>", "<C-\\><C-n>", "Modo normal terminal")

vmap("<c-l>", "<Esc>", "Modo normal")

imap("<a-h>", "<left>", "Movements")
imap("<a-j>", "<down>", "Movements")
imap("<a-k>", "<up>", "Movements")
imap("<a-l>", "<right>", "Movements")
imap("<c-b>", "<C-left>", "Movements")
imap("<c-e>", "<C-right>", "Movements")
imap("<c-j>", "<Esc><cmd>m .+1<cr>==i", "Mover abajo linea")
imap("<c-l>", "<Esc>l", "Mode normal")
imap("<c-k>", "<Esc><cmd>m .-2<cr>==i", "Mover arriba linea")
imap("<right>", "", "No use")
imap("<left>", "", "No use")
imap("<down>", "", "No use")
imap("<up>", "", "No use")

cmap("<c-l>", "<Esc>", "Mode Normal")

nmap("<leader>m", function()
	local src = require("null-ls").get_source { filetype = vim.bo.filetype }
	if src then
		for _, source in ipairs(src) do
			vim.notify(source.name)
		end
	else
		vim.notify "no se encontro nada"
	end
end, "ff")

-- local opts = {
--   mode = "n",
--   prefix = "",
--   buffer = nil,
--   silent = true,
--   noremap = true,
--   nowait = true,
-- }
--
-- local mappings = {
-- ["<C-a>"] = { "zozz", "Abrir pliege" },
-- ["<C-c>"] = { "zczz", "Cerrar pliege" },
-- ["<C-h>"] = { "<C-w>h", "Movements" },
-- ["<C-j>"] = { "<C-w>j", "Movements" },
-- ["<C-k>"] = { "<C-w>k", "Movements" },
-- ["<C-l>"] = { "<C-w>l", "Movements" },
--   ["<A-j>"] = { ":m .+1<cr>==", "Mover abajo linea" },
--   ["<A-k>"] = { ":m .-2<cr>==", "Mover arriba linea" },
--   ["<A-a>"] = { "ggVG", "select all" },
--   ["<Tab>"] = { ":bn<cr>", "Tab Next" },
--   ["<S-Tab>"] = { ":bp<cr>", "Tab Previous" },
--   ["<up>"] = { "<cmd>resize +2<cr>", "Resize horizontal ++" },
--   ["<down>"] = { "<cmd>resize -2<cr>", "Resize horizontal --" },
--   ["<left>"] = { "<cmd>vertical resize -2<cr>", "Resize vertical --" },
--   ["<right>"] = { "<cmd>vertical resize +2<cr>", "Resize vertical ++" },
--   ["sv"] = { "<cmd>vsplit<cr>", "Vertical split" },
--   ["ss"] = { "<cmd>split<cr>", "Split" },
--   ["<c-w>"] = { "<cmd>bdelete<cr>", "Eliminar buffer" },
--   ["<c-s>"] = { ":w<cr>", "Guardar archivo" },
-- }

-- local lopts = {
--   mode = "n",
--   prefix = "<leader>",
--   buffer = nil,
--   silent = true,
--   noremap = true,
--   nowait = true,
-- }
--
-- local lmappings = {
--   a = { ":WhichKey<cr>", "Mostrar atajos" },
--   r = {
--     r = { ":luafile %<cr>", "Actualizar config" },
--   },
--   q = { ":confirm qall<cr>", "Cerrar neovim" },
--   b = {
--     name = "buffer",
--     s = { "<c-w>q", "Cerrar split" },
--   },
--   l = {
--     name = "Lazy",
--     l = { "<cmd>Lazy<cr>", "Lazy" },
--     i = { "<cmd>Lazy install<cr>", "Lazy install" },
--     u = { "<cmd>Lazy update<cr>", "Lazy update" },
--     c = { "<cmd>Lazy clean<cr>", "Lazy clean" },
--     p = { "<cmd>Lazy profile<cr>", "Lazy profile" },
--   },
-- }
--
-- local topts = {
--   mode = "t",
--   prefix = "",
--   buffer = nil,
--   silent = true,
--   noremap = true,
--   nowait = true,
-- }
--
-- local tmappings = {
--   ["<Esc>"] = { "<C-\\><C-n>", "Modo normal terminal" },
-- }
--
-- local vopts = {
--   mode = "v",
--   prefix = "<leader>",
--   buffer = nil,
--   silent = true,
--   noremap = true,
--   nowait = true,
-- }
--
-- local vmappings = {
--   ["<c-l>"] = { "<Esc>", "Modo Normal" },
-- }
--
-- local iopts = {
--   mode = "i",
--   prefix = "",
--   buffer = nil,
--   silent = true,
--   noremap = true,
--   nowait = true,
-- }
--
-- local imappings = {
--   ["<A-h>"] = { "<left>", "Movements" },
--   ["<A-j>"] = { "<down>", "Movements" },
--   ["<A-k>"] = { "<up>", "Movements" },
--   ["<A-l>"] = { "<right>", "Movements" },
--   ["<C-b>"] = { "<C-left>", "Movements" },
--   ["<C-e>"] = { "<C-right>", "Movements" },
--   ["<C-j>"] = { "<Esc><cmd>m .+1<cr>==i", "Mover abajo linea" },
--   ["<C-l>"] = { "<Esc>l", "Mode Normal" },
--   ["<C-k>"] = { "<Esc><cmd>m .-2<cr>==i", "Mover arriba linea" },
--   ["<right>"] = { "", "No use" },
--   ["<left>"] = { "", "No use" },
--   ["<down>"] = { "", "No use" },
--   ["<up>"] = { "", "No use" },
-- }
--
-- local copts = {
--   mode = "c",
--   prefix = "",
--   buffer = nil,
--   silent = true,
--   noremap = true,
--   nowait = true,
-- }
--
-- local cmappings = {
--   ["<C-l>"] = { "<Esc>", "Modo Normal" },
-- }
--
-- local which_key = require "which-key"
--
-- which_key.register(mappings, opts)
-- which_key.register(vmappings, vopts)
-- which_key.register(tmappings, topts)
-- which_key.register(imappings, iopts)
-- which_key.register(lmappings, lopts)
-- which_key.register(cmappings, copts)
