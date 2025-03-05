return {
  {
    "saghen/blink.cmp",
    event = { "User FileOpened", "CmdlineEnter" },
    dependencies = {
      {
        "saghen/blink.compat",
        version = "*",
        opts = {},
        lazy = true,
      },
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "wezterm-types", mods = { "wezterm" } },
          },
        },
      },
      "rafamadriz/friendly-snippets",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
      },
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
    },
    version = "*",
    opts = function()
      local icons = require "eduardo.icons"
      return {
        cmdline = {
          enabled = true,
          completion = {
            ghost_text = { enabled = false },
            menu = { auto_show = true },
          },
        },
        keymap = {
          preset = "default",
          ["<Tab>"] = { "select_next", "fallback" },
          ["<S-Tab>"] = { "select_prev", "fallback" },
          ["<Cr>"] = { "accept", "fallback" },
          ["<C-n>"] = { "show", "fallback" },
        },
        sources = {
          default = {
            "lsp",
            "path",
            "snippets",
            "buffer",
            "nerdfonts",
          },
          per_filetype = {
            sql = { "snippets", "dadbod", "buffer" },
            lua = {
              "lazydev",
              "lsp",
              "path",
              "snippets",
              "buffer",
              "nerdfonts",
              "nvim_lua",
            },
          },
          providers = {
            snippets = {
              opts = {
                search_path = vim.fn.stdpath "config" .. "/snippets",
              },
            },
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
              min_keyword_length = 5,
            },
            cmdline = {
              name = "cmdline",
              module = "blink.compat.source",
            },
            nvim_lua = {
              name = "nvim_lua",
              module = "blink.compat.source",
            },
          },
        },
        completion = {
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
            window = {
              border = "rounded",
            },
          },
          menu = {
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
  },
}
