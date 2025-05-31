return {
  {
    "nvzone/minty",
    lazy = true,
    dependencies = "nvzone/volt",
    cmd = { "Shades", "Huefy" },
    keys = {
      {
        "cp",
        "<cmd>Huefy<cr>",
        desc = "Color Picker",
      },
      {
        "cs",
        "<cmd>Shades<cr>",
        desc = "Shades",
      },
    },
  },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
    keys = {
      { "<leader><leader>t", "<cmd>Typr<cr>", desc = "Typr" },
      { "<leader><leader>s", "<cmd>TyprStats<cr>", desc = "Typr Stats" },
    },
  },
  {
    "nvzone/timerly",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Timerly" },
    keys = {
      { "<leader><leader>tm", "<cmd>Timerly<cr>", desc = "Timerly" },
    },
  },
}
