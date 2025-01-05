return {
  {
    "saghen/blink.compat",
    version = "*",
    opts = {},
    lazy = true,
  },
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
      {
        "xzbdmw/colorful-menu.nvim",
        opts = {
          ls = {
            lua_ls = {
              arguments_hl = "@comment",
            },
            vtsls = {
              extra_info_hl = "@comment",
            },
          },
          fallback_highlight = "@variable",
          max_width = 60,
        },
      },
      "davidmh/cmp-nerdfonts",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_vscode").lazy_load {
            paths = {
              vim.fn.stdpath "config" .. "/snippets",
            },
          }
        end,
      },
    },
    version = "*",
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
          default = {
            "lsp",
            "path",
            "snippets",
            "buffer",
            "lazydev",
            "dadbod",
            "nerdfonts",
            "cmdline",
            "nvim_lua",
            "luasnip",
          },
          providers = {
            lazydev = {
              name = "LazyDev",
              module = "lazydev.integrations.blink",
              score_offset = 100,
            },
            dadbod = {
              name = "Dadbod",
              module = "vim_dadbod_completion.blink",
            },
            nerdfonts = {
              name = "nerdfonts",
              module = "blink.compat.source",
            },
            cmdline = {
              name = "cmdline",
              module = "blink.compat.source",
            },
            nvim_lua = {
              name = "nvim_lua",
              module = "blink.compat.source",
            },
            luasnip = {
              name = "luasnip",
              module = "blink.compat.source",
            },
          },
        },
        completion = {
          menu = {
            -- auto_show = function(ctx)
            --   return ctx.mode ~= "cmdline"
            -- end,
            border = "rounded",
            draw = {
              columns = {
                { "kind_icon" },
                { "label", gap = 1 },
                { "kind" },
              },
              components = {
                label = {
                  width = { fill = true, max = 60 },
                  text = function(ctx)
                    local highlights_info = require("colorful-menu").blink_highlights(ctx)
                    if highlights_info ~= nil then
                      return highlights_info.label
                    else
                      return ctx.label
                    end
                  end,
                  highlight = function(ctx)
                    local highlights = {}
                    local highlights_info = require("colorful-menu").blink_highlights(ctx)
                    if highlights_info ~= nil then
                      highlights = highlights_info.highlights
                    end
                    for _, idx in ipairs(ctx.label_matched_indices) do
                      table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
                    end
                    return highlights
                  end,
                },
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
  },
}
