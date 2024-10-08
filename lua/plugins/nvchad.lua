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
  {
    "nvchad/menu",
    lazy = true,
    keys = {
      {
        "<RightMouse>",
        function()
          vim.cmd.exec '"normal! \\<RightMouse>"'

          local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
          require("menu").open(options, { mouse = true })
        end,
        desc = "Open Options",
      },
    },
  },
}
