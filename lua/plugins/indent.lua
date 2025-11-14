return {
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
}
