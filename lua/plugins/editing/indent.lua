return {
  {
    "saghen/blink.indent",
    cond = true,
    enabled = true,
    event = "BufRead",
    opts = {
      static = {
        enabled = true,
        char = "▎",
      },
      scope = {
        enabled = true,
        char = "▎",
        highlights = {
          "BlinkIndentRed",
          "BlinkIndentBlue",
          "BlinkIndentCyan",
          "BlinkIndentYellow",
          "BlinkIndentGreen",
        },
        underline = {
          enabled = true,
          highlights = {
            "BlinkIndentRedUnderline",
            "BlinkIndentBlueUnderline",
            "BlinkIndentCyanUnderline",
            "BlinkIndentYellowUnderline",
            "BlinkIndentGreenUnderline",
          },
        },
      },
    },
  },
  {
    "saghen/blink.pairs",
    version = "*", -- (recommended) only required with prebuilt binaries
    dependencies = "saghen/blink.download",

    --- @module 'blink.pairs'
    --- @type blink.pairs.Config
    opts = {
      mappings = {
        enabled = true,
        cmdline = true,
        disabled_filetypes = {},
        wrap = {
          ["<C-b>"] = "motion",
          ["<C-S-b>"] = "motion_reverse",
        },
        pairs = {},
      },
      highlights = {
        enabled = true,
        cmdline = true,
        groups = { "BlinkPairsOrange", "BlinkPairsPurple", "BlinkPairsBlue" },
        unmatched_group = "BlinkPairsUnmatched",

        matchparen = {
          enabled = true,
          cmdline = false,
          include_surrounding = false,
          group = "BlinkPairsMatchParen",
          priority = 250,
        },
      },
      debug = false,
    },
  },
}
