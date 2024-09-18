local cmp = require "cmp"
local luasnip = require "luasnip"
local lspkind = require "lspkind"
local kind = require("eduardo.icons").kind

lspkind.init {
  mode = "symbol_text",
  preset = "codicons",
  symbol_map = {
    Text = kind.Text,
    Method = kind.Method,
    Function = kind.Function,
    Constructor = kind.Constructor,
    Field = kind.Field,
    Variable = kind.Variable,
    Class = kind.Class,
    Interface = kind.Interface,
    Module = kind.Module,
    Property = kind.Property,
    Unit = kind.Unit,
    Value = kind.Value,
    Enum = kind.Enum,
    Keyword = kind.Keyword,
    Snippet = kind.Snippet,
    Color = kind.Color,
    File = kind.File,
    Reference = kind.Reference,
    Folder = kind.Folder,
    EnumMember = kind.EnumMember,
    Constant = kind.Constant,
    Struct = kind.Struct,
    Event = kind.Event,
    Operator = kind.Operator,
    TypeParameter = kind.TypeParameter,
  },
}

require("luasnip.loaders.from_vscode").lazy_load {
  paths = {
    vim.fn.stdpath "config" .. "/snippets",
  },
}
-- require("luasnip.loaders.from_vscode").lazy_load {}
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = "menuone,noselect,noinsert",
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-n>"] = cmp.mapping.complete {},
    ["<C-y>"] = cmp.mapping.confirm { select = true },
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "lazydev" },
    { name = "nerdfonts" },
  },
  formatting = {
    format = require("lspkind").cmp_format {
      maxwidth = 20,
      ellipsis_char = "...",
      before = require("tailwind-tools.cmp").lspkind_format,
    },
  },
}
