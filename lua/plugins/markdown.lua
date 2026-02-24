return {
  {
    "OXY2DEV/markview.nvim",
    -- lazy = false,
    -- enabled = false,
    ft = "markdown",
    config = function()
      local headings = require("markview.presets").headings
      local lines = require("markview.presets").horizontal_rules
      local tables = require("markview.presets").tables
      require("markview").setup {
        markdown = {
          headings = headings.simple,
          horizontal_rulers = lines.thick,
          tables = tables.rounded,
        },
      }
    end,
  },
  {
    "OXY2DEV/helpview.nvim",
    lazy = false,
  },
}
