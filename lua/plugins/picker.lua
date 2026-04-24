return {
  {
    "catgoose/nvim-colorizer.lua",
    event = "User FileOpened",
    config = function()
      require("colorizer").setup {
        filetypes = { "*" },
        options = {
          parsers = {
            css = true, -- preset: enables names, hex, rgb, hsl, oklch
            css_fn = true, -- preset: enables rgb, hsl, oklch
            names = {
              enable = false, -- enable named colors (e.g. "Blue")
            },
            hex = {
              default = true, -- default value for unset format keys (see above)
              rgb = true, -- #RGB (3-digit)
              rgba = true, -- #RGBA (4-digit)
              rrggbb = true, -- #RRGGBB (6-digit)
              rrggbbaa = true, -- #RRGGBBAA (8-digit)
              hash_aarrggbb = true, -- #AARRGGBB (QML-style, alpha first)
              aarrggbb = true, -- 0xAARRGGBB
              no_hash = true, -- hex without '#' at word boundaries
            },
            rgb = { enable = true }, -- rgb()/rgba() functions
            hsl = { enable = true }, -- hsl()/hsla() functions
            oklch = { enable = true }, -- oklch() function
            tailwind = {
              enable = true, -- parse Tailwind color names
              lsp = true, -- use Tailwind LSP documentColor
              update_names = true, -- update color names from LSP results
            },
            sass = {
              enable = false, -- parse Sass color variables
            },
            css_var_rgb = { enable = true }, -- CSS vars with R,G,B (e.g. --color: 240,198,198)
          },
          display = {
            mode = "virtualtext", -- "virtualtext"|"background"|"foreground"
            virtualtext = {
              char = " ", -- character used for virtualtext
              position = "eol", -- "eol"|"before"|"after"
              hl_mode = "foreground", -- "background"|"foreground"
            },
            priority = {
              default = 150, -- extmark priority for normal highlights
              lsp = 200, -- extmark priority for LSP/Tailwind highlights
            },
          },
        },
      }
    end,
  },
}
