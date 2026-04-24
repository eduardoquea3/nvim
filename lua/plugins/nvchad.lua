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
        "ccs",
        "<cmd>Shades<cr>",
        desc = "Shades",
      },
    },
  },
}
