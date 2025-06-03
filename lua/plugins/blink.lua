return {
  {
    "saghen/blink.cmp",
    event = { "InsertEnter" },
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
        dependencies = {
          "justinsgithub/wezterm-types",
        },
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
      "hrsh7th/cmp-nvim-lua",
      "MahanRahmati/blink-nerdfont.nvim",
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
          ["<C-e>"] = { "accept", "fallback" },
          ["<C-q>"] = { "cancel", "fallback" },
        },
        sources = {
          default = {
            "lsp",
            "path",
            "snippets",
            "buffer",
            "nerdfont",
          },
          per_filetype = {
            sql = { "snippets", "dadbod", "buffer" },
            lua = {
              "lazydev",
              "lsp",
              "path",
              "snippets",
              "buffer",
              "nerdfont",
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
            nerdfont = {
              name = "Nerd Fonts",
              module = "blink-nerdfont",
              score_offset = 15,
              opts = { insert = true },
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
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
            draw = {
              columns = {
                { "kind_icon" },
                { "label", gap = 1 },
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
        fuzzy = {
          implementation = "prefer_rust",
        },
      }
    end,
  },
}
