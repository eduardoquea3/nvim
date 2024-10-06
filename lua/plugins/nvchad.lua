return {
  { "nvchad/volt", lazy = true },
  {
    "nvchad/minty",
    lazy = true,
    keys = {
      {
        "cp",
        function()
          require("minty.huefy").open()
        end,
        desc = "Color Picker",
      },
    },
  },
}
