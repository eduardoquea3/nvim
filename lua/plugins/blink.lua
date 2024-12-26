return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "*",
  --@module "blink.cmp"
  --@type blink.cmp.config
  opts = function()
    local icons = require "eduardo.icons"
    return {
      keymap = {
        preset = "default",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Cr>"] = { "accept", "fallback" },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "lazydev" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
      completion = {
        menu = {
          border = "rounded",
          draw = {
            columns = {
              { "kind_icon", "label", gap = 1 },
              { "kind" },
            },
          },
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
        kind_icons = {
          Text = icons.kind.Text,
          Method = icons.kind.Method,
          Function = icons.kind.Function,
          Constructor = icons.kind.Constructor,

          Field = icons.kind.Field,
          Variable = icons.kind.Variable,
          Property = icons.kind.Property,

          Class = icons.kind.Class,
          Interface = icons.kind.Interface,
          Struct = icons.kind.Struct,
          Module = icons.kind.Module,

          Unit = icons.kind.Unit,
          Value = icons.kind.Value,
          Enum = icons.kind.Enum,
          EnumMember = icons.kind.EnumMember,

          Keyword = icons.kind.Keyword,
          Constant = icons.kind.Constant,

          Snippet = icons.kind.Snippet,
          Color = icons.kind.Color,
          File = icons.kind.File,
          Reference = icons.kind.Reference,
          Folder = icons.kind.Folder,
          Event = icons.kind.Event,
          Operator = icons.kind.Operator,
          TypeParameter = icons.kind.TypeParameter,
        },
      },
      signature = {
        enabled = true,
        window = {
          border = "rounded",
        },
      },
    }
  end,
  opts_extend = { "sources.default" },
}
